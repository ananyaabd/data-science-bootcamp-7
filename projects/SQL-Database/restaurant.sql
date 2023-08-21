# SQL-Database : Restaurant Project

-- open my database
.open restaurant.db

  
-- create table customers
CREATE TABLE IF NOT EXISTS customers (
    id int unique,
    name text,
    city text);

INSERT INTO customers VALUES 
    (1, "Karina", "Seoul"),
    (2, "Winter", "London"),
    (3, "Bluu", "Paris"),
    (4, "Fuyu", "Tokyo"),
    (5, "Habibi", "Paris");

.table
.mode column
select * from customers;


-- create table menus
CREATE TABLE IF NOT EXISTS menus (
    menuid int unique,
    name text,
    price real);

INSERT INTO menus VALUES 
    (1, "Barbecue chicken wings",200),
    (2, "Grill beef", 160),
    (3, "Prawns satay", 220),
    (4, "Calamari rings", 350),
    (5, "Shrimp cakes", 180),
    (6, "Cheese Nachos", 220),
    (7, "Garlic bread", 120);

.table
.mode column 
select * from menus;


-- create table transactions
CREATE TABLE IF NOT EXISTS transactions (
    bill_id int,
    bill_date text,
    menu_id int,
    customer_id int); 

INSERT INTO transactions VALUES 
    (1, "2001-03-09", 1, 1),
    (2, "2001-03-09", 2, 3),
    (3, "2001-03-09", 4, 1),
    (4, "2001-03-11", 5, 2),
    (5, "2001-03-11", 3, 4),
    (6, "2001-03-12", 1, 2),
    (7, "2001-03-13", 7, 3), 
    (8, "2001-03-14", 6, 5);

.table
.mode column 
select * from transactions;


-- change how we display data in terminal/ shell
.table
.mode column
select * from customers;
select * from menus;
select * from transactions;


-- join
select
  transactions.bill_date, 
    customers.name as customers_name,
    menus.name as menus_name,
    menus.price as menus_price
from customers
join transactions
on customers.id = transactions.customer_id
JOIN menus
on transactions.menu_id = menus.menuid;


-- subquery & with (common table expression)
with sub1 as (
  select * from customers
  where city = 'Paris'
  
), sub2 as (
  select * from transactions
  where STRFTIME('%Y', bill_date) = '2001'
)
select
  sub2.bill_date,
  sub1.name
from sub1
join sub2
on sub1.id = sub2.customer_id;


-- aggregate funtion
select 
  menus.name,
  COUNT(*)
from customers
join transactions
on customers.id = transactions.customer_id
JOIN menus
on transactions.menu_id = menus.menuid
group by 1;
