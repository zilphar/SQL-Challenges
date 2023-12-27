-- to refer to the tables there are the queries for each 
SELECT * 
FROM sql_challenges.customers;

SELECT * 
FROM sql_challenges.orders;

SELECT * 
FROM sql_challenges.baskets;

SELECT * 
FROM sql_challenges.products;

SELECT * 
FROM sql_challenges.country;

-- 1. What are the names of all the countries in the country table?
SELECT country_name
FROM sql_challenges.country;

-- 2. What is the total number of customers in the customers table? 
SELECT COUNT(customer_id) AS no_of_customers
FROM sql_challenges.customers;

-- 3. What is the average age of customers who can receive marketing emails (can_email is set to 'yes')?
SELECT AVG(age) AS avg_age
FROM sql_challenges.customers
WHERE can_email = "yes"; 

-- 4. How many orders were made by customers aged 30 or older? 
SELECT COUNT(order_id) AS no_of_orders
FROM customers 
	INNER JOIN orders
	ON customers.customer_id = orders.customer_id
WHERE age >= 30;
