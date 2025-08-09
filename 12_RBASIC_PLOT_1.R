library(dplyr)
library(dslabs)
data(murders)

x_murder_in_mllon <- murders$population / 10^6
y_murder <- murders$total

x_murder_in_mllon
y_murder 

plot(x_murder_in_mllon,y_murder)

murders <- mutate(murders,rate = murders$total/ murders$population*100000)
murders

hist(murders$rate)


murders$state[which.max(murders$rate)]
