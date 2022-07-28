-- 1. List all customers who live in Texas (use JOINs)
SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, district
FROM customer
JOIN address ON customer.address_id = address.address_id
WHERE district = 'Texas'
-- Answer 5


-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY customer_name 
-- Answer 1423


-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name,
SUM(amount)
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer_name
HAVING SUM(amount) > 175
ORDER BY customer_name 
-- Answer 7


-- 4. List all customers that live in Nepal (use the city table)
SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON country.country_id = city.country_id
WHERE country = 'Nepal'
-- Answer 1 Kevin Schuler 


-- 5. Which staff member had the most transactions? 
SELECT CONCAT(staff.first_name, ' ', staff.last_name) as employee, COUNT(rental_id)
FROM staff
JOIN rental ON staff.staff_id = rental.staff_id
GROUP BY employee
-- Answer Mike Hillyer 8040


-- 6. How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
-- Answer 5


-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name
FROM customer
WHERE customer_id in (
SELECT customer_id
FROM payment
WHERE amount > 6.99
)
-- Answer 539 Customers


-- 8. How many free rentals did our stores give away?
SELECT COUNT(rental.rental_id)
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
WHERE amount = 0
-- Answer 24