---
layout: doc
status: complete
title: Developing this website
---

Here I will describe how to download, set-up and develop the FGE website.

## Website dependencies

* Mac, Linux or other Unix operating system
* [Python][python]
* [Jekyll][jekyll]
* [Git][git]

## Website repositories

The website is held online across two different Git repositories and three
branches. These are:

* [fge, master branch][fge-master](`fge-master`)
* [fge, gh-pages branch][fge-gh-pages](`fge-gh-pages`)
* [docs, master branch][docs-master](`docs`)

## Directory structure

Each of the three different branches need to be downloaded and placed in the
specific directory structure as below, where the `fge/` directory
represents the `fge-master` branch, and `_docs_repo/` and `_site/` are
ignored directories within `fge/` representing the `docs` and
`fge-gh-pages` branches respectively.

```
-fge/
    -_docs_repo@BES-QSIG/docs.git
      [.md files of guides]
    -_site@BES-QSIG/fge/tree/gh-pages
      [hostable website]
    -_layouts/
      [page layouts]
    -_sass/
      [css scripts]
    -_includes/
      [head etc.]
    -css/
      [css script]
    -fonts/
      [fonts]
    -guides/
      [index of guides]
    -js/
      [javascript files]
    -img/
      [cover.jpg etc.]
    -README.md
      [GitHub README]
    -feed.xml
      [RSS feed]
    -index.html
      [home page]
    -.gitignore
      [git ignore]
    -_config.yml
      [Jekyll config file]
    -favicon.ico
      [BES symbol]
```

## Setting up the files and folders

To set up the above directory structure, follow these commands.

```{bash}
# Download a copy of test-cge master branch
git clone https://github.com/BES-QSIG/fge.git
# Move into downloaded folder
cd fge
# Download copy of gh-pages branch, place in folder called _site/
git clone https://github.com/BES-QSIG/fge.git -b gh-pages _site
# Download copy of docs repo, place in folder called _docs_repo/
git clone https://github.com/BES-QSIG/docs.git _docs_repo/
```

## Using Jekyll, build.py and Git to update the website

Once downloaded, make your changes within `docs/` to add or change any of the
tutorials or within `fge/` to edit the look of the website. You can then
upload these changes for each of the three branches.

```{bash}
# Ensure you're in fge/
pwd
# Parse tutorials for hosting on site with build (creates _docs/)
python build.py
# Build website
jekyll build
# Test website locally
jekyll serve
# Navigate your browser to http://127.0.0.1:4000/fge/ to see local version
# Once happy, update each of the three Git repos
git status  # check branch and folder
git add [FILENAME]
git commit [FILENAME] -m [MESSAGE]
# And push the changes
git push
```

There are two steps to building the hostable website in `_site/`. `build.py`
is a custom python script updates guides' front-matter using the git repo to
get authors and last date since update. It places updated docs in `_docs/`
which is what Jekyll looks for when building the wesbite. `jekyll build` then
constructs the hostable website from the layout information, css objects etc.

It is useful to double check the look and functionality of the website
with `jekyll serve` before pushing to GitHub.

For the `gh-pages` branch, version control is not important so you can add and
commit all files and force a push to GitHub.

```{bash}
git status  # make sure this is the gh-pages branch
git add .  # add all files
git commit -a -m [MESSAGE]  # commit all changes
git -f push  # force a push, ignore any conflicts
```

>PLEASE DO NOT DO THIS FOR THE MASTER BRANCHES. For the `fge` master branch
and `docs` repo it's important that all changes are version controlled so that
we can revert to old versions if anything goes wrong. Make sure you add and
commit any new files and commit any changes to original files with commit
messages. It is especially important you do not use the `-f` flag when pushing
to GitHub, as you may overwrite someone else's work.

Note, the website is built in the `_site/` directory and GitHub uses this
directory as the `gh-pages` branch to construct the website. Therefore, the
website will not change if the `gh-pages` branch is not updated.

<!-- References -->
[python]: https://www.python.org/
[jekyll]: http://jekyllrb.com/
[git]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[fge-master]: https://github.com/BES-QSIG/fge
[fge-gh-pages]: https://github.com/BES-QSIG/fge/tree/gh-pages
[docs-master]: https://github.com/BES-QSIG/docs
