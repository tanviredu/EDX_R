library(dslabs)
library(dplyr)
data(murders)
## find the total murders of a given state
## this will return an entire row
get_total_murder1 <- function(state_name){
  filter(murders,murders$state == state_name)
}
get_total_murder1("California")


get_total_murder2 <- function(state_name){
  murders$total[murders$state == state_name]
}

get_total_murder2("California")

filter(murders,murders$state == "California" )
murders$total


## population by abb
get_population = function(abb_name){
  murders$population[murders$abb == abb_name]
}



get_population2 = function(abb_name){
  filter(murders,murders$abb == abb_name)$population
}

get_population("TX")
get_population2("TX")


## find the murder rate of New Work


murder_rate_city <- function(state_name){
  murders = mutate(murders,rate = total/population * 100000)
  murder_rate = murders$rate[murders$state == state_name]
  return (murder_rate)
}

murder_rate_city("New York")


head(murders)
## find the Number of state in a region

count_states_region <- function(region_name){
  sum(murders$region == region_name)
}

count_states_region("South")
count_states_region("West")


## find the state with the max murders
max_murders_state = function(){
  murders$state[which.max(murders$total)]  
}

max_murders_state()

head(murders)
## maximum murder rate (MURDER RATE) 


max_murder_rate = function(){
  murders$state[order(murders$rate,decreasing = TRUE)[1]]
}
max_murder_rate()


## Top N states with highest murder rate

top_n_murder_rate = function(N){
  murder_order = order(murders$rate,decreasing = TRUE)
  select(murders,c("state","rate"))
}
top_n_murder_rate(3)
top_n_murder_rate(5)


# Function to mark states above average rate & plot



above_avg <- function(){
  avg <-mean(murders$rate)
  murders$above_avg <- murders$rate > avg
  return (murders)
}

murder_flag <- above_avg()
murder_flag

ggplot(murder_flag,aes(x=population,y=total,color=above_avg))+
  geom_point()

