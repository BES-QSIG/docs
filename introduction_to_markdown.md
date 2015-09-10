---
layout: doc
status: complete
title: Introduction to Markdown
---

This tutorial explains the Markdown syntax for tutorials hosted on this
website. Although, Markdown comes in a variety of flavours -- most ecologists
would be familiar with R markdown -- they all have very similar syntaxes with
many of it being interchangeable. On this website we use GitHub flavoured
markdown.

## Extension

Always save your markdown files: `[name_file].md`

## Metadata

At the very top of every document metadata is provided to tell the website how
the page should be set-up, it's called _front-matter_. Don't worry about how
it works, all that is required is to provide layout, status, title and
link parameters. So for this document the parameters are:

    ---
    layout: doc
    status: complete
    title: Introduction to Markdown
    ---

Simply copy this and place it at the top of any document you create. `layout`
must always be doc, it tells the website how to parse the file. `title`
specifies the name of the page that will appear in users' browsers.
`status` is a free text field, you could write things
like 'in development' or 'complete' to let your readers know how likely the
guide is to change or whether you're looking for help.

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

## Asides

Use the \> symbol to make text into an aside. For example:

  `>Hello! I'm being self-referential!`

.... produces:

>Hello! I'm being self-referential!

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

To link between different documents on the website use the `site.baseurl`
command within curly brackets:

    [hyperlinked text]({{ "{{ site.baseurl " }}}}/docs/name_of_page.md)

To add images, the syntax is very similar:

    ![name_of_image](url/link/to/image "Hover description of image")

Instead of linking to images elsewhere on the internet, you can link to images
uploaded to the BES-QSIG's docs repo. All images are kept in the `img/` folder.
Instead of providing a URL, you can use this command:

    {{ "{{ site.imgurl " }}}}/name_of_file

To make your life easier, it's best to create references to images rather than
have chunks of URL in the middle of your text. For example, at the bottom of
this .md file I've created a reference to an image of my cat like so:

    <!-- References -->
    [cat]: {{ "{{ site.imgurl " }}}}/mara_cat.jpg "This is my cat, she's called Mara."

Note `<!--` and `-->` indicate the start and end of comments. To use this
reference in the text I type:

    ![cat][cat]

Where the second `[cat]` is the named reference to the URL link I provide at the
bottom of the page. So using it gives ....

![cat][cat]

## Code blocks

This is probably what gives Markdown the edge. To insert code inline use \`.
I use this to highlight `folders/`, `variables`, `functions` etc. if I refer to
them in-text. To insert blocks of text, indent the paragraph as I have been
doing above for Markdown examples, e.g.

    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
    veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
    commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
    velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
    occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
    anim id est laborum.

For syntax code colouring, the code block is specified using three \` and the
name of the language at the beginning of the code block and three \`  at the
end. For example, this block of `R` code ....

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

## Tables

You can construct tables using `|` and `-`. Use `|` to separate columns,
new lines to separate rows and `-` to mark headers. For example:

```
|**Col1** | **Col2** |
| ------- | -------- |
|row1col1|row1col2|
|row2col1|row2col2|
```

.... produces:

|**Col1** | **Col2** |
| ------- | -------- |
|row1col1|row1col2|
|row2col1|row2col2|

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
  HTML, Latex or even pdf!) you can use a converter to transform it into
markdown. See [pandocs](http://pandoc.org/README.html) for more details.

## Further reading

When embarking on writing a tutorial, feel free to copy the markdown of other
files in the `docs/` repo. Click on the 'Improve page' pencil at the top to
see the page in GitHub and click 'raw' to see the text script, unparsed.

Note, however, that some tutorials may have been generated using automatic
converters may use a different syntax to that described in this document.

For more complicated features you can also use `HTML`. We can also add to the
website `css` for any custom classes.

Useful references:

* [Official Markdown Syntax](http://daringfireball.net/projects/markdown/syntax)
* [GitHub Markdown Syntax](https://help.github.com/articles/github-flavored-markdown/)

<!-- References -->
[cat]: {{ site.imgurl }}/mara_cat.jpg "This is my cat, she's called Mara."
