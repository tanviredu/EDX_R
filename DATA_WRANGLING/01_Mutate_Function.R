library(dslabs)
library(dplyr)
data(murders)
## adding the rate column 
## which is a mutation of the of the original data
murders <- mutate(murders,rate = total/population * 100000)


