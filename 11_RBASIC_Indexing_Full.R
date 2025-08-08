library(dslabs)
data(murders)
murders

murder_rate <- murders$total/murders$population * 100000
murder_rate

murders["rate"] <- murder_rate

index <- murders$rate <= 0.71
index

murders$state[index]

sum(index)

west <- murders$region == "West"
west
safe <- murders$rate <= 1
safe

target_index <- safe & west

murders$state[target_index]


#which

x <- c(FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)
which(x)

index <- which(murders$state == "Massachusetts")
index
murders$state[index]
murders$rate[index]


index <- match(c("Hawaii","Idaho","Oregon","Utah","Wyoming"),murders$state)
index

murders$state[index]

murders$rate[index]
target_state <- c("Hawaii","Idah","Oregon","Utah","Wyoming")
index <- target_state %in% murders$state
index


#match
# %in%




#############

library(dslabs)
data(murders)

# Store the homicide rate per 100,000 for each state, in
# `murder_rate`
murder_rate <- murders$total / murders$population * 100000

# Save homicide rate values ​​per 100,000 that are lower
# than 1,`murder_rate < 1`, in the `low` object

low <- murder_rate < 1


#low
###########

library(dslabs)
data(murders)

# Store the homicide rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total/murders$population*100000

# Store `murder_rate` < 1 values in `low`
low <- murder_rate < 1

# Determine the `murder_rate` indices associated with values lower than 1
which(low)
#####

library(dslabs)
data(murders)

# Save the murder rate per 100,000 for each state, in murder_rate
murder_rate <- murders$total/murders$population*100000

# Save murder_rate < 1 values ​​to low
low <- murder_rate < 1

# Names of states with homicide rates lower than 1
murders$state[low]

####
library(dslabs)
data(murders)

# Save the homicide rate per 100,000 for each state, in
#`murder_rate`
murder_rate <- murders$total / murders$population * 100000

# Save `murder_rate` values ​​< 1 to `low`

low <- murder_rate < 1
low 
# Create an `ind` vector for states located in the northeast and with rates of
# homicide lower than 1.

ind <- low & murders$region == "Northeast"  


# `ind` state names

murders$state[ind]

##

library(dslabs)
data(murders)

# Save the homicide rate per 100,000 for each state, in
# `murder_rate`

murder_rate <- murders$total / murders$population * 100000

avg <- mean(murder_rate)

# Calculate the average homicide rate using `mean` and store it in an object
# called `avg`

# How many states have homicide rates below average? Count them
# using `sum`
sum(murder_rate < avg)
######

library(dslabs)
data(murders)

# Store the 3 abbreviations of interest in a vector named `abbs`
# (remember these are character vectors and require quotes)
abbs <- c("AK", "MI", "IA").

# Match the abbs to the `murders$abb` and store them in `ind`
ind <- match(abbs,murders$abb)
# Use `ind` to retrieve the names of the states
murders$state[ind]

##


library(dslabs)
data(murders)

# Save the 5 abbreviations of interest to `abbs`. (remember that they are vectors of
# characters)

abbs <- c("MA", "ME", "MI", "MO", "MU")

# Use the %in% operator to check if the `abbs` entries are
# abbreviations in the homicide data frame
abbs %in% murders$abb

####


library(dslabs)
data(murders)

# Store all 5 abbreviations in `abbs`. (Remember these are character vectors)
abbs <- c("MA", "ME", "MI", "MO", "MU")

# Use the `which` function and the `!` operator to find out
# which of the indexed abbreviations are not part of the set
# of data and store them in `ind`

ind <- which(!abbs %in% murders$abb)

abbs[ind]



# Show `abbs` entries that are not real abbreviations









