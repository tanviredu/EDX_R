library(dslabs)
data(murders)
codes <- c(380,124,818)
print(codes)
country <- c("italy","canada","egypt")
print(country)
names(codes) <- country  ## setting the column name
names(codes)

## what names() do in R
## it set the name of the column in a data
# Using square brackets is useful for subsetting to access specific elements of a vector
codes[2]
codes[c(1,3)]
codes[1:2]

# If the entries of a vector are named, they may be accessed by referring to their name
codes["canada"]
codes[c("egypt","italy")]

