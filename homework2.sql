--Tom Morse
--Database Management
--HomeWork 2

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

--3

SELECT
  customers.cid, customers.name
FROM 
  customers
WHERE
  customers.cid NOT IN
    (SELECT
       orders.cid
     FROM
       orders
     WHERE
       orders.aid = 'a03')

--4

SELECT
  customers.cid, customers.name
FROM 
  customers
WHERE
  customers.cid IN
    (SELECT
       orders.cid
     FROM
       orders
     WHERE
       orders.pid = 'p01' OR orders.pid = 'p07')

--5

SELECT DISTINCT
  orders.pid
FROM
  orders
WHERE
  orders.cid IN
    (SELECT
        orders.cid
     FROM
        orders
     WHERE
        orders.aid = 'a03')


--6

SELECT
  customers.name, customers.discount
FROM 
  customers
WHERE
  customers.cid IN
    (SELECT 
       orders.cid
     FROM
       orders
     WHERE
       orders.aid IN
         (SELECT
            agents.aid
          FROM
            agents
          WHERE
            agents.city = 'Dallas' OR agents.city = 'Duluth'))

--7

SELECT
  *
FROM
  customers
WHERE
  customers.discount IN
    (SELECT
       customers.discount
     FROM
       customers
     WHERE
       customers.city = 'Dallas' OR customers.city = 'Kyoto')