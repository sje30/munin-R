# Rorcid case study

To demonstrate how we can use R to interface with R records.


Summary: from this [CSV](maths_orcid.csv) let us generate a [beautiful
report](https://htmlpreview.github.io/?https://github.com/sje30/munin-R/blob/main/rorcid/orcid3.html).

We go through three steps.


## Prerequisites

Install various packages: rorcid (CRAN)

You will need an orcid account, and when you first use the package you
will be asked to authenticate via a web browser.

## Step 1 - interactive usage

Rorcid has a 
[Get started]<https://docs.ropensci.org/rorcid/articles/rorcid.html> guide
which is very useful.


See <orcid1.R>

## Step 2 - writing functions

Move from analysing one person to a group of people.

<orcid2.R>


## Step 3 - writing reports

[orcid3.Rmd](orcid3.Rmd).

