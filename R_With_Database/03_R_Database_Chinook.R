library(dslabs)
library(RSQLite)
library(sqldf)
library(ggplot2)
setwd("/cloud/project/EDX_R/R_With_Database/")
### data
con <- dbConnect(SQLite(),"Chinook_Sqlite.sqlite")
dbListTables(con)
query <- function(q){
  df <- dbGetQuery(con,q)
  return (df)
}
## list all the customers
dbListFields(con,"Customer")
query("SELECT CustomerId,FirstName,LastName,Country FROM Customer")
## Count Total Customer
query("SELECT COUNT(*) AS Total_Customer FROM Customer")
## SELECT only the country from the customer table then show how 
## many distinct countries there
query("SELECT Country FROM Customer")
query("SELECT COUNT(Country) FROM Customer")
query("SELECT COUNT( DISTINCT Country) FROM Customer")
query("SELECT DISTINCT Country FROM Customer")
query("SELECT Country,COUNT(Country) FROM Customer GROUP BY Country")
## Find top 5 invoices by total amount
dbListFields(con,"Invoice")
query("SELECT InvoiceId,CustomerId,Total FROM Invoice ORDER BY Total DESC LIMIT 5")
## Top 5 Customer Based On Total Spending
query("SELECT CustomerId, SUM(Total) AS Total_Spent FROM Invoice GROUP BY CustomerID ORDER BY 2 DESC LIMIT 5")
## Now find the customer Name and round it up top 5 


query("SELECT c.CustomerId,c.FirstName || ' ' || c.LastName AS CustomerNamem,ROUND(SUM(i.Total),2) AS Total_Spent
      FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId ORDER BY 3 DESC LIMIT 5")

## FIND THE TOP 5 MOST PURCHASED TRACK 
## AND PLOT IT
head(query("SELECT * FROM Track"))
head(query("SELECT * FROM InvoiceLine"))
dbListFields(con,"InvoiceLine")
dbListFields(con,"Track")
df <- query("SELECT t.Name as Track_Name,COUNT(i.InvoiceLineId) AS Total_Purchase FROM Track t JOIN InvoiceLine i 
      ON t.TrackId = i.TrackId GROUP BY t.TrackId ORDER BY Total_Purchase  DESC LIMIT 10")
df
ggplot(df,aes(x=reorder(Track_Name,Total_Purchase),y=Total_Purchase))+
  geom_col()+
  coord_flip()



dbListTables(con)
dbListFields(con,"Genre")
dbListFields(con,"InvoiceLine")
dbListFields(con,"Track")



### Find the Top 3 Genre Based ON the Purchased History