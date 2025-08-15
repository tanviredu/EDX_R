library(dslabs)
library(dplyr)
library(ggplot2)
data(murders)

murders <- mutate(murders,rate = total/population * 100000)
head(murders)


# 1. Function to filter states above a 
# murder rate threshold & plot them
filter_state_murder_rate = function(threshold){
  subset(murders,rate > threshold)  
}
above_5 <- filter_state_murder_rate(5)

ggplot(above_5,aes(x=reorder(state,rate),y=rate))+
  geom_bar(stat="identity")+
  coord_flip()
  



## 2. Function to get top N states by murder rate & plot

top_N_state <- function(N){
  ordered_index = order(murders$rate,decreasing = TRUE)    
  df = murders[ordered_index,]
  return( df[1:N,])
  }

top_5 <- top_N_state(5)
top_5

ggplot(top_5,aes(x=state,y=rate))+
  geom_col()

