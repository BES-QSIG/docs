---
layout: doc
status: complete
title: Introduction to Markdown
---

# Introduction to Markdown

Markdown is a [markup language](https://en.wikipedia.org/wiki/Markup_language)
like HTML or LATEX. It is a text document that specifies not only the text but also the format. Markdown is designed to be as simple as
possible.

Markdown documents can be made and edited with basic text editors (e.g.
notepad, wordpad, textedit) or online with GitHub.

For this website we use a version of Markdown called GitHub Flavoured Markdown.

## Contents

1. Formatting your document
2. Markdown features
3. Advanced and further reading

# Formatting your document

Please save your documents with the .md extension e.g. `[name_file].md`

Please provide front matter at the top of the document:

    ---
    layout: doc
    status: complete
    title: Introduction to Markdown
    ---

This tells the website how to interpret the document.

* `layout`: type of document (always doc)
* `status`: e.g. complete, incomplete, in progress (free text)
* `title`: Introduction to ..., How to .... (free text)


# Markdown features

## Emphasis

Use \* and \*\* to italicise and embolden text, e.g.

    `*I am italicised* while **I am emboldened**`

Produces:

*I am italicised* while **I am emboldened**

## Headings

Use the `#` to create headings. Each subheading is specified with an additional
`#`. e.g.

    ### Subheading 3

    #### Subheading 4

Produces:

### Subheading 3

#### Subheading 4

## Lists

Bullet point lists are created with `*`, numbered lists with numbers. e.g.

    * item 1
    * item 2


    1. item 1
    2. item 2

Produces:

* item 1
* item 2


1. item 1
2. item 2

## References

To add URL links use this syntax `[hyperlinked text](url/to/link)` e.g.

    *Louis XIV, also known as the Sun King, was king of France from 1643 to
    1715 according to his [Wikipedia page](https://en.wikipedia.org/wiki/Louis_XIV_of_France)*

Produces:

*Louis XIV, also known as the Sun King, was king of France from 1643 to
1715 according to his [Wikipedia page](https://en.wikipedia.org/wiki/Louis_XIV_of_France)*

## Images

To add images, the syntax is very similar `![name_of_image](url/link/to/image "Hover description of image")`.
e.g.

    `![cat](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/mara_cat.jpg "This cat is called Mara")`

Produces:

![cat](https://raw.githubusercontent.com/BES-QSIG/docs/master/img/mara_cat.jpg "This cat is called Mara")


## Code snippets

To insert code inline use \` e.g.

  ```
  This is text and `this is code`
  ```

Produces:

This is text and `this is code`

## Code blocks

Use \`\`\` to create syntax highlighted code blocks e.g.

    ```R
    greeting <- 'Hello world!'
    for (letter in greeting) {
        cat (letter, '\n')
    }
    cat (greeting)
    ```

Produces:

```R
greeting <- 'Hello world!'
for (letter in greeting) {
    cat (letter, '\n')
}
cat (greeting)
```

Other languages are also possible e.g.

    ```python
    greeting = 'Hello world!'
    for letter in greeting:
        print(letter)
    print(greeting)
    ```

```python
greeting = 'Hello world!'
for letter in greeting:
    print(letter)
print(greeting)
```

For a full list of available languages click
[here](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml).

## Tables

You can construct tables using `|` and `-`. Use `|` to separate columns,
new lines to separate rows and `-` to mark headers. For example:

```
|**Col1** | **Col2** |
| ------- | -------- |
|row1col1|row1col2|
|row2col1|row2col2|
```

Produces:

|**Col1** | **Col2** |
| ------- | -------- |
|row1col1|row1col2|
|row2col1|row2col2|

## Asides

Use the \> symbol to make text into an aside e.g.

  `>Hello! Hello! Hello!`

Produces:

>Hello! Hello! Hello!

# Advanced and further reading

## Previewing

It may be useful to preview your script before uploading. You can use online
previewers, such as:

* [tmpvar's](http://tmpvar.com/markdown.html)
* [jbt's](http://jbt.github.io/markdown-editor)

Or by working with a good text editor that has GitHub markdown syntax
highlighting and previewing:

* [Atom](https://atom.io/)
* [Sublime](http://www.sublimetext.com/)

## Converters

If you already have a guide written in a different markup language (such as
  HTML, Latex or even pdf) you can use a converter to transform it into
markdown. See [pandocs](http://pandoc.org/README.html) for more details.

## Further reading

When writing a tutorial, feel free to copy the markdown of other
files in the `docs/` repo. Click on the 'Improve page' pencil at the top to
see the page in GitHub and click 'raw' to see the text script, unparsed.

Note, however, that some tutorials may have been generated using automatic
converters may use a different syntax to that described in this document.

For more complicated features you can also use `HTML`. We can also add to the
website `css` for any custom classes.

Useful references:

* [Official Markdown Syntax](http://daringfireball.net/projects/markdown/syntax)
* [GitHub Markdown Syntax](https://help.github.com/articles/github-flavored-markdown/)
