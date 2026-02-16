USE sakila;

/* Write an SQL query to find the customer_id who has the highest number of 
rentals. */

SELECT customer_id, Count(*) AS Highest_rental
FROM Rental
GROUP BY customer_id
ORDER BY Highest_rental DESC
LIMIT 1 ;

/* Write an SQL query to identify the month with the most rentals */

SELECT MONTH(rental_date) AS Month, COUNT(*) AS Total_rental
FROM rental 
GROUP BY rental_date
ORDER BY Total_rental DESC 
LIMIT 1;

/* Find the total revenue generated per day. */

SELECT DAY(payment_date) AS DAYS, SUM(amount) AS Total_Revenue
FROM payment
GROUP BY payment_date
ORDER BY payment_date;

/* Find the store that generated the highest total revenue */

SELECT str.store_id, SUM(p.amount) AS Total_Revenue
FROM payment AS p
JOIN staff AS st ON p.staff_id = st.staff_id
JOIN store AS str ON st.store_id = str.store_id
GROUP BY str.store_id 
ORDER BY Total_Revenue DESC
LIMIT 1;

/* Find the customers who have made exactly 5 payments. */
SELECT customer_id, COUNT(*) AS Payment_count
FROM payment
GROUP BY customer_id
HAVING COUNT(*) = 5 ;