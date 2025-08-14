library(tidyverse)
library(dplyr)
library(ggplot2)
data(mtcars)
head(mtcars)


## finding the average
mean(mtcars$mpg)
## mean mpg
mtcars %>% summarize(mean_mpg = mean(mpg,na.rm = TRUE))

## median mpg

median(mtcars$mpg)
mtcars %>% summarize(median_mpg = median(mpg,na.rm = TRUE))


## 90 percentile
