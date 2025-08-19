library(dslabs)
library(RSQLite)
library(sqldf)
library(ggplot2)
setwd("/cloud/project/EDX_R/R_With_Database/")

### data
data(murders)
con <- dbConnect(SQLite(),"./murders.sqlite")
dbWriteTable(con,"murders",murders,overwrite=TRUE)

## show all the states and the population
sql1 <- "SELECT state,population FROM murders"
df1 <- dbGetQuery(con,sql1)
head(df1)
ggplot(df1,aes(x=reorder(state,population),y=population))+
  geom_col()+
  coord_flip()


## find top 10 states for total murders
sql2 <- "SELECT state,total from murders ORDER BY total DESC LIMIT 10"
df2 <- dbGetQuery(con,sql2)
df2

ggplot(df2,aes(x=reorder(state,total),y=total))+
  geom_col()+
  coord_flip()



## average murder rate for top 10 state
sql3 <- "SELECT state,(total*100000.0/population) AS murder_rate FROM murders LIMIT 10 "
df3 <- dbGetQuery(con,sql3)
ggplot(df3,aes(x=reorder(state,murder_rate),y=murder_rate))+
  geom_col()+
  coord_flip()


## Total murder by region
sql4 = "SELECT region,SUM(total) AS total_murder FROM murders GROUP BY region"
df4 <- dbGetQuery(con,sql4)
ggplot(df4,aes(x=reorder(region,total_murder),y=total_murder))+
  geom_col()+
  coord_flip()



## Highest murder for each Region
sql5 <- "SELECT region,MAX(total*100000.0/population) AS max_rate from murders GROUP BY region"
df5 <- dbGetQuery(con,sql5)
ggplot(df5,aes(x=reorder(region,max_rate),y=max_rate))+
  geom_col()+
  coord_flip()


## plot the states which are bellow average murder rate

sql_6_1 <- "SELECT SUM(total)*100000.0/SUM(population) AS avg_murder_rate FROM murders"
df_6_1 <- dbGetQuery(con,sql_6_1)
print(df_6_1)

sql_6_2 <- paste0("SELECT state,(total*100000.0/population) AS murder_rate FROM murders WHERE (total*100000.0/population) < ", df_6_1)
print(sql_6_2)

df6 <- dbGetQuery(con,sql_6_2)
df6
ggplot(df6,aes(x=reorder(state,murder_rate),y=murder_rate))+
  geom_col()+
  coord_flip()



## compare North and South region murder rate
## region is 'Northeast','South'


sql7 <- "SELECT region, AVG(total*100000/population) as avg_rate FROM murders WHERE region IN ('Northeast','South') GROUP BY region"
df7 <- dbGetQuery(con,sql7)
ggplot(df7, aes(x=region, y=avg_rate, fill=region)) +
  geom_col() +
  labs(title="Average Murder Rate: Northeast vs South", y="Murder Rate (per 100k)")



## top 5 most populous state and murder rate
sql8 <- "SELECT state,population,(total*100000/population) AS murder_rate FROM murders ORDER BY population DESC LIMIT 5"
df8 <- dbGetQuery(con,sql8)

ggplot(df8, aes(x=reorder(state, murder_rate), y=murder_rate, fill=state)) +
  geom_col() +
  labs(title="Murder Rates in Top 5 Most Populous States", y="Murder Rate (per 100k)")

ggplot(df8,aes(x=population,y=murder_rate))+
  geom_point(color="red",size=3)+
  geom_smooth(method="lm")

