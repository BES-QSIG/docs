---
layout: doc
status: complete
author: [Dom Bennett]
title: Developing this website
permalink: /docs/developing_this_website/
---

# Developing this website

Here we will describe how to download, update and upload changes for this
website. (Note, here we describe the website for `test-cge`, in the future this
may change to just `cge`.)

## Website dependencies

* Mac, Linux or other Unix operating system
* [Jekyll][jekyll]
* Git

## Website repositories

The website is held online across two different Git repositories and three
branches. These are:

* [test-cge, master branch][test-cge-master](`test-cge-master`)
* [test-cge, gh-pages branch][test-cge-gh-pages](`test-cge-gh-pages`)
* [docs, master branch][docs-master](`docs`)

## Directory structure

Each of the three different branches need to be downloaded and placed in the
specific directory structure as below, where the `test-cge/` directory
represents the `test-cge-master` branch, and `_docs/` and `_site/` are
ignored directories within `test-cge/` representing the `docs` and
`test-cge-gh-pages` branches respectively.

```
-test-cge/
    -_docs@BES-QSIG/docs.git
    -_site@BES-QSIG/test-cge/tree/gh-pages
    -_layouts/
        -default.html
        -page.html
        -doc.html
        -post.html
    -_sass/
        -_base.scss
        -_layout.scss
        -_syntax-highlighting.scsss
    -_includes/
        -footer.html
        -header.html
        -head.html
    -_posts/
        -[UPDATED OFTEN]
    -css/
        -main.scss
    -news/
        -index.md
    -README.md
    -about.md
    -feed.xml
    -index.md
    -.gitignore
    -_config.yml
```

## Setting up the files and folders

To set up the above directory structure, follow these commands.

```{bash}
# Download a copy of test-cge master branch
git clone https://github.com/BES-QSIG/test-cge.git
# Move into downloaded folder
cd test-cge
# Download copy of gh-pages branch, place in folder called _site/
git clone https://github.com/BES-QSIG/test-cge.git -b gh-pages _site
# Download copy of docs repo, place in folder called _docs/
git clone https://github.com/BES-QSIG/docs.git _docs
```

## Using Jekyll and Git to update the website

Once downloaded, make your changes within `docs/` to add or change any of the
tutorials or within `test-cge/` to edit the look of the website. You can then
upload these changes for each of the three branches.

```{bash}
# Ensure you're in test-cge/
pwd
# Build website
jekyll build
# Test website locally
jekyll serve
# Once happy, update each of the three Git repos
git status  # check branch and folder
git add [FILENAME]
git commit [FILENAME] -m [MESSAGE]
# And push the changes
git push
```

For the `gh-pages` branch, version control is not important so you can add and
commit all files and force a push to GitHub.

```{bash}
git status  # make sure this is the gh-pages branch
git add .  # add all files
git commit -a -m [MESSAGE]  # commit all changes
git -f push  # force a push, ignore any conflicts
```

PLEASE DO NOT DO THIS FOR THE MASTER BRANCHES. For the `test-cge` master branch
and `docs` repo it's important that all changes are version controlled so that
we can revert to old versions if anything goes wrong. Make sure you add and
commit any new files and commit any changes to original files with commit
messages. It is especially important you do not use the `-f` flag when pushing
to GitHub, as you may overwrite someone else's work.

Note, the website is built in the `_site/` directory and GitHub uses this
directory as the `gh-pages` branch to construct the website. Therefore, the
website will not change if the `gh-pages` branch is not updated.

<!-- References -->
[jekyll]: http://jekyllrb.com/
[test-cge-master]: https://github.com/BES-QSIG/test-cge
[test-cge-gh-pages]: https://github.com/BES-QSIG/test-cge/tree/gh-pages
[docs-master]: https://github.com/BES-QSIG/docs
