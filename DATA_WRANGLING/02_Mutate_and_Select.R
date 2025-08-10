library(dslabs)
data(murders)
## mutate the murder dataframe
murders <- mutate(murders,rate = total/population * 100000)
### select the state and the murder rate
state_with_rate <- select(murders,state,rate)
index <- order(state_with_rate$rate,decreasing=TRUE)
state_with_rate$state[index]
state_with_rate$rate[index]
state_with_rate

