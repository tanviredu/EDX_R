library(dslabs)
library(RSQLite)
library(sqldf)
library(ggplot2)
setwd("/cloud/project/EDX_R/R_With_Database/")

### data
data(murders)
con <- dbConnect(SQLite(),"./murders.sqlite")
dbWriteTable(con,"murders",murders,overwrite=TRUE)


regions_info <- data.frame(
  region = c("Northeast", "South", "North Central", "West"),
  area_sqkm = c(469000, 1240000, 2000000, 4300000),
  major_city = c("New York", "Houston", "Chicago", "Los Angeles")
)

dbWriteTable(con, "regions_info", regions_info, overwrite = TRUE)


#### List each state with its region and a major city of that region


sql1 <- "SELECT m.state,m.region,r.major_city FROM murders m LEFT JOIN regions_info r ON m.region = r.region"
df1 <- dbGetQuery(con,sql1)
head(df1)


#### Find total murders per region and show the region’s land area.
sql2 <- "SELECT m.region, SUM(m.total) AS total_murder,r.area_sqkm FROM murders m JOIN regions_info r ON m.region = r.region GROUP BY m.region"
df2 <- dbGetQuery(con,sql2)
df2
ggplot(df2,aes(x=reorder(region,total_murder),y=total_murder,fill=region))+
  geom_col()+
  labs(title="murder By region")
