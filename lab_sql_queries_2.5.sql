#Instructions
#Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor
where first_name='Scarlett';
#How many films (movies) are available for rent and how many films have been rented?
select count(film_id) from sakila.film;
#What are the shortest and longest movie duration? Return the results as columns with the names  max_duration and min_duration.
select min(length) as min_duration from sakila.film;
select max(length) as max_duration from sakila.film;

#What's the average movie duration expressed in format (hours, minutes) Return the result as columns with the names hours and minutes?
select avg(length) from sakila.film;
#SELECT Replace(avg(length)/60,",",":") & " h" as dauer
#from sakila.film;
#How many distinct (different) actors' last names are there?
#121 distinct actors
select distinct last_name from sakila.actor;
#Since how many days has the company been operating (check the DATEDIFF() function)? Hint: rental table
select DATEDIFF(day, (max(rental_date)), (min(rental_date))) AS daysoperated from sakila.rental;
#Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). Get 20 results.
select *, date_format(rental_date,'%m') as month, date_format(rental_date, '%W') as weekday from sakila.rental
limit 20;
#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, (date_format(rental_date, '%W')) as weekday,
case
when (date_format(rental_date, '%w')) = 0 then 'weekend'
when (date_format(rental_date, '%w')) = 6 then 'weekend'
when  (date_format(rental_date, '%w')) = 1 then 'workday'
when  (date_format(rental_date, '%w')) = 2 then 'workday'
when  (date_format(rental_date, '%w')) = 3 then 'workday'
when  (date_format(rental_date, '%w')) = 4 then 'workday'
when  (date_format(rental_date, '%w')) = 5 then 'workday'
else 'unkown'
end as 'day_type'
from sakila.rental;
#How many rentals were made in the last month of renting activity?
select count(rental_date) as amount_rentals from sakila.rental
where date_format(rental_date, '%m') = 02 and date_format(rental_date, '%Y') = 2006;
