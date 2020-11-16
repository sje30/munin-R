## If you are working on Windows, you may need first to install Rtools
## to be able to compile extra packages.  This should only take a few minutes
## by following the instructions at:

## https://cran.r-project.org/bin/windows/Rtools/
## but check first you have R version 4.0
## you might get some luck with rorcid without Rtools.
## Steps:
## 1. Download rtools and install it.
## 2. run the R command:
## writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
## 3. restart R.
## 4. run the following command and check it shows something
## like "C:\\rtools40\\usr\\bin\\make.exe"
## Sys.which("make")

## After you have Rtools, you should be able to install these packages.


install.packages("bibtex")
install.packages("rcrossref")
install.packages("DT")
install.packages("rorcid")
install.packages("remotes")
install.packages("xtable")
install.packages("rmarkdown")
install.packages("knitr")
## As of November 2020, RefManageR is not available on CRAN due
## to a glitch, so we need to load it from elsewhere.  We have edited
## the examples such that RefManageR is now an optional dependency.
remotes::install_github("ropensci/RefManageR")
