library(dplyr) # provides access to the storms data
library(RMySQL)

my_storms = storms
my_storms$datetime = paste0(storms$year, "-",storms$month, "-",storms$day, " ", storms$hour,":00:00")
my_storms = my_storms %>% select(name, datetime, lat, long, status, category, wind, pressure)

# Before running, you have to create a storms database in mysql first.
mydb = dbConnect(MySQL(), 
                 dbname = "storms",
                 host = "127.0.0.1",
                 port = 3301,
                 user = "root",
                 password = "jiehwan8")

# must return TRUE
dbWriteTable(mydb,'storms', 
             my_storms, 
             row.names = FALSE,
             overwrite = TRUE)

write.csv(my_storms,"C:\\Users\\user\\Desktop\\Project\\Elasticsearch\\storms.csv")
