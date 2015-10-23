---
status: complete
title: How to contribute
---

# How to contribute

To contribute to the FGE website you will need the following:

* A GitHub account (click [here](https://github.com/) to sign up)
* A knowledge of Markdown for creating the documents (see this
  [page](http://bes-qsig.github.io/fge/docs/introduction_to_markdown/) for a
  simple guide)

All documents hosted on this website are held in the [docs repository](https://github.com/BES-QSIG/docs/)
as part of the British Ecological Society's Quantitative Ecology Special
Interest Group (BES-QSIG) GitHub organisation. In order to edit or add documents
you must first fork this repository and then send a pull request with your changes.

If you are not familiar with GitHub, then please follow our step-by-step walkthrough
for making contributions online -- [Contributing online](http://bes-qsig.github.io/fge/docs/contributing_online/).

## What should a guide contain?

Guides can be technical introductions to programming languages, walkthroughs on
performing specific tasks, general explanations of quantitative methods,
tidbits of useful computational information, comparisons between alternative methods,
"What I did" historical accounts of methods used in recent analyses, nifty tricks
for efficient research, descriptions of things you like about R, descriptions of
things you hate about R .... etc.

In short, anything you feel might be useful.

## Suggesting changes

If you spot an error, wish to suggest a topic or make any sort of comment
then please use the GitHub issues page for the [docs repository](https://github.com/BES-QSIG/docs/)
found [here](https://github.com/BES-QSIG/docs/issues). There, you can create
new issues or make comments on existing issues. All users who are watching the
repository will be informed. You will need a GitHub account if you do not
already have one.

## Document format

All documents provided must be in Markdown script. Please save your documents
with the .md extension e.g. `[name_file].md`. At the top of every document
please provide 'front matter'. Front matter tells the website how to interpret
the document, there are two metadata tags that must be provided:

* `status`: e.g. complete, incomplete, in progress (free text)
* `title`: Introduction to ..., How to .... (free text)

These tags must be put at the top of the page and be separated above and below
by `---`. For example, at the top of this page the front matter is:

    ---
    status: complete
    title: How to contribute
    ---

Please note, the space between the colon and the free text.


## Index

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

## Source attribution

If you are creating a document that is based on a page that exists elsewhere
on the internet (e.g. a personal blog page), you can highlight the original
source by adapting the front matter.

    ---
    status: [status of doc]
    title: [title of doc]
    source: [source page URL]
    source_author: [name of source author]
    ---

## Licensing

Please note all guides produced are under a creative commons license ([CC BY 4.0](http://creativecommons.org/licenses/by/4.0/)). This means any contributions made to the [docs repository](https://github.com/BES-QSIG/docs/)
can be used by other parties so long as they are properly attributed.

## Quick style suggestions

Everyone will have their own style of writing, and that's good. A diversity of
writers will mean a diversity of readers. But here we would like to
outline some general writing suggestions:

* Write to the audience the guide is aimed at (beginners, novices, experts)
* Keep language and sentences simple
* Avoid using phrases like: 'Just do this ...', 'Simply run ...', 'You can then easily ...'
(These will often lead to an annoyed reader)
* Make examples authentic (i.e. explaining a for loop with real ecological data rather than counting 1 to 10)
* Justification is just as important as explanation, thoroughly provide the reasons why your reader should follow your guide

## Doc-Keepers

To edit files on the repo without the need for forking or pull requests you will need to
join the doc-keepers' team in the [BES-QSIG GitHub organisation](https://github.com/BES-QSIG).
If you would like to join, please email:
dominic.john.bennett@gmail.com
