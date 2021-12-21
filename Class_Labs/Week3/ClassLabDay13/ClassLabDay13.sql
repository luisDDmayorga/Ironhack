use sakila;

# 1. Get release years.
select title, release_year from sakila.film;

# 2. Get all films with ARMAGEDDON in the title.
select title from film
where title regexp("armageddon");

# 3. Get all films which title ends with APOLLO.
select title from film
where title like ("%apollo");

# 4. Get 10 the longest films.
select title, length from film
order by length desc
limit 10;

# 5. How many films include Behind the Scenes content?
select count(distinct title) as films_with_BS from film
where special_features regexp ("Behind the Scenes");

# 6. Drop column picture from staff.
ALTER TABLE staff DROP COLUMN picture;

# 7. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer.
#    Update the database accordingly.
insert into staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update) values
(3, "Tammy", "Sanders", 79, "TAMMY.SANDERS@sakilacustomer.org", 2, 1," "," ", curdate());
select * from staff;
DELETE FROM customer WHERE customer_id =79;

# 8. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
#    You can use current date for the rental_date column in the rental table.
#    Hint: Check the columns in the table rental and see what information you would need to add there.
#    You can query those pieces of information. For eg., you would notice that you need customer_id information as well.
#    To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select film_id from sakila.film
where title = "Academy Dinosaur";

select inventory_id, film_id, store_id from sakila.inventory
where film_id = 1 and store_id = 1;

select max(rental_id) from sakila.rental;

select round(avg(datediff(return_date,rental_date))) from rental;

insert into rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) values
(16050, curdate(), 1, 130, adddate(curdate(), 5) , 1, curdate());
select * from rental where rental_id = 16050;

# 9. Delete non-active users, but first, create a backup table deleted_users to store customer_id,
#    email, and the date for the users that would be deleted. Follow these steps:
# - Check if there are any non-active users
select * from customer
where active = 0;
# - Create a table backup table as suggested
create table deleted_user(
customer_id INT AUTO_INCREMENT NOT NULL,
email varchar(1000),
date varchar(1000),
primary key (customer_id));
drop table if exists sakila.deleted_user;

# - Insert the non active users in the table backup table
insert into deleted_user
select customer_id, email, create_date from customer
where active = 0;

# - Delete the non active users from the table customer
DELETE FROM customer WHERE active = 0;

