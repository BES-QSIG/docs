---
layout: doc
status: complete
title: How to contribute
---

# How to contribute

The FGE website depends on GitHub, to contribute you will need an account. If
you don't have one, click [here](https://github.com/) to sign up.

You can then make changes to the BES-QSIG docs repo, found [here][docs-repo].

If you are not familiar with GitHub, then below are walkthroughs (online and offline) of how to make
changes to existing documents and create new documents in the `docs/` repository.

You will need to be familiar with Markdown. See this [guide](http://bes-qsig.github.io/fge/docs/introduction_to_markdown/) for a quick tutorial.

## Contents

1. [Online editing](#Online-editing)
2. [Offline editing](#offline-editing)
3. [Doc-Keepers](#doc-keepers)

# Online editing

## Forking

To prevent spamming, the master copy of the docs repository is protected from
anyone making changes to it. In order for you to make changes or add new files
it must first be copied to your own GitHub account, this is called forking in
GitHub terminology.

To make a copy go to the docs repository url (https://github.com/BES-QSIG/docs)
and click fork.

![fork-button](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/fork-button.png "The fork button")

You will now find a copy of the repository in your own GitHub account (Profile --> Repositories).

![forked-repository](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/forked-repo.png "A forked repository")

This is your copy and you can make any changes you want.

## Making changes

Selecting one of the documents (e.g. how to contribute) you can make changes to a file directly using GitHub's edit button.

![edit-button](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/edit-button.png "The edit button")

This will open a text editor where you can modify the Markdown script. In this example I have added a new title and some text.

![editing](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/editing.png "Editing")

We can preview how the Markdown script will be parsed by clicking the preview changes. Handily, GitHub has highlighted where the additions have occurred with green lines.

![previewing-changes](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/previewing-changes.png "Previewing changes")

GitHub requires any changes made to a file to be 'committed'. This will update the file with the change you have made and it will record the file's state before the change. All commits made must have a message describing the changes. In this example, our message is 'added new title' and the additional information is 'I've added a new title and new text.' We will commit these changes directly to our copy of the docs repo (termed here as the 'master branch'). (Selecting 'Create a new branch for this commit and start a pull request' would skip the pull request section below.)

![commit](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/commit.png "Committing the change")

## Adding new files

To create a new file (text based files only) click the + symbol.

![adding-files](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/adding-files.png "Add file")

This will take you to a new editing screen where you write your markdown and preview as before.

![creating-files](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/creating-files.png "Creating file")

Please make you use the .md file extension and include front matter as described in the [introduction to markdown guide](http://bes-qsig.github.io/fge/docs/introduction_to_markdown/).

## Creating a pull request

Navigating to the main page of our copy of the docs repository we can see how many commits ahead our copy of the repository (called a branch) is compared to the original.
In this example, it is 1 commit ahead of the BES-QSIG:master. You can have as many commits as you wish, including changes and new files.

![pull-request-1](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/pull-request-1.png "Pull request 1")

Clicking on compare will show us how our branch and the BES-QSIG:master branch differ. Additions are marked in green and deletions are marked in red. In this example, the two branches can be readily merged allowing us to perform a 'pull request'.

![pull-request-2](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/pull-request-2.png "Pull request 2")

A 'pull request' is used to merge two branches, "please could you pull my branch into your branch". If we click on 'pull request' GitHub will invite us to describe the changes we have made by showing us a similar screen to what we see when we make commits. In this case it is just one commit, but it could be many.

![create-pull-request](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/create-pull-request.png "Opening a pull request")

Clicking 'create pull request' will inform the maintainers of
the docs repository that someone wishes to make a change. This is done by creating a page where maintainers can view your changes and discuss them with you. (These pages are known as 'issues'.)

![opened-pull-request](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/opened-pull-request.png "An open pull request")

If the maintainer is happy with the changes in your branch, they will merge your branch and the original and your changes will be incorporated into the FGE website within a few days.

# Offline editing

For more freedom, it's best to clone the docs repo to your local computer:

1. Fork the docs repo to your own GitHub account.
2. Clone the repo to your local machine: `git clone https://github.com/username/docs.git`
3. On your computer you can edit the files, add new files including image files.
4. Commit and push your changes to your version on your Github account.
5. Merge your changes by making a pull request as described in the online editing above

# Docs-Keepers

To edit files on the repo without the need for pull requests you will need to
join the docs-keepers' team in the [BES-QSIG GitHub account](https://github.com/BES-QSIG).

If you would like to contribute a lot and join the team, please email:
dominic.john.bennett@gmail.com.

All welcome.

<!-- References -->
[docs-repo]: https://github.com/BES-QSIG/docs/
