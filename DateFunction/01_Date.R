library(lubridate)


## datasets
orders <- data.frame(
  order_id = 1:8,
  order_date = c("2024-01-15", "2024-03-22", "2024-05-10", "2024-07-04", 
                 "2024-08-19", "2024-10-31", "2024-12-25", "2025-02-14"),
  delivery_date = c("2024-01-20", "2024-03-28", "2024-05-15", "2024-07-07",
                    "2024-08-25", "2024-11-05", "2024-12-31", "2025-02-20")
)

orders

## convert to date object

orders$order_date = ymd(orders$order_date)
orders$delivery_date = ymd(orders$delivery_date)

orders

typeof(orders$order_date)
typeof(orders$delivery_date)

class(orders$order_date)
class(orders$delivery_date)

orders2<- orders
orders2

### convert the yy-mm-dd to mm-dd-yy


orders2$order_date <- format(orders2$order_date,"%m-%d-%Y")
orders2$delivery_date <- format(orders2$delivery_date,"%m-%d-%Y")
orders2


mdy("August 15, 2025")
ymd("2025 August 15")

year(orders$order_date)
year(orders$delivery_date)


### find the month name 
month(orders$order_date,label=TRUE,abbr = FALSE)

## day
day(orders$order_date)

## calculate the day between order_date and elivery date
orders$delivery_day <- orders$delivery_date - orders$order_date
orders$delivery_day
orders

orders$delivery_hours <- as.numeric(orders$delivery_day * 24)
orders

## using the difftime to get the same solutions

orders$delivery_h_dff <- difftime(orders$delivery_date,orders$order_date,units="hours")
orders

orders$delivery_second_dff <- difftime(orders$delivery_date,orders$order_date,units="secs")
orders

orders$diff_in_min <- difftime(orders$delivery_date,orders$order_date,units = "mins")
orders




