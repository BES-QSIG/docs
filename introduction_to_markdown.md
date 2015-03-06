---
layout: doc
title: Introduction to Markdown
permalink: /docs/introduction_to_markdown/
---

# Introduction to Markdown

This is an example document demonstrating how to create Markdown documents for
hosting on this website. To see the raw text version click [here][raw].

## Metadata
At the very top of every document metadata is provided to tell the website how
the page should be set-up, it's called _front-matter_. Don't worry about how
it works, all that is required is to provide layout, title and link
parameters. So for this document the parameters are:

    ---
    layout: doc
    title: Introduction to Markdown
    permalink: /docs/introduction_to_markdown/
    ---

Simply copy this and place it at the top of any document you create. The title
specifies the name of the page that will appear in users' browsers. The link
is always `/docs/[name_of_file]`, with the name of the file ignoring the
extension.

## Headings

Headings in Markdown are denoted using `#` symbol, subheadings are specified by
adding an extra `#`. So for example, this Markdown code:

    # Heading 1
    Words words words ....

    ## Subheading 1
    Words words words ....

    ### Subheading 2
    Words words words ....

Produces this:

# Heading 1
Words words words ....

## Subheading 1
Words words words ....

### Subheading 2
Words words words ....

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

To add URL links use this syntax:

    [hyperlinked text](url/to/link)

To add images, the syntax is very similar:

    ![name_of_image](url/link/to/image "Hover description of image")

Instead of linking to images elsewhere on the internet, you can link to images
uploaded to the BES-QSIG's docs repo. All images are kept in the `img/` folder.
These images are available via this URL:

    https://raw.githubusercontent.com/BES-QSIG/Guides/docs/img/

To make your life easier, it's best to create references to images rather than
have chunks of URL in the middle of your text. For example, at the bottom of
this .md file I've created a reference to an image of my cat like so:

    <!-- References -->
    [cat]: https://raw.githubusercontent.com/BES-QSIG/Guides/docs/img/mara_cat.jpg
    "This is my cat, she's called Mara."

Note `<!--` and `-->` indicate the start and end of comments. To use this
reference in the text I type:

    ![cat][cat]

Where the second `[cat]` is the named reference to the URL link I provide at the
bottom of the page. So using it gives ....

![cat][cat]

_Miaow miaow_.

## Code blocks

This probably the most important element for coding manuals and tutorials.
Markdown makes these very easy to insert with language-specific syntax
colouring.

To insert code inline use \`. I use this to highlight `folders/`,
`variables`, `functions` etc. if I refer to them in-text. To insert blocks of
text, indent the paragraph as I have been doing above for Markdown examples, e.g.

    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
    veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
    commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
    velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
    occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
    anim id est laborum.

We use GitHub flavoured markdown so for syntax code colouring, the code block
is specified using three \` and the name of the language at the beginning of
the code block and three \`  at the end. For example, this block of `R`
code ....

    ```R
    greeting <- 'Hello world!'
    for (letter in greeting) {
        cat (letter, '\n')
    }
    cat (greeting)
    ```

.... produces:

```R
greeting <- 'Hello world!'
for (letter in greeting) {
    cat (letter, '\n')
}
cat (greeting)
```

Other languages are also possible, such as for `python`:

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

## Further reading
Other features are also available for Markdown such as tables. You can also
insert `HTML` into the Markdown file if you want to do anything complicated.

Here are some useful references:

* [Official Markdown Syntax](http://daringfireball.net/projects/markdown/syntax)
* [GitHub Markdown Syntax](https://help.github.com/articles/github-flavored-markdown/)

<!-- References -->
[raw]: https://raw.githubusercontent.com/BES-QSIG/Test-guides/docs/example_document.md
[cat]: https://raw.githubusercontent.com/BES-QSIG/test/docs/img/mara_cat.jpg "This is my cat, she's called Mara."