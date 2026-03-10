##################################################
######                Script 3             #######
######           Example basic stats       #######
##################################################

# Note on usful resources:
# The example below comes from https://rstats4ag.org/anova.html#one-way-analysis-of-variance
# Which is a nice resource for ag-oriented stats. Recomended!
# I have made some change sto the code to better fit what i taught in clase (tydiverse style/workflows, etc)



# Load needed packages ----------------------------------------------------


library(tidyverse)


# Load the data -----------------------------------------------------------


# The “FlumiBeans” data set is from a herbicide trial conducted in Wyoming during three different years (2009 through 2011). 
# Five different herbicide treatments were applied, plus nontreated and handweeded controls for a total of seven treatments. 
# The study was a randomized complete block design (RCBD) each year. There were 3 replicates in 2009, but 4 replicates in subsequent years. 
# The response variable in this data set is dry bean (Phaseolus vulgaris) density 4 weeks after planting expressend in plants per acre.

bean_data <- read_csv("http://rstats4ag.org/data/FlumiBeans.csv")

bean_data



# Data preparation --------------------------------------------------------

bean_data_2009 <- bean_data %>% 
  mutate(year = as.factor(year)) %>% # we turn the year column from numeric (dbl) into a factor
  mutate(block = as.factor(block)) %>% # same for block
  filter(year == 2009) # We filter to keep just the data for 2009


bean_data_2009



# Anova -------------------------------------------------------------------

bean_data_2009_aov_results <- aov(population.4wk ~ block + treatment, data = bean_data_2009)


# Now let's evaluate the results:

bean_data_2009_aov_results # We can call the results to see what we got

summary(bean_data_2009_aov_results) # in this case `summary()` gives us a more useful interpretation of the results with the actual ANOVA table

# It seems that treatment is signifficant. Of course, there is a lot more that could (should!) be assessed here, like the assumptions of the ANOVA, 
# any follow up test (post-hoc) to determine which treatments are different from which, etc. For that, I recomend reviwing the whole chapter in https://rstats4ag.org/anova.html#one-way-analysis-of-variance
