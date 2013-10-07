--Tom Morse
--Database Management
--Homework SQL 3

--1

SELECT DISTINCT
  agents.city
FROM
  agents
WHERE
  agents.aid IN
    (SELECT
       orders.aid
     FROM
       orders
     WHERE
       orders.cid = 'c002')

--2

SELECT DISTINCT
  a.city
FROM
  agents a, orders o
WHERE
  a.aid = o.aid
  AND
  o.cid = 'c002'

--3

SELECT DISTINCT
  orders.pid
FROM
  orders
WHERE
  orders.aid IN
    (SELECT
        orders.aid
     FROM
        orders
     WHERE
        orders.cid IN 
          (SELECT
             customers.cid
           FROM 
             customers
           WHERE
             customers.city = 'Kyoto'))

--4

SELECT DISTINCT
  o1.pid
FROM
  orders o1, orders o2, customers c
WHERE
  o1.aid = o2.aid
  AND
  o2.cid = c.cid
  AND
  c.city = 'Kyoto'
ORDER BY
  o1.pid ASC
  
--5

SELECT 
  customers.name, customers.cid
FROM
  customers
WHERE
  customers.cid NOT IN
   (SELECT
      orders.cid
    FROM
      orders
    WHERE
      orders.cid = orders.cid)

--6


SELECT 
  c.name, c.cid
FROM
  customers c left outer join orders o
ON
  o.cid = c.cid
WHERE
  o.cid is null
ORDER BY
  c.cid

--7

SELECT DISTINCT
  c.name, a.name
FROM 
  customers c, orders o1, orders o2, agents a
WHERE
  a.aid = o1.aid
  AND
  o1.aid = o2.aid
  AND
  o2.cid = c.cid
  AND 
  c.city = a.city

--8

SELECT
  c.name, a.name, c.city
FROM
  customers c, agents a
WHERE
  c.city = a.city

--9

SELECT DISTINCT
  c.name, c.city
FROM
  customers c, products p
WHERE
  p.city = 'Duluth'
  AND
  c.city = 'Duluth'

--10

SELECT DISTINCT
  c.name, c.city
FROM
  customers c, products p
WHERE
  p.city = 'Dallas'
  AND
  c.city = 'Dallas'

--11

SELECT DISTINCT
  c.name, c.city
FROM
  customers c, products p
WHERE
  p.city = 'Newark'
  AND
  c.city = 'Dallas'

--12

SELECT 
  products.name, products.priceusd
FROM
  products
WHERE
  priceusd > 
   (SELECT
      AVG(products.priceusd)
    FROM
      products)

--13

select 
   c.name, p.pid, o.dollars
from 
   orders o, products p, customers c 
where 
   o.pid = p.pid 
   AND 
   o.cid = c.cid
ORDER BY
  o.dollars desc

--14


SELECT DISTINCT
  c.name, SUM(o.dollars)
FROM 
  customers c left outer join orders o
ON
  c.cid = o.cid
GROUP BY
  c.cid
ORDER BY
  c.name

--15

