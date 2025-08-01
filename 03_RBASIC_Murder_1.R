#-----------------
library(dslabs)
data(murders)
head(murders)
#-----------------
#----------------------------
murders$population  #accessor
names(murders)
#----------------------------
pop1 <- murders$population
print(pop1)

pop2 <- murders[["population"]]
print(pop2)

identical(pop1,pop2)

print(length(pop1))
#----------------------------
class(murders$state)  # character
class(murders$region) # categorical hence factor
#-----------------------------
z <- 2==3
class(z)
#-----------------------------
levels(murders$region)
#-----------------------------
factor(murders$region)

length(levels(murders$region))



#-----------------------------
x <- c("a", "a", "b", "b", "b", "c")
print(x)

# Here is an example of what the table 
# function does
table(x)

# Write a line of code to display the number 
# of states per region
names(murders)

#-----------------------------
table(murders$region)   # frequency of the value
#-----------------------------




