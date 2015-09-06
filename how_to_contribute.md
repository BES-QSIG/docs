---
layout: doc
status: complete
title: How to contribute
---

_You will need a GitHub account, if you do not already have one click
[here](https://github.com/) to sign up._

## Small online edits

To make a small edit follow these steps:

1. At the top of every tutorial (like this one where it says 'Click here to
edit') there is a link to the document's source, click it and you will be taken
to the GitHub website where the document is held.
2. At the top of the document's contents there is an edit button (see below),
clicking will show a raw text version of the file.
3. Make your changes to the file using the Markdown syntax (see this
    [tutorial][intro-md]
    to learn Markdown)
4. When you've finished editing you need to propose the changes, scroll to the
bottom of the page to find the 'Propose file change' section. Simply write a
short and optional extended description of the changes you made and click
'Propose file change.'
5. And that's it!

**The online edit button**

![edit-button][edit-button]

Once your changes have been proposed, they will be reviewed by a 'docs-keeper'.
If accepted, the changes will be added to the original document and will appear
on the website within one or two days.

## Large online edits

For more substantial edits which cannot be done in a single sitting:

1. You will need to 'fork' (i.e. copy) the docs repo to your own GitHub account.
Click the 'fork' button on the docs repo (found [here][docs-repo]).
(Note, clicking the edit button automatically does this.)
2. Once forked, the docs repo will be copied to a repository in your GitHub
repositories.
3. You can make changes to any files in this repository using the online edit
button.
4. Every change you make can be 'saved' by committing your changes to your copy
of the repository in the 'Commit changes' section at the bottom of the page.
5. You can add new documents by clicking the + symbol at the top of the
repository page. Give the new file a name and the extension '.md'.
6. Once you're happy with your changes you need to merge them with the original
docs repo. Click the green compare button.
This page will show how your version of the repo differs from the original repo.
To merge your changes with the original, click 'Create pull request' at the top
of the page.
7. And that's it!

**The fork button**

![fork-button][fork-button]

**The green compare button**

![compare-button][compare-button]

Again, your changes will be reviewed by a 'docs-keeper' and if accepted will
appear on the website within one or two days.

## Offline editing

For more freedom, it's best to clone the docs repo to your local computer:

1. Fork the docs repo to your own GitHub account.
2. Clone the repo to your local machine: `git clone https://github.com/username/docs.git`
3. On your computer you can edit the files, add new files including image files.
4. Commit and push your changes to your version on your Github account.
5. For more details on using git, see the [tutorial][git-basics] on git basics.
5. Merge your changes by making a pull request!

## Become a docs-keeper!

To edit files on the repo without the need for pull requests you will need to
join the docs-keepers' team in the [BES-QSIG GitHub account](https://github.com/BES-QSIG).

If you would like to contribute a lot and join the team, please email:
dominic.john.bennett@gmail.com.

Anyone and everyone welcome!

<!-- References -->
[docs-repo]: https://github.com/BES-QSIG/docs/
[intro-md]: {{ site.baseurl }}/docs/introduction_to_markdown
[git-basics]: {{ site.baseurl }}/docs/git_basics
[edit-button]: https://help.github.com/assets/images/help/repository/edit-file-edit-button.png "Click here to edit the Markdown file online"
[fork-button]: https://help.github.com/assets/images/help/repository/fork_button.jpg "Fork button"
[compare-button]: https://help.github.com/assets/images/help/pull_requests/pull-request-start-review-button.png 'Compare button'
