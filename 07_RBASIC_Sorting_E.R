library(dslabs)
data(murders)

x<- c(31,4,15,92,65)
print(x)

#-------------------
# sort the value
print(sort(x))

#-------------------
# sort the index
print(order(x))
index <- order(x)
print(x[index])

#--------------------
# sort the USA state based on murder Total

murder_index <- order(murders$total)
print(murder_index)

# sorted
sorted_abb <- murders$abb[murder_index]
print(sorted_abb)

# max murder abb
i_max = which.max(murders$total)
print(i_max)
print(murders$abb[i_max])
# min murder abb
i_min = which.min(murders$total)
print(i_min)
print(murders$abb[i_min])


# rank ->  it rank based on size
index <- rank(murders$total)
print(index)
rounded_index <- round(index)
print(rounded_index)
















#--------------------------------------------------
library(dslabs)
data(murders)
# Access the `state` variable and store it in an object called 'states'
states <- murders$state

# Sort the object alphabetically and redefine the states object
states <- sort(states)

# Report the first alphabetical value
states[1]

# Access the population values ​​of the data set and
# save it to `pop`






pop <- murders$population
pop <- sort(pop)
pop[1]


#-------------------------------------------------------------

library(dslabs)
data(murders)



pop <- murders$population
ord <- order(pop)
ord[1]

#--------------------------------------------------------------

library(dslabs)
data(murders)

# Find the index of the smallest value for the total variable
which.min(murders$total)

# Find the index of the smallest value of population






which.min(murders$population)



#---------------------------------------------------------------
library(dslabs)
data(murders)

# Define the variable i to be the index of the smallest state
i <- which.min(murders$population)






states <- murders$state
states[i]

#----------------------------------------------------------------
library(dslabs)
data(murders)

# Save temperatures in an object called `temp`
temp <- c(35, 88, 42, 84, 81, 30)

# Store city names in a `city` object
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Generate a data frame with city names and temperatures
city_temps <- data.frame(name = city, temperature = temp)
# Define a states variable `states` to contain the name of the
# states from the `murders` data set
states <- murders$state
ranks <- rank(murders$population)
my_df = data.frame(state = states,rank = ranks)
my_df


#-----------------------------------------------------------------------------
library(dslabs)
data(murders)

# Generate a variable `states` to contain the names of the states of the
# murders data set

states <- murders$state 

ranks = rank(murders$population)

ind <- order(murders$population)
# Generate a data frame `my_df` with the name of the state and its ordered rank
# from the smallest population to the largest population


## you will only understand if the concept is clear
my_df = data.frame(state = states[ind],rank = ranks[ind])
my_df


#-----------------------------------------------------------------------------
# Use the new data set
library(dslabs)
data(na_example)

# Review the structure
str(na_example)

# Find what the average of the entire data set is
mean(na_example)

# Use `is.na` to create a logical index on an object called `ind` that tells which entries are `NA`
ind <- is.na(na_example)

# Determine how many NAs exist in the variable ind using the sum function
sum(ind)
#-------------------------------------------------------------------------------

# Notice what we can do with the `!` operator
x <- c(1, 2, 3)
ind <- c(FALSE, TRUE, FALSE)
x
x[ind]
x[!ind]



# Generate the ind vector for 'na_example'
library(dslabs)
data(na_example)
ind <- is.na(na_example)

# When we try to calculate the average, we get `NA` as the answer
mean(na_example)

# Calculate the average of `na_example` after removing the
# input `NA` by using the `!` operator in `ind`
mean(na_example[!ind])





