---
layout: doc
status: first version
author: Simon Dellicour
title: How to build an R package
permalink: /docs/how_to_build_an_r_package/
---

# How to build an R package

Building a `R` package is quite easy but the writing of help files related to each function requires basic knowledges of Latex (although the language used to write R documentation files is a little bit different from the official Latex language).
This tutorial is a short version. For a more detailed tutorial, see this [pdf file](http://cran.r-project.org/doc/contrib/Leisch-CreatingPackages.pdf).

Building a `R` package can be performed in 4 steps:

### Step 1
In R: load the different functions of the future package as follows:

```R
source("function1.r")
source("function2.r")
source("function3.r")
...
```

### Step 2
Always in R, use the "package.skeleton" as follows:

```R
package.skeleton(name="name_of_your_package", list=c("function1","function2","function3", ...))
```

This will generate a new folder in your working directory. This folder somehow corresponds to the first version of your package but it still has to be packed into an archive file. 
Before this step, the documentation file of the package (the "DESCRIPTION" file in the folder) and of the documentation file (".Rd" files in the subdirectory "man") each function has to be edited. These files can be edited using a simple text editor but have to be written in a Latex language. Yet, a template has been automatically generated for each file. So, most of the time, the only thing you have to do is to fill the different sections. Specific Latex code is only necessary, for instance, if you want to write mathematical expressions or special characters. Details on how to write such expressions can be found [here](http://r-pkgs.had.co.nz/man.html). For other specific inquiries, Google it using the keywords "R documentation".

### Step 3
Once all the description and documentation files have been completed, open a terminal window and `cd` to your `R` working directory containing your package folder. In the terminal, then enter the following command to check the package:

```
> R CMD check name_of_your_package
```

In addition to check you package, this will generate a new folder called "name_of_your_package.Rcheck" that will contain a pdf manual automatically generated and based on your description and documentation files.

### Step 4
The last step after checking is to build your package package. In your terminal window enter the following command to build the package:

```
> R CMD build name_of_your_package
```

This will generate the archive file of your package. To check your compiled package in `R`, you can directly install it from this source file using the command:

```R
install.packages("name_of_your_package.tar.gz", repos=NULL, type="source") # to install the package
library(name_of_your_package) # to load the package
```
