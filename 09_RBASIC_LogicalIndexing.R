library(dslabs)
data(murders)
murder_rate <- murders$total / murders$population * 100000
murder_rate

index <- murder_rate <=0.71
index
sum(index)
murders$state[index]

west <- murders$region == "West"

f_index = index & west
f_index
murders$state[f_index]

murder_rate <- murders$total / murders$population * 100000
# creating a logical vector that specifies if the murder rate in that state is less than or equal to 0.71
index <- murder_rate <= 0.71
# determining which states have murder rates less than or equal to 0.71
murders$state[index]
# calculating how many states have a murder rate less than or equal to 0.71
sum(index)

# creating the two logical vectors representing our conditions
west <- murders$region == "West"
safe <- murder_rate <= .71
# defining an index and identifying states with both conditions true
index <- safe & west
murders$state[index]
