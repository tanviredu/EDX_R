library(dslabs)
library(RSQLite)
library(sqldf)
library(ggplot2)
setwd("/cloud/project/EDX_R/R_With_Database/Chinook_Work")
### data
con <- dbConnect(SQLite(),"Chinook_Sqlite.sqlite")
dbListTables(con)
query <- function(q){
  df <- dbGetQuery(con,q)
  return (df)
}



## Find top 5 invoices By Total Amount

query("SELECT InvoiceId,CustomerId,Total FROM Invoice ORDER BY Total DESC LIMIT 5")

# 5. Find invoices from USA customers
query("SELECT i.InvoiceId,i.CustomerId,i.Total,c.FirstName,c.LastName,c.Country FROM Invoice i JOIN Customer c ON c.CustomerId = i.CustomerId WHERE C.Country='USA'")

## find the number of invoices per country

df2 <- query("SELECT c.Country,COUNT(i.InvoiceId) AS InvoiceCount FROM
      Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId
      GROUP BY c.Country
      ORDER BY InvoiceCount DESC
      ")
df2
ggplot(df2,aes(x=reorder(Country,InvoiceCount),y=InvoiceCount))+
  geom_col()+
  geom_text(aes(label=InvoiceCount),hjust=-0.2)+
  coord_flip()


## Find avg invoice Total By Country
df3 <- query("SELECT c.Country,AVG(i.Total) AS avg_invoice FROM Customer c JOIN Invoice i 
             on c.CustomerId = i.CustomerId
             GROUP BY c.Country
             ORDER BY avg_invoice DESC")

df3

ggplot(df3,aes(x=reorder(Country,avg_invoice),y=avg_invoice))+
  geom_col()+
#  geom_text(aes(label=avg_invoice))+
  coord_flip()


# Find TOP 5 customers who spent more than $40 in total
# And they are from USA
#

df4 <- query("SELECT c.FirstName,c.LastName,c.CustomerId,C.Country,SUM(i.Total) AS Total_Spent
      FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId
      WHERE c.Country = 'USA'
      GROUP BY c.CustomerId
      HAVING SUM(i.Total) > 40
      ORDER BY Total_Spent DESC
      ")

ggplot(df4,aes(x=reorder(FirstName,Total_Spent),y=Total_Spent))+
  geom_col()+
  geom_text(aes(label=Total_Spent),hjust=-.2)+
  coord_flip()




## Find the top 5 most purchased Truck
## 
df4 <-query("SELECT t.Name,COUNT(i.InvoiceLineId) AS TotalPurchase FROM Track t JOIN InvoiceLine i 
      ON t.TrackId = i.TrackId
      GROUP BY t.Name
      ORDER BY TotalPurchase DESC
      LIMIT 5
      ")

ggplot(df4,aes(x=reorder(Name,TotalPurchase),y=TotalPurchase))+
  geom_col()+
  geom_text(aes(label=TotalPurchase),hjust=-.2)+
  coord_flip()

# Find the top 3 genres by number of purchases


df5 <-query("SELECT g.Name,COUNT(i.InvoiceLineId) AS Total_Purchase FROM 
      Genre g JOIN Track t ON g.GenreId = t.GenreID
      JOIN InvoiceLine i
      ON t.TrackId = i.TrackId
      GROUP BY g.Name
      ORDER BY Total_Purchase DESC
      LIMIT 3
      ")

ggplot(df5,aes(x=reorder(Name,Total_Purchase),y=Total_Purchase))+
  geom_col()+
  geom_text(aes(label=Total_Purchase),hjust=-.2)+
  coord_flip()

## Find customers who bought the most Rock tracks

df6 <- query("SELECT c.CustomerId, c.FirstName || '' || c.LastName AS Full_Name,COUNT(ii.InvoiceLineId) AS Total_Purchase_Count  FROM 
      Customer C 
      JOIN Invoice i ON c.CustomerId = i.InvoiceId
      JOIN InvoiceLine ii ON i.InvoiceId = ii.InvoiceId
      JOIN Track t ON t.TrackId = ii.TrackId
      JOIN Genre g ON g.GenreId = t.GenreId
      WHERE g.Name = 'Rock'
      GROUP BY c.CustomerId
      ORDER BY COUNT(ii.InvoiceId) DESC
      LIMIT 5
      ")

ggplot(df6,aes(x=reorder(Full_Name,Total_Purchase_Count),y=Total_Purchase_Count))+
  geom_col()+
  geom_text(aes(label=Total_Purchase_Count),hjust=-.2)+
  coord_flip()

# Find monthly sales totals
query("SELECT * FROM Invoice Limit 5")

