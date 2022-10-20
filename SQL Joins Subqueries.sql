SELECT *
FROM film;


-- Question 1.
SELECT customer.first_name, customer.last_name, district
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
WHERE district = 'Texas';


-- Question 2
SELECT customer.first_name, customer.last_name, amount
FROM payment
INNER JOIN customer ON customer.customer_id = payment.customer_id
WHERE amount > 7; 


-- Question 3
SELECT *
FROM customer
WHERE customer_id in(
  SELECT customer_id
  FROM payment
  GROUP BY customer_id
  having sum(amount) > 175
);

-- Question 4
SELECT c.first_name, c.last_name, a.district, ci.city, ca.country
FROM customer c2 
JOIN address a 
ON c2.address_id = a.address_id 
JOIN city c 
ON city_id = city_id 
JOIN country ca 
ON ci.country_id =ca.country_id 
WHERE ca.country = 'Argentina';


-- Question 5
SELECT c.category_id, c.name, count(*)
FROM category c 
JOIN film_category fc 
ON c.category_id = fc.category_id
GROUP by c.category_id 
ORDER BY count(*) DESC;

-- Question 6
SELECT f.film_id, title, count(*)
FROM film f 
JOIN film_actor fa 
ON f.film_id = fa.film_id 
GROUP BY f.film_id 
ORDER BY count(f.film_id) DESC
LIMIT 1;

-- Question 7
SELECT a.actor_id, a.first_name, a.last_name, count(*) AS num_films
FROM actor a  
JOIN film_actor fa 
ON a.actor_id = fa.actor_id 
JOIN film f 
ON fa.film_id = f.film_id 
GROUP BY a.actor_id
ORDER BY num_films
LIMIT 1;


-- Question 8
SELECT c.country_id, co.country, count(*) AS num_cities 
FROM city c 
JOIN country co 
ON c.country_id = co.country_id 
GROUP BY c.country_id, co.country
ORDER BY num_cities DESC 
LIMIT 1;


-- Question 9
SELECT a.actor_id, a.first_name, a.last_name, count(*)
FROM actor a 
JOIN film_actor fa 
ON fa.actor_id = a.actor_id JOIN film f 
ON fa.film_id = f.film_id GROUP BY a.actor_id 
HAVING count(*) BETWEEN 20 AND 25;




