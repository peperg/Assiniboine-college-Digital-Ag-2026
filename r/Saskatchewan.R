##############################################
######              Script 2           #######
######         Saskatchewan Data       #######
##############################################



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
