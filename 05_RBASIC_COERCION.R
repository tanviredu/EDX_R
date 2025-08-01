seq1_number <- seq(1,10,.5)
print(seq1_number)
seq2_number <- 1:10
print(seq2_number)


#--------------------------
#COERCION Is a process of assigning type if the 
# R Compiler is not sure
# for example
x <- c(1,"canada",3)
# it will convert the whole vector as a character class
print(x)
class(x)


#--------------------------------------------------------
# Associate the cost values ​​with their corresponding food
cost <- c(50, 75, 90, 100, 150)
food <- c("pizza", "burgers", "salads", "cheese", "pasta")
names(cost) <- food

# This code has been written for you already
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Associate the temperature values ​​with their corresponding city
names(temp) <- city
print(temp)


#-------------------------------------------------------
# Here is an example on how to create a numerical vector with the costs called cost
cost <- c(50, 75, 90, 100, 150)

# Create a numeric vector to store the temperatures listed in the
# instructions in a vector called temp
# Make sure you follow the same order in the instructions

temp = c(35,88,42,84,81,30) 
class(temp)

#-------------------------------------------------------
# Here is an example of how to create a character vector with the example of
#food that we will call food.
food <- c("pizza", "burgers", "salads", "cheese", "pasta")

# Generate a character vector called city to store names
# of cities
# Make sure you follow the same order as in the instructions
city = c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan","Toronto")

#---------------------------------------------------------

cost <- c(50, 75, 90, 100, 150)
food <- c("pizza", "burgers", "salads", "cheese", "pasta")
names(cost) <- food

temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp) <- city

# Cost of the last 3 items on our food list:
cost[3:5]

# Temperatures of the first three cities on the list:
temp[1:3]

#----------------------------------------------------------
cost <- c(50, 75, 90, 100, 150)
food <- c("pizza", "burgers", "salads", "cheese", "pasta")
names(cost) <- food

temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp) <- city

# Access the cost of pizza and pasta from our list
cost[c(1,5)]

# Define temp
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp) <- city

# Access the temperatures of Paris and San Juan
temp[c("Paris","San Juan")]

#------------------------------------------------
# Generate a vector with multiples of 7, less than 50.
seq(7, 49, 7)

# Generate a vector containing all odd positive numbers less than
# 100.
# The numbers must be in ascending order.
seq(1,100,2)


#-------------------------------------------------
# We can create a vector with multiples of 7, less than 50 from the following
#manner
seq(7, 49, 7)

# But note that the second argument does not need to be the last number.
# Simply determines the largest number allowed.
# So the following line of code produces the same vector as seq(7, 49, 7)
seq(7, 50, 7)

# Generate a sequence of numbers from 6 to 55, in increments of 4/7 and determine
# its size.

length(seq(6,55,(4/7)))


#-------------------------------------------------
#The seq() function has another useful argument: length.out. 
#This argument allows us to generate sequences that increment 
#by the same value but generate a vector of a specific length.

#For example, this line of code:

a <- seq(1, 10, length.out = 100)
print(a)
class(a)

#---------------------------------------------------
# Save the sequence in an object a
a <- seq(1,10)

# Determine the class of a
class(a)
#---------------------------------------------------
class(1)
class(1L)
#---------------------------------------------------
# Define the vector x
x <- c(1, 3, 5,"a")

# Note that x is a character vector
as.numeric(x)

# Use `as.numeric()` to redefine `x` as a numeric vector
# You will get a warning message but that's okay!
