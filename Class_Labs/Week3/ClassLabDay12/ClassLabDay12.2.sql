# 1. Select all the actors with the first name ‘Scarlett’.
select * from actor
where first_name = "Scarlett";

# 2. How many films (movies) are available for rent and how many films have been rented?
select count(film_id) as films_available from film;
select count(r.rental_id) as films_rented from rental r;

# 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as min_duration, max(length) as max_duration from film;

# 4. What's the average movie duration expressed in format (hours, minutes)?
select substring_index(sec_to_time(avg(length)*60), ":", 2) from film;

# 5. How many distinct (different) actors' last names are there?
select count(distinct last_name) as number_of_actors from actor;

# 6. Since how many days has the company been operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) as days_operating from rental;

# 7. Show rental info with additional columns month and weekday. Get 20 results.
select *,
date_format(convert(rental_date, date),"%M") as rental_date_month,
date_format(convert(rental_date, date),"%W") as rental_date_weekday,
date_format(convert(return_date, date),"%M") as return_date_month,
date_format(convert(return_date, date),"%W") as return_date_weekday
from rental;

# 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
case
when date_format(convert(rental_date, date),"%w") = 0 then "weekend"
when date_format(convert(rental_date, date),"%w") = 6 then "weekend"
else "workday"
end
as day_type
from rental
end;

# 9. How many rentals were in the last month of activity?
select max(rental_date) from rental;
select count(rental_date) as rentals_last_month from rental
where rental_date > "2006-01-14 15:16:03";