--Tom Morse
--Homework 1
--database management

--1

SELECT 
  *
FROM 
  customers

--2

SELECT	
  agents.name, agents.city
FROM
  agents
WHERE
  agents.name = 'Smith'

--3

SELECT 
 products.pid, products.name, products.quantity 
FROM
  products
WHERE
  products.priceusd > '1.25'

--4

SELECT 
  orders.ordno, orders.aid
FROM
  orders

--5

SELECT 
  customers.name, customers.city
FROM
  customers
WHERE
  customers.city != 'Dallas'

--6

SELECT 
  agents.name
FROM
  agents
WHERE
  agents.city = 'New York' OR agents.city = 'Newark' 

--7

SELECT 
  *
FROM
  products
WHERE
 products.city != 'Newark' AND products.city != 'New York' AND products.priceusd <= 1

--8

SELECT 
  *
FROM
  orders
WHERE
  orders.mon = 'jan' OR orders.mon = 'mar'

--9 no data in this table for this question

SELECT 
  *
FROM
  orders
WHERE
  orders.mon = 'feb' AND orders.dollars < '100'

--10 no data in this table for this question either

SELECT 
  *
FROM
  orders
WHERE
  orders.cid = 'c005'