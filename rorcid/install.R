install.packages("DT")
install.packages("rorcid")
install.packages("remotes")
install.packages("xtable")
install.packages("knitr")
## As of November 2020, RefManageR is not available on CRAN due
## to a glitch, so we need to load it from elsewhere.  We have edited
## the examples such that RefManageR is now an optional dependency.
remotes::install_github("ropensci/RefManageR")
