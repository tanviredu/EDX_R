library(dslabs)
data(murders)
x <- c(FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)
which(x)    # returns indices that are TRUE

murders$state

index_1 = which(murders$state=="Massachusetts")
index_1
murders$state[index_1]
L_index_2 = murders$state =="Massachusetts"
L_index_2
murders$state[L_index_2]
index <- match(c("New York", "Florida", "Texas"), murders$state)

index
murder_rate[index]
df <- data.frame(state = murders$state[index],murder_rate[index] )
df

c("Boston", "Dakota", "Washington") %in% murders$state


