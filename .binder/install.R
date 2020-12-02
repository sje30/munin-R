install.packages("devtools")
require(remotes) || install.packages("remotes")
require(knitr)   || install.packages("knitr")
require(dplyr)   || install.packages("dplyr")
install.packages("ggplot2")
install.packages("forcats")

remotes::install_github("henrikkarlstrom/rcristin")

install.packages("bibtex")
install.packages("rcrossref")
install.packages("rorcid")
install.packages("rmarkdown")
## As of November 2020, RefManageR is not available on CRAN due
## to a glitch, so we need to load it from elsewhere.  We have edited
## the examples such that RefManageR is now an optional dependency.
remotes::install_github("ropensci/RefManageR")
