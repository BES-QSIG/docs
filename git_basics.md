---
layout: doc
status: complete
title: Git basics
source: http://fdschneider.github.io/blog/2014/git_for_scientists/
source_author: Florian D. Schneider
---


First a few words in general about what *git* actually is and what it can do.

Git is a very little programm. It can be applied to keep track of changes made to *any directory on your computer*. It creates a hidden folder called `.git` within your directory (subsequently called a *repository* ) that simply is an archive of all changes made to any file. In principle, you can anytime go back and forth between the versions.

I see two main purposes of it:

- The very first purpose is **version control** of a project. This can be a piece of software or a written document, for example. As a developer or author you might want to keep track of your progress. Maybe you want to go back to earlier versions, because you somehow messed it up, or just because you liked it better. This ensures a continuous improvement of your project.
- The second purpose is **collaboration**. *git* allows you to share the whole project with others. It tracks, who was doing changes on the project's files and is able to merge things together if the collaborators were working on different parts of the projects.
- If you think about it, this is also exactly the thing you need if you are working from different computers, e.g. from work and from home. So we can add **synchronisation** to that list.

*git* also helps with building up an organisational structure for complex software development. It is easy to work on different parts of the project at the same time and merge those *branches* afterwards.

There is an excellent [documentation for git](http://git-scm.com/book/) and many blog posts and forum threads that provide help. I will summarise in the following lines how you install git and how you would use it in your everyday workflow.

## Installation

The actual program is a command line tool. It is run with very simple and universal prompts (see below). But there are graphical user interfaces (GUIs) as well. I mention some for use in Windows below. However, I think it is a good idea to get used to the command line tools before you simplify the workflow by using one of the GUIs.

-  	**in Linux (described for Debian/Ubuntu here) **: in any case you first will have to install *git* with

			sudo apt-get update
			sudo apt-get install git

	and [configure it](http://git-scm.com/book/en/Getting-Started-First-Time-Git-Setup).

			git config --global user.name "Your name"
			git config --global user.email your@email.com
			git config --global core.editor gedit

	This just tells *git* under which name commits should be performed and which texteditor to use to prompt for obligatory messages.

 - 	**in Windows:** Even if you don't use [GitHub](https://www.github.com) (see below) to host your repositories, [GitHub Desktop](https://desktop.github.com/) is a clean and convenient tool to use. It sets up a command line shell that includes all the Linux utility that is required for *git*, including `ssh` and merging tools for file conflicts. However, the actual 'GitHub for Windows' program is uses a completely different vocabulary (syncing, updating) than the actual *git*, which might be confusing for beginners.

	You also could use independent GUI clients which have more functionality. [TortoiseGIT](https://tortoisegit.org/) and [MsysGit](https://code.google.com/p/msysgit/) provide an integration in the Windows Explorer right-click menu, besides providing a command line shell with all the tools and GUI's you need.

	You might be tempted to use the Linux emulation Cygwin for git. Combining *git* and *Cygwin*'s `ssh` is quite a challenge, because you need to tell the *Cygwin* programs, where your actual home directory is located. It's tricky but possible.

	If you use one of the latter options, some steps might be necessary to [configure git](http://git-scm.com/book/en/Getting-Started-First-Time-Git-Setup). Open the installed terminal/bash and type

			git config --global user.name "Your name"
			git config --global user.email your@email.com
			git config --global core.editor notepad

-  **for Mac:** A free Mac version of [Github Desktop](https://desktop.github.com/) is available. A powerful commercial client for Mac is [Tower](http://www.git-tower.com/).
-   Independend of your operating system, *R Studio* as well as *Eclipse* provide integrations for *git*. These allow you to add, commit and push from the application, without changing to a terminal window or other client.
  There also are some platform independent commercial clients, like [SmartGit](http://www.syntevo.com/smartgit/) or [Sourcetree](https://www.sourcetreeapp.com/).


## basic functionality

This is only a collection of the most important commands you will need. For more information on what *git* actually does to your data and what you can do if you have lost your HEAD, read the excellent [Git Pro Book](http://git-scm.com/book) by Scott Chacon on the [official *git* website](http://git-scm.com/).  

- The traditional way to work with Git repositories is to use command line prompts. This allows you to do all the necessary steps like (1) *stage* recently changed files to be added to the repository, and (2) *commit* files to the repository (http://git-scm.com/book).
- If you are working with a remote repository, e.g. for sharing the project with collaborators or syncing different computers, you will also want to (3) *pull* the recent copy of a remote repository to your local computer and (4) *push* the changed repository back to the remote host.
- Then, once in a while, you might (5) *tag* a particularly important version of your code (e.g. if a certain a milestone is reached), or you need to (6) *check out* an earlier version of your files (because you messed it up) or (7) use *branch* and *merge* for your try-and-error code development.

### everyday Workflow

#### status

If you want to see, if your repository was changed since the last pull, or if some data are already staged for commit, you can type

		git status



#### staging, *a.k.a.* adding

The purpose of staging is to make a clean selection of the changes that are tracked at the next commit to your repository. This allows you to avoid cluttering your version history. it also allows you to separate changes made in a particular part of the project, e.g. the manuscript, from the changes in another part, e.g. simulation code. Staging generally happens with `git add`.

		git add filename.r

or

		git add folder

Running a `git status` afterwards will show you that this file/folder is listed for the next commit. However, usually you do not want to add only one file.

**Staging entire folders or all files:** Before you try that, you might want to specify a `.gitignore` file in your git repository. This file excludes files from automated adding to the next file commit. Otherwise you will add files which are not supposed to be put under version control, e.g. auxiliary files from LaTeX or created pdfs or huge binary data files.  

First, preview which files are going to be staged using the option `-n`:

		git add -n .

If you are happy with this file list, you can stage all:

		git add .

#### committing

So once you are happy with the files staged, you can commit.

		git commit -m "<add message here>"

This is adding an object to your *git* repository, which can be identified by an absolutely unique name, the SHA-1 hash. It might look something like `803ea39a0feed898027bd84dd5bcdfb11f781893`. This object contains the name of the previous commit, a time stamp and the message you added, as well as all the changes you made compared to the previous commit, plus of course, your name and e-mail adress.

Those changes are now saved and tracked in your local repository.

**Messages** are obligatory in *git*. If running git from command line, the easiest way to add comments is specify the parameter `-m`. If you don't do it, an editor window will pop up and ask you to enter a message. It is very important to choose a concise and descriptive message, because it will allow you to quickly find that one commit where you changed that particular thing.

So, don't become lazy on commit messages!

![from: [xkcd.com](http://www.xkcd.com/1296/)](http://imgs.xkcd.com/comics/git_commit.png)
<figcaption> from: <a href ="http://www.xkcd.com/1296/">xkcd.com</a> </figcaption>


### working with remotes

For sharing with collaborators or syncing your computers, you need to push your recent commits with a remote repository, e.g. on your local server or on GitHub. This assumes that you have a working SSH connection to the remote git repository. [Here is a comprehensible guide by Glenn Murray how to set this up](http://inside.mines.edu/fs_home/gmurray/HowTo/sshNotes.html).

#### pulling

 If you want to pull (don't confuse: in subversion this is called 'check out') from a remote repository, e.g. on the workstation or on GitHub, you need to type

		git pull origin master

Here, you specify from which remote server (here `origin`) you want to pull which branch (here `master`). Your repository holds a list of known servers for this particular repository. You can see this list if you type

		git remote -v

This returns you a list of names that are valid for the use in place of `origin`. A repository cloned (see below) from somewhere stores the location of it's parent under the name `origin`. So in that case (i.e. in most cases) you probably need to write

		git pull origin master

Sometimes you need to set an additional remote for your repository. This can be done via

		git remote <name> git@github.com:~youraccount/nameofrepository.git

which enables you to pull from that repository afterwards:

		git pull <name> master

After a successful pull you will have an exact match of the files in branch `master` that are stored on the remote repository in your local repository.

#### pushing

Remember from pulling that your local repository knows the location of it's own remote clones. `git remote -v` will show you all of those.
To push your local changes to the one called `origin`, simply do

		git push origin master

That's all you need for the everyday workflow.


### Once-in-a-while things

First of all, there are different ways how you can obtain a repository on your local computer: Cloning an existing repository (somewhere online or elsewhere on your computer) or creating a new repository.

#### create a local repository

After installing *git* (see below), you are able to spawn git repositories wherever you like. Create a folder and initialise.

		cd path/to/your/projects/
		mkdir newrepository
		cd newrepository
		git init

#### cloning

If you want to get a copy of an existing repository from somewhere else you need to clone it.  

		cd path/to/your/projectdirectory/
		git clone git@serverip:~/pathtorepository/namerepository.git

This also initialises the `origin` of this repository for convenient pull and push (see above). Each repository keeps a list of the known remotes, i.e. copies of this repository on other computer. you can call them

		git remote -v

The default name of the parent copy, from where and to where you pull and push updates, is simply `origin`. But it can be renamed to a more meaningful name, e.g. *github*

		git remote rename origin github


#### create a remote copy

You might want to backup your repository or share it with somebody via a remote server or even via dropbox or a USB-stick. You need to initialise an empty repository on a remote server and specify it as a remote for your own repository. So, first, go to the remote drive (or any other drive that you can share with your collaborators) and create the remote repository as *bare* directory.

		git init --bare newrepository.git

Then, in your local repository, set a new remote called workstation

		git remote add  git@kefi118:~/repos/repository.git

Forking is basically the same thing, but without the intention of merging the development paths back together.

#### tagging

With certainty you will have milestones in the project. Even if you might not call them 'milestones', there are points in time during the project which are important to remember. Such milestones might be quite obvious, like  

-  the submission of a manuscript
-  the start of an intensive simulation run

but they also might be less important or obvious, but still important to have a permanent reference.

-  handing out the manuscript to somebody else for pre-review
-  handing out the code for review
-  having finished work on an important element of your simulations (e.g. a function)

In those cases you might want to add a [tag](http://git-scm.com/book/en/Git-Basics-Tagging) to your project. This is a lable that is easy to find again. A reference in project-time.

See a list of the existing tags on the project with

		git tag

For all the cases mentioned above, it is best to use *annotated* tags, which are able to restore the recent content of the project and contain additional information. You can save a tag by typing

		git tag -a v0.2 -m "second internal review"

However, like branches (see below), tags are not pushed to or pulled from a remote by default. This means, if you want to share the tag, you need to push it to the remote repository, e.g. by typing

		git push origin v0.2

If you want to restore somebody elses tag, you need to pull it first.

		git pull origin v0.2

Be aware, that now your working directory will show the state of the repository that was tagged. Of course, all later work is still there. You can switch the view of your working directory any time back to master by using

		git checkout master

### resolving conflicts

*git* is quite robust against errors. It can easily handle changes that were done by different people on the same file, as long as they do not affect the same line of code or text.

But of course this might happen. In such a case, *git* will complain when you pull or push your changes to or from the remote and write both alternatives into your file. You will need to decide manually, which line is the more recent or *better* version. There are tools that help you comparing versions, depending on your operating system.

There are some other conflicts that might occur. If that happens, check out the manual or do a web search.


### time travelling

Well. That is what *git* is all about.

You can restore any previous commit, tag or branch. Simply go back to a tag by typing

		git checkout v0.2

You will see that now the content of your working directory is just reset to the point in project-time where you set the tag. You can look at the files and work with them. You can create new commits and develop the project anew. But be aware that you just create a *branch* on your project tree by doing that.

Note that any commit can be checked out. Not only tagged ones. Just use the leading digits of your target commit hash.

    git checkout 803ea39a

You can go back to your most recent `master` branch, by typing

		git checkout master

And your working directory is just as it was before.  

### … all the other stuff

For now, we'll leave out all the more advanced things like branching and merging. It is not really necessary for individual work. Most beginners would usually develop code in a linear history, always staying on the master branch.
