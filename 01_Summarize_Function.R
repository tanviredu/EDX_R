
### import statement
library(tidyverse)
library(dslabs)
library(dplyr)

## loading the data
data(murders)

murders <- mutate(murders,rate = total/population*10^5)
murders

s<- murders %>%
  filter(region =="West") %>%
  summarize(minimum = min(rate),
            maximum = max(rate),
            median  = mean(rate)
            )



s
print(s$minimum)
print(s$maximum)
print(s$median)




us_murder_rate <- murders %>% summarize(rate = sum(total)/sum(population)*10^5)
us_murder_rate
