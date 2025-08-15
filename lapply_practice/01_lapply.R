library(dslabs)
library(dplyr)
library(lubridate)
data(murders)

class(murders)
class(murders$total)
class(murders$state)

## it will apply every columns and find its class
lapply(murders,class)

head(murders,3)
lapply(murders,head,3)

## find the unique value in each column
## in manualway
## with lapply