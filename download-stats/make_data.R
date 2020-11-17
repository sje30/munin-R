## Part one.
## Simulate some journal download statistics.



## Create some journal names ###########################################

premier_jnl_names = readLines('premier_journals.txt')
jnl_names = readLines('journals.txt')

prefixes = c("", "Open", "J.", "E. J.", "Quart. rev of")


journal_root = c(premier_jnl_names, jnl_names)


n_journal_root = length(journal_root)
n_prefixes = length(prefixes)

n_journals = n_journal_root * n_prefixes

journals = rep("", n_journals)  ## pre-allocation

k=1
for (j in 1:n_journal_root) {
  for (i in 1:n_prefixes) {
    if(prefixes[i]=="") {
      journals[k] = journal_root[j]
    } else {
      journals[k] = paste(prefixes[i], journal_root[j])
    }
    k = k+1
  }
}


## show a few journal names
sample(journals, 10)

## sort them into alphabetical order
journals = sort(journals)

## Certain papers are more popular than others #########################

## Let's for now make the model that papers in premier journals
## are highly accessed, and that a certain fraction of papers,
## independent of journal, are highly cited.


## expectation over the year.

n_stellar_papers = 10 * n_journals

stellar_papers = sample( n_journals, n_stellar_papers, replace=TRUE)

expected_downloads = rep(0, n_journals)

for (j in 1:n_journals) {
  journal_name = journals[j]

  n_stellar_papers = sum( stellar_papers == j)

  ## Note, this returns TRUE/FALSE, and k*TRUE=k, k*FALSE=0
  premier_journal = is.element(journal_name, premier_jnl_names)

  expected_downloads[j] = 200 + (500 * n_stellar_papers) + (10000*premier_journal)

}

hist(expected_downloads)


## Generate download statistics for each month of the year #############

downloads = matrix(0, n_journals, 12)

for (month in 1:12) {
  for (j in 1:n_journals) {

    mean = expected_downloads[j] / 12 #expectation is for whole year

    if ( (month >= 6) && (month <= 9) ) {
      mean = mean * 0.7
    } else {
      if (month == 10) {
        mean = mean * 1.2
      }
    }
    
    downloads[j, month] = max(0,
                              round( rnorm(1, mean, sd=mean*0.3)))
  }
}


## Export our data now #################################################

rownames(downloads) <- journals
colnames(downloads) <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                         "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

downloads[1:5,1:5]
write.csv(downloads, "download_stats.csv")
         
