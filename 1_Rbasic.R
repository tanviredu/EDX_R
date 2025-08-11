# Problem 1
# You are given the murders dataset from the dslabs package, which contains US gun murder data for 2010.
# Your task is to create a ggplot2 visualization that shows:
# A scatter plot where:
# x-axis = population in millions
# y-axis = total number of murders

library(dslabs)
library(ggplot2)
data(murders)
population <- murders$population/10^6
ggplot(data=murders,aes(x=population,y=total))+geom_point()


# remember the ggplot will setup everything and the geom_point() witll draw the scatter


# Problem 2
# Modify the scatter plot so that each point is colored according to its region.
# you added the dataset then the x then the y and then color based on region
library(dslabs)
library(ggplot2)
data(murders)
population <- murders$population/10^6
ggplot(data=murders,aes(x=population,y=total,color=region))+ geom_point()


# Problem 3
# Add state abbreviations as text labels to each point.
## if you need to add label you have to add geom_text(size=4) in adddtion to the geom_point()
library(dslabs)
library(ggplot2)
data(murders)
population <- murders$population/10^6
ggplot(data=murders,aes(x=population,y=total,color=region,label=abb))+
  geom_point()+
  geom_text(nudge_x=5000000,size=4)


# Problem 4
# You have a scatter plot of population vs total murders with state abbreviations as labels.
# The labels are currently overlapping with the points, making them hard to read.

# Task:
# Move the labels slightly to the right and make them smaller for better readability.

library(dslabs)
library(ggplot2)
data("murders")
ggplot(data=murders,aes(x=population,y=total,color=region,label=abb))+
  geom_point()+
  geom_text(nudge_x=550000,size=2)


# Problem 5
# You have a scatter plot of population vs total murders with colored points by region and state abbreviations moved for readability.
# Now you want the chart to look more informative by adding:
# A main title
# X-axis label
# Y-axis label
#Legend title for the colors

library(dslabs)
library(ggplot2)
data("murders")
ggplot(data = murders,aes(x=population,y=total,color=region,label=abb))+
  geom_point()+
  labs(
    title="Population VS murder",
    x="population",
    y="Total Murder",
    color="Region"
  )
       


# Problem 6
# The scatter plot currently uses the raw population and total murder numbers, which makes it hard to 
# compare smaller and larger states because the bigger states dominate the scale.
# Task:
# Modify the plot so that both the x-axis (population) and y-axis (total murders) use a logarithmic scale.
# Keep the colored points by region and labels with slight nudge for readability.

library(dslabs)
library(ggplot2)

data("murders")
ggplot(data=murders,aes(x=population,y=total,color=region,label=abb))+
  geom_point()+
  scale_x_log10()+
  scale_y_log10()+
  labs(
    Title="Murder VS Popuation (log-log scale)",
    x="population",
    y="murder",
    color="Region"
  )
## problem 7 practice
library(dplyr)
df <- data.frame(group = c("A","B","A","B","B"),
                 value = c(10,15,5,8,7))
df %>% group_by(group) %>% summarize(total = sum(value))


# Problem 7
# Using the murders dataset:
# Calculate the total number of murders for each region.
# Then create a bar chart showing total murders per region.

library(dslabs)
library(ggplot2)
library(dplyr)
data(murders)

murder_by_region <- murders %>% group_by(region) %>% summarize(total_murders = sum(total))
murder_by_region



ggplot(data=murder_by_region,aes(x=region,y=total_murders,fill=region))+
  geom_bar(stat="identity")

# What is stat in geom_bar()?
# In ggplot2, a stat (short for "statistic") tells ggplot how to compute the data that will be plotted.
# The default for geom_bar() is stat = "count", which means:
# Count how many observations there are in each category and plot those counts as bar heights.
# What does stat = "identity" mean?
# stat = "identity" means:
# Use the data as is — don’t do any counting or summarizing.
# Plot the values you give directly.
# This is useful when you already have summarized data (like totals or averages), so you want ggplot to plot those numbers directly


## problem 8 practice
## how the Distribution of murder rates

murders = mutate(murders,murder_rate = total/population*100000)

ggplot(murders,aes(x=murder_rate))+
  geom_histogram(binwidth=1)


# problem 9
# Using the murders dataset, create a scatter plot of population vs total murders.
# Color points by region.
# Use a logarithmic scale on both axes (log base 10).
# Add a title and axis labels.

library(dslabs)
library(dplyr)
library(ggplot2)


ggplot(data=murders,aes(x=population,y=total,color=region))+
  geom_point()+
  scale_x_log10()+
  scale_y_log10()+
  labs(
    Title = "Murder VS Population",
    x="Population",
    y="total murder",
    color="Region"
  )+theme_minimal()


# Problem 14
# Using the murders dataset:
# Calculate the murder rate (total / population * 100000) if you haven’t already.
# Create a boxplot of the murder rate grouped by region.
# Add appropriate title and axis labels.
# Use different fill colors for each region

library(dslabs)
library(dplyr)
library(ggplot2)
data(murders)

murders <- mutate(murders,murder_rate = total/population*100000)

ggplot(murders,aes(x=region,y=murder_rate,fill=region))+
  geom_boxplot()+
  labs(
    title="Murder Rate By Region",
    x="Region",
    y="Murder Rate per 100,000 people"
  )+
  theme_minimal()



# Problem 16
# Using the built-in economics dataset, create a line plot showing how the unemployment rate (unemploy) changed over time.
# Task:
#  Use date on the x-axis.
#  Use unemploy on the y-axis.
#  Add title and axis labels.


data(economics)
economics

ggplot(economics,aes(x=date,y=unemploy))+
  geom_line(color="blue",linewidth=1)+
  labs(
    title="Unemployement over Time in US",
    x="Year",
    y="Unemployed in Thousands"
  )+ theme_minimal()


# Example 17: Total Murders by Region
# Problem:
# Calculate the total number of murders for each region and plot it as a bar chart.
library(ggplot2)
library(dplyr)
data(murders)

murders_by_region <- murders %>% group_by(region) %>% summarize(total_murder = sum(total))
murders_by_region

ggplot(murders_by_region,aes(x=region,y=total_murder,color=region,fill=region))+
  geom_bar(stat = "identity")


# Example 18: Average population by Region
# Problem:
# Calculate the Average population for each region and plot it as a bar chart.

avg_population <- murders %>% group_by(region) %>% summarize(avg_pop = mean(population))
avg_population

ggplot(data=avg_population,aes(x=region,y=avg_pop,fill=region))+
  geom_bar(stat="identity")+
labs(
  title = "Average Population by Region",
  x = "Region",
  y = "Average Population"
) +
  theme_minimal() 

  
# Example 19: Maximum Murder Rate by Region
# Problem:
#  Find the maximum murder rate (murders per 100,000 people) in each region.
# Calculate the murder rate per state first.
# Then summarize max murder rate by region.
# Plot the results as a bar chart.
  
  
  
  
  
  

