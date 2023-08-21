# Data Transfromation : Database on PostgreSQL Project
-- create a few tables about pizza restaurants
  
library(RPostgreSQL)
library(tidyverse)

## connect to SQL server (postgresql)
con <- dbConnect(PostgreSQL(), 
                 host = "arjuna.db.elephantsql.com",
                 port = 5432,
                 user = "trjgwkzr",
                 password = "a6G4vrNDCn_JrC6XcMxvuil35JOeLME5",
                 dbname = "trjgwkzr")
dbListTables(con)

## create simple database
pizza_menu <- data.frame(id = 1:5,
                         menu = c("Veggie Cheese", "Hawaiian Triple Cheese", "Chicken Triple Cheese", "Seafood & Hokkaido Cheese", "Bacon & Hokkaido Cheese"))
dbWriteTable(con, "pizza_menu", pizza_menu)

pizza_customers <- data.frame(id = 1:4,
                              name = c("Bluu", "Karina", "Winter", "Fuyu"))
dbWriteTable(con, "pizza_customers", pizza_customers)


pizza_size <- data.frame(id = 1:3,
                         size = c("Small", "Medium", "Large"))
dbWriteTable(con, "pizza_size", pizza_size)

## get data
dbGetQuery(con, "SELECT pizza_menu.id, pizza_menu.menu,
           pizza_customers.name, pizza_size.size
           FROM pizza_menu
           INNER JOIN pizza_customers
           ON pizza_menu.id = pizza_customers.name
           INNER JOIN pizza_size
           ON pizza_menu.id = pizza_size.size")

or dbGetQuery(con, "select * from pizza_menu")

## delete table 
dbRemoveTable(con, "pizza_menu")
dbRemoveTable(con, "pizza_customers")
dbRemoveTable(con, "pizza_size")

## close connection
dbListTables(con)
