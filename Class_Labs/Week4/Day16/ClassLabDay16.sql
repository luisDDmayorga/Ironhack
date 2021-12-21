use sakila;

# 1. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT 
    s1.title, COUNT(i.film_id) AS ncopies
FROM
    inventory i
        JOIN
    (SELECT 
        *
    FROM
        film f
    WHERE
        f.title = 'HUNCHBACK IMPOSSIBLE') s1 ON i.film_id = s1.film_id;

# 2. List all films whose length is longer than the average of all the films.
SELECT 
    f.title, f.length
FROM
    film f
WHERE
    f.length > (SELECT 
            AVG(f.length)
        FROM
            film f);

# 3. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT 
    actor_id, first_name, last_name
FROM
    actor
WHERE
    actor_id IN ((SELECT 
            actor_id
        FROM
            film_actor
        WHERE
            film_id IN (SELECT 
                    film_id
                FROM
                    film
                WHERE
                    title = 'ALONE TRIP')));

# 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion.
#    Identify all movies categorized as family films.
SELECT 
    title
FROM
    film
WHERE
    film_id IN ((SELECT 
            film_id
        FROM
            film_category
        WHERE
            category_id IN (SELECT 
                    category_id
                FROM
                    category
                WHERE
                    name = 'family')));