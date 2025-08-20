# Install if not already
# install.packages(c("DBI", "RSQLite", "readr"))

library(DBI)
library(RSQLite)
library(readr)
setwd("/cloud/project/EDX_R/R_With_Database/WorldLeader/")
# List your CSV files
csv_files <- c("monarchs.csv", "presidents.csv", "prime_minister_terms.csv", "prime_ministers.csv", "states.csv")

# Create (or connect to) SQLite database
con <- dbConnect(SQLite(), "my_database.sqlite")

# Loop over CSVs and write each as a table
for (f in csv_files) {
  # Read CSV
  df <- read_csv(f)
  
  # Use filename (without extension) as table name
  table_name <- tools::file_path_sans_ext(basename(f))
  
  # Write dataframe into SQLite (overwrite if table exists)
  dbWriteTable(con, table_name, df, overwrite = TRUE)
  
  message("Loaded ", f, " into table: ", table_name)
}

# Check tables in database
dbListTables(con)

query <- function(q){
  df <- dbGetQuery(con,q)
  return (df)
}


query("SELECT * FROM monarchs")
query("SELECT * FROM presidents")
query("SELECT * FROM prime_ministers")
query("SELECT * FROM prime_minister_terms")
query("SELECT * FROM states")


## SELECT ALL monarchs with their country
query("SELECT monarch,country FROM monarchs")
## find all precidents of the USA
query("SELECT country ,COUNT(president) FROM presidents GROUP BY country")
query("SELECT country ,president FROM presidents WHERE country = 'USA'")


query("SELECT * FROM prime_minister_terms")
## SHOW PRIME MISTIERS WHO START AFTER 2015

query("SELECT prime_minister,pm_start FROM prime_minister_terms WHERE pm_start > 2015")

## HOW MANY MONARCH in Each CONTINENT

query("SELECT * FROM monarchs")

query("SELECT continent,COUNT(monarch) FROM monarchs GROUP BY continent ORDER BY COUNT(monarch) DESC")



## Find all leaders monarchs+presidents fron Europe
query("SELECT * FROM monarchs")
query("SELECT * FROM presidents")

query("SELECT monarch AS leader,country,'Monarch' AS role FROM monarchs WHERE continent='Europe'
      UNION
       SELECT president AS leader,country,'President' AS role FROM presidents WHERE continent='Europe'
      ")



query("SELECT monarch AS leader, country, 'Monarch' AS role
FROM monarchs
WHERE continent = 'Europe'
UNION
SELECT president, country, 'President'
FROM presidents
WHERE continent = 'Europe';")


## Find the countries that have both a monarch and a president in your dataset.

query("SELECT * FROM monarchs")
query("SELECT * FROM presidents")

## 
query("SELECT m.country FROM monarchs m JOIN presidents p ON m.country = p.country")



## Find all the presidents whose name start with A
query("SELECT * FROM presidents")
query("SELECT president,country FROM presidents WHERE president LIKE 'A%'")



## Get the minister who started earliest in 2 different was
query("SELECT prime_minister FROM prime_minister_terms WHERE pm_start = (SELECT MIN(pm_start) FROM prime_minister_terms)")
query("SELECT prime_minister FROM prime_minister_terms ORDER BY pm_start ASC LIMIT 1")


## count Leader Per continent