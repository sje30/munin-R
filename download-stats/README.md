# Introduction

In the absence of real data, we are going to simulate some fake
journal download statistics.  Here is an example of what we wish to
simulate:  [download_stats.csv](download_stats.csv).

Simulating data is a good idea; it allows you to test your analysis
methods where you can add in certain effects, and then test if your
analysis methods detect them.

# Part one: simulate some download statistics for journals

In this part, we will work through [make_data.R](make_data.R).  All
journal titles are totally fictional, and any resemblence to actual
journal titles is coincidental.  Except for **Cool**, from Cell Press,
which is [totally
real](http://cell.com/pb/assets/raw/journals/research/cell/cell-timeline-40/spoof.pdf).


# Part two: analyse the download statistics for journals

Now that we have some simulated data, let's analyse it.  Try these
before looking at our partial answers.

1. Draw a graph to plot the total number of downloads per month; can
   you see the effects we built in?
2. Which journal had the most downloads in one month?  (Ditto for the
   least downloads in one month.)
3. Which are the top 10 journals by download statistics over the whole
   year?  Bottom 10?
4. Can you predict which are the "prestige" journals, without knowing
   their names?




# Exercises/extensions

1. Assign each journal to a publisher.
2. Assign cost to each journal, and have a budget.  what is best way
   to spend your budget if you can't afford to get everything?
3. Add your own journal titles, or vary how download statistics are generated.
