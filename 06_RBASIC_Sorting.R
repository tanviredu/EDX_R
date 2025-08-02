library(dslabs)
data(murders)

#--------------------------
#first 6 row of the data
head(murders)
#--------------------------
#--------------------------
#create a  vector
x <- c(31,4,15,92,65)
print(x)
sort(x)

# order() will return sorted index

#------------------------------------
print(x)
index <- order(x)
print(index)
print(x[index])
#------------------------------------

#------------------------------------
index <- order(murders$total)
print(index)
print(murders$abb)
print(murders$abb[index])
names(murders)
print(murders$region)
print(murders$region[index])
#------------------------------------

#-------------------------------------
# find the max murder state

max_index = which.max(murders$total)
print(max_index)
print(murders$abb[max_index])

# find the min murder state

min_index = which.min(murders$total)
print(min_index)
print(murders$abb[min_index])

#------------------------------------

x<- c(31,4,15,92,65)
print(x)
rank(x)


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


# Sort the object and save it to the same object


# Report the smallest population size in `pop`











