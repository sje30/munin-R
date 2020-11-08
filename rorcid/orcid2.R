require(rorcid)
require(RefManageR)

get_orcid_info <- function(orcid_num) {
  info <- orcid_id(orcid = orcid_num)
  given <- info[[1]]$name$`given-names`$value
  family <- info[[1]]$name$`family-name`$value
  works <- works(orcid_num)
  my_dois <- rorcid::identifiers(works)
  num_dois <- length(my_dois)

  list(orcid = orcid_num,
       given = given,
       family = family,
       num_dois = num_dois,
       dois = my_dois)
  
}



######################################################################
## End of functions
######################################################################

me <- "0000-0001-8607-8025"
info <- get_orcid_info(me)

## takes a minute or so to get all of the dois.
## GetBibEntryWithDOI(info$dois)
GetBibEntryWithDOI(info$dois[1:6])



maths_csv =  read.csv("maths_orcid.csv", comment.char='#')
##print(xtable(damtp.csv), type="html")
orcids1 = as.character(maths_csv$orcid)
orcids = orcids1[nchar(orcids1)>0]  # not everyone has an orcid

results <- lapply(orcids, get_orcid_info)

## convert to a data frame; probably there are more compact ways, but this
## seems useful.

given <- sapply(results, function(x) x$given)
family <- sapply(results, function(x) x$family)
orcid <- sapply(results, function(x) x$orcid)
doi_n <- sapply(results, function(x) x$num_dois)

results_df <- data.frame(orcid=orcid, given=given, family=family, doi_n=doi_n)
results_df
