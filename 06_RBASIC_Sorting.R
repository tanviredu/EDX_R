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


