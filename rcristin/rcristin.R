## Example taken from https://github.com/henrikkarlstrom/rcristin

## You will need the devtools package.
devtools::install_github("henrikkarlstrom/rcristin")



library(rcristin)
## get Cristin results from NTNU's University Library
ntnuub <- get_cristin_results(unit = "194.14.30.0", published_since = 2015)

library(ggplot2)
library(forcats)

# Graphing 
ntnuub$open_access <- forcats::fct_rev(factor(ntnuub$results$open_access))
ntnuub$open_access <- dplyr::recode(ntnuub$open_access,
                                    none = "Not archived",
                                    green = "Archived",
                                    gold = "Gold OA")


## ggplot was complaining about needing a data.frame for data argument, and note
## that results are now stored in $results
df = data.frame(year_published = ntnuub$results$year_published,
                open_access = ntnuub$open_access)

ggplot(data =df, 
       aes(x = year_published,
           fill = open_access)) +
  geom_bar()

ggplot(data = ntnuub,
       aes(x = year_published,
           fill = open_access)) +
  geom_bar() +
  geom_hline(yintercept = 0,
             size = 1,
             colour = "#333333") +
  labs(title = "NTNU University Library publications by year",
       subtitle = "2015-2019") +
  theme(plot.title = element_text(size = 20,
                                  face = "bold",
                                  color = "#222222"),
        plot.subtitle = element_text(size = 18),
        legend.title = element_blank(),
        legend.text = element_text(size = 12,
                                   color = "#222222"),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_line(color="#cbcbcb"),
        panel.grid.major.x = element_blank(),
        panel.background = element_blank()
        ) +
  ylim(0, 10) +
  scale_fill_manual(values = c("grey", "darkgreen", "gold"))



## from help page
get_cristin_results(contributor = "25062")
