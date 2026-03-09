##########################################
######             Script 1        #######
######           Manitoba Data     #######
##########################################

# Let's load any packages we might need

library(tidyverse)

# Load the data

data <- read_csv("data_raw/manitoba_data.csv")


data


# Figure of yield by plot

data %>% 
  ggplot() +
  geom_tile(aes(x = row,
                y = col,
                fill = yield))


# Summary of yield by variety

data %>% 
  ggplot() +
  geom_boxplot(aes(x = yield, y = variety))


# plot of yield by variety

data %>% 
  group_by(variety) %>% 
  summarise(mean_yield = mean(yield))
