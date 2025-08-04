library(dslabs)
data(murders)

highest_population_state <- murders$state[which.max(murders$population)]
murder_rate <- murders$total/murders$population * 100000
murders$state[order(murder_rate,decreasing = TRUE)]

#-----------------------------------------------------------------------
# Map city names to `city`
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Store temperature values ​​in `temp`
temp <- c(35, 88, 42, 84, 81, 30)
temp <-  5/9 * (temp-32)
# Convert the temperature to Celsius and rewrite the original values ​​of
# `temp` with Celsius values
# Generate a data frame called `city_temps`
city_temps <- data.frame(name = city, temperature = temp)
city_temps

#-----------------------------------------------------------------------
# Define an object `x` with the numbers 1 through 100
x <- 1:100
sum(1/x^2)
# Calculate the sum 1 + 1/2^2 + 1/3^2 + ... + 1/100^2

#------------------------------------------------------------------------
# Load the murders data set
library(dslabs)
data(murders)

# Save the murder rate per 100,000 for each state and store it in a 
# `murder_rate` object

murder_rate <- murders$total/murders$population * 100000
mean(murder_rate)
# Calculate the average murder rate

