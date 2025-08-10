library(dslabs)
library(dplyr)
library(ggplot2)
data(murders)
murder_with_rate <- mutate(murders,rate = total/population * 100000)
state_rate <- select(murder_with_rate,state,rate)
state_rate

less_than_1_state_mr <- filter(state_rate,rate<1)

less_than_1_state_mr$rate <- less_than_1_state_mr$rate[order(less_than_1_state_mr$rate)] 


ggplot(less_than_1_state_mr, aes(x = state, y = rate)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "States with Rates Less Than 1",
       x = "State",
       y = "Rate") +
  theme_minimal()
