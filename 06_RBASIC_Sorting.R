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
# you need to find the max and min state in crime
# but you can only use the rank() and sort() function

index <- rank()













