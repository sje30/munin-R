## Part 2, now let's analyse our data, and see what we find.
## don't look at this until you have tried this yourself.

stats = read.csv("download_stats.csv", row.names=1)


stats = as.matrix(stats)

## check we've read in the data okay.
stats[1:5, 1:6]

downloads_jnl = apply(stats, 1, sum)
downloads_mon = apply(stats, 2, sum)

plot(downloads_mon,
     xlab="month", ylab="total downloads",
     main="Total downloads (all journals) per month",
     pch=19, cex=2, las=1)




## finding the journal with the biggest monthly downloads means finding
## the largest entry in the stats.  (which.max would be nice to use here,)
biggest=max(stats)
which(stats==biggest, arr.ind=TRUE)

smallest=min(stats)
which(stats==smallest, arr.ind=TRUE)




## sort journals by download statistics  (Advanced, could do longer...)
## this might be too "advanced"
names(downloads_jnl) <- rownames(stats)

## just check that formatting okay, this is not the answer.
downloads_jnl[1:10]



## bottom ten.
order <- order(downloads_jnl)
downloads_jnl[order[1:10]]

## top ten:
order <- order(downloads_jnl, decreasing = TRUE)
downloads_jnl[order[1:10]]


## can we identify a threshold???

plot(downloads_jnl,
     xlab="Journal index", ylab="total downloads",
     main="Total downloads (all months) per journal",
     pch=19, cex=2, las=1)
abline(h=10000, col='red')


## or another way of looking at the data.
hist(downloads_jnl, breaks=20)
abline(v=10000, col='red')
