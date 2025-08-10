# Loading data
library(dslabs)
data(murders)

# Loading dplyr
library(dplyr)

# Redefine `murders` to include a column called `rate`
# with the homicide rate that corresponds to every 100,000



library(dplyr)
library(dslabs)
data(murders)
# Note that if you want the ranks to be descending,
# you can apply the minus sign (negative) and then compute the ranks
x <- c(88, 100, 83, 92, 94)
rank(-x)

# Defining the rate
rate <- murders$total/ murders$population * 100000

# Redefine `murders` to include a column called `rank`
# with rate ranks from highest to lowest











library(dplyr)
library(dslabs)
data(murders)

# Use `select` to show only the state names and
# abbreviations from `murders` 







library(dplyr)
library(dslabs)
data(murders)

# Add necessary columns
murders <- mutate(murders, rate = total/population * 100000, rank = rank(-rate))


# Use `filter` to show the 5 states with the highest homicide rates







library(dplyr)
library(dslabs)
data(murders)

# Use `filter` with the != operator to create a new data
# frame without the southern region and call it `no_south`


# Use `nrow()` to calculate the number of rows




library(dplyr)
library(dslabs)
data(murders)

# Create a new data frame called `murders_nw` with only
# northeastern and western states


# Calculate the number of states (rows) in this category




library(dplyr)
library(dslabs)
data(murders)

# Add rate and rank columns
murders <- mutate(murders, rate = total / population * 100000, rank = rank(-rate))

# Create a data frame and call it `my_states` that satisfies both
# conditions, northeast or west and homicide rate less than 1


# Use `select` to display only the state name, the
# murder rate, and rank












library(dplyr)
library(dslabs)
data(murders)

# Define the rate column
murders <- mutate(murders, rate = total / population * 100000, rank = rank(-rate))

# Show the result and only include the state, rate.
# and rank columns on a single line and in that order









library(dplyr)
library(dslabs)
data(murders)

# Create a new data frame called `my_states` (according to
# the specifications in the instructions)