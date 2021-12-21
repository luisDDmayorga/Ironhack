use sakila;
select * from category;

# 1. List number of films per category.
select c.name, count(fc.film_id) as n_films
from film_category fc
join category c
on fc.category_id = c.category_id
group by c.category_id;

# 2. Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from staff s
join address a
on s.address_id = a.address_id;

# 3. Display the total amount rung up by each staff member in August of 2005.
select s.first_name, s.last_name, sum(p.amount) as total_amount
from staff s
join payment p
on s.staff_id = p.staff_id
where date(payment_date) like "2005-08%"
group by s.staff_id;


# 4. List each film and the number of actors who are listed for that film.
select * from film_actor;
select f.title, count(fa.actor_id) as n_actors
from film f
join film_actor fa
on f.film_id = fa.film_id
group by f.title;

# 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer.
#    List the customers alphabetically by last name.
select * from payment;

select c.first_name, c.last_name, sum(p.amount) as total_amount
from customer c
join payment p
on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name asc;