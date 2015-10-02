---
layout: doc
status: complete
title: How to contribute
---

# Contents

* [How to contribute](#how-to-contribute)
* [Online editing](#online-editing)
* [Doc-Keepers](#doc-keepers)

# How to contribute

To contribute to the FGE website you will need the following:

* A GitHub account (click [here](https://github.com/) to sign up)
* A knowledge of Markdown for creating the documents (see this
  [page](http://bes-qsig.github.io/fge/docs/introduction_to_markdown/) for a
  simple guide)

All documents hosted on this website are held in the [docs repository](https://github.com/BES-QSIG/docs/)
as part of the British Ecological Society's Quantitative Ecology Special
Interest Group (BES-QSIG) GitHub organisation. In order to edit or add documents
you must first fork this repository. If you are not familiar with GitHub, then
below is a walkthrough of how to edit the documents hosted on the FGE website
through GitHub's website -- 'Online editing'.

All documents provided must be in Markdown script. Please save your documents
with the .md extension e.g. `[name_file].md`. At the top of every document
please provide this 'front matter':

    ---
    layout: doc
    status: complete
    title: How to contribute
    ---

Front matter tells the website how to interpret the document.

* `layout`: type of document (always doc)
* `status`: e.g. complete, incomplete, in progress (free text)
* `title`: Introduction to ..., How to .... (free text)

If you have created a new document please also update the [`index.yml`](https://github.com/BES-QSIG/docs/blob/master/index.yml).
This tells the website where to index the new document. It groups related documents
under different themes. For example, at the top of the index is:

```
- title: FGE
  docs:
    - introduction_to_markdown
    - how_to_contribute
    - developing_this_website
```

This places introduction_to_markdown, how_to_contribute and developing_this_website
into the theme titled FGE. Please add new titles following the syntax above if
a new document does not fit into any existing themes.

# Online editing

GitHub is an online database of git repositories. These can be thought of as
folders where every file or folder contains a history of every change ever made
to it. The walkthrough below will describe how you can make changes to the BES-QSIG
docs repository. It covers three GitHub concepts:

* Forking
* Editing online with GitHub
* Pull requests


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

Please make sure you use the .md file extension and include front matter as described above.

## Creating a pull request

Navigating to the main page of your copy of the docs repository will show how many commits ahead your copy of the repository (called a branch) is compared to the original.
In this example, it is 1 commit ahead of the BES-QSIG:master. You can have as many commits as you wish, including changes and new files.

![pull-request-1](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/pull-request-1.png "Pull request 1")

Clicking on compare will show us how our branch and the BES-QSIG:master branch differ. Additions are marked in green and deletions are marked in red. In this example, the two branches can be readily merged allowing us to perform a 'pull request'.

![pull-request-2](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/pull-request-2.png "Pull request 2")

A 'pull request' is used to merge two branches, "please could you pull my branch into your branch". If we click on 'pull request' GitHub will invite us to describe the changes we have made by showing us a similar screen to what we see when we make commits. In this case it is just one commit, but it could be many.

![create-pull-request](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/create-pull-request.png "Opening a pull request")

Clicking 'create pull request' will inform the maintainers of
the docs repository that someone wishes to make a change. This is done by creating a page where maintainers can view your changes and discuss them with you.

![opened-pull-request](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/opened-pull-request.png "An open pull request")

If the maintainer is happy with the changes in your branch, they will merge your branch and the original and your changes will be incorporated into the FGE website within a few days.

# Doc-Keepers

To edit files on the repo without the need for forking or pull requests you will need to
join the doc-keepers' team in the [BES-QSIG GitHub organisation](https://github.com/BES-QSIG). If you join this team you will have write access to the docs repository and can add or edit documents directly.

If you would like to join the team, please email:
dominic.john.bennett@gmail.com
