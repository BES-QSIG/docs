---
status: Contributions wanted
title: Problems and Solutions in R
---

# Problems and solutions

## Premise

The idea of this document is to present common (and often confusing) grievances
I encounter with R and how I go about resolving them.

## Contents

* [Extracting a vector from a data frame of characters](#extracting-a-vector-from-a-data-frame-of-characters)

## Extracting a vector from a data frame of characters

### Problem

I often want to loop through a data frame and extract a vector from it. This is
fine if that data frame contains numbers. For example, the following code
generates a data frame of numbers, extracting the first row creates a vector
equal to a vector of 1 to 5.

```R
numbers.df <- data.frame (c1=rep (1, 5),
                          c2=rep (2, 5),
                          c3=rep (3, 5),
                          c4=rep (4, 5),
                          c5=rep (5, 5))
row.element <- 1:5
all (row.element %in% numbers.df[1,])  # TRUE
```

But if I switch to characters, it doesn't work.

```R
letters.df <- data.frame (c1=rep ('a', 5),
                          c2=rep ('b', 5),
                          c3=rep ('c', 5),
                          c4=rep ('d', 5),
                          c5=rep ('e', 5))
row.element <- c ('a', 'b', 'c', 'd', 'e')
all (row.element %in% letters.df[1,])  # FALSE!
```

How should I resolve this? Printing `letters.df[1,]` returns this:

```console
> letters.df[1,]
  c1 c2 c3 c4 c5
1  a  b  c  d  e
```

So perhaps if I convert the vector into characters it will work.

```R
all (row.element %in% as.character (as.vector (letters.df[1, ])))  # FALSE
```

No, because this has simply converted the vector into a vector of 1s.

```console
> as.character (as.vector (letters.df[1, ]))
[1] "1" "1" "1" "1" "1"
```

### Solution 1

The problem is to do with levels in the data frame. When we extract our row
we also need to drop the data frame class. (By default, `[]` preserve the data.frame
class even though its a single row). This returns a `list` so we need to then
convert this into a vector using `unlist()`. Now there are still levels but these
refer to levels within the vector rather than the original `data.frame`. To drop
these we can use `as.character()`.

```R
res <- as.character (unlist (letters.df[1, ,drop=TRUE]))
all (row.element %in% res)  # TRUE
```

### Solution 2

The above solution is complicated. The problem is to do with levels. Therefore,
another solution is to force all strings not to be made into factors when we create our data
frame.

```R
letters.df <- data.frame (c1=rep ('a', 5),
                          c2=rep ('b', 5),
                          c3=rep ('c', 5),
                          c4=rep ('d', 5),
                          c5=rep ('e', 5),
                          stringsAsFactors=FALSE)
all (row.element %in% letters.df[1,])  # TRUE!
```

Now the `data.frame` acts in the same way that `numbers.df` did. This is the easiest
and most straightforward solution, however, it does come at the cost of losing factor
functionality (e.g. `tapply()`) on the data frame.
