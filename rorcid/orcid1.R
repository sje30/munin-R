## Interactive usage of rorcid package

## Install first from CRAN, e.g.
## install.packages(c("rorcid", "rcrossref"))
require(rorcid)
require(rcrossref)

## orcid for Stephen
me <- "0000-0001-8607-8025"

## convert to an ORCID!
as.orcid(me)
## Open a web browser of the orcid.
browse(as.orcid(me))

## Let's try to find Daniel.
orcid(query = "Daniel Nuest geoinformatics")

## bibtex file may take a minute or two to create.
my_dois <- rorcid::identifiers( rorcid::works( me ) )
pubs <- rcrossref::cr_cn(dois = my_dois[1:3], format = "bibtex")
invisible(lapply(pubs, write, "pubs.bib", append=TRUE))
