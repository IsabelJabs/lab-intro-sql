#Instructions

#1.	In the actor table, which are the actors whose last names are not repeated? 
	#For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
	#These three actors have the same last name. So we do not want to include this last name in our output. 
	#Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
select count(ac.last_name) as num_of_name, last_name
from sakila.actor ac
group by last_name 
having num_of_name =1 ;

#2.	Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors
	#where the last name was present more than once.
select count(ac.last_name) as num_of_name, last_name
from sakila.actor ac
group by last_name 
having num_of_name >1 ;

#3.	Using the rental table, find out how many rentals were processed by each employee.
#1:8041, 2:8004
select count(r.staff_id) as num_of_rentals, staff_id
from sakila.rental r
group by r.staff_id;

#4. Using the film table, find out how many films were released each year
#2006:1000
select count(f.title) as num_of_films, f.release_year
from sakila.film f
group by f.release_year;

#5. Using the film table, find out for each rating how many films were there.
select count(f.title) as num_of_films, f.rating
from sakila.film f
group by f.rating;

#6. What is the average length of films for each rating? Round off the average lengths to two decimal places.
select count(f.title) as num_of_films, f.rating, round(avg(f.length),2) as avg_length
from sakila.film f
group by f.rating;

#7. Which kind of movies (based on rating) have an average duration of two hours or more?
#PG-13, 223 films, 120,44 min.
select count(f.title) as num_of_films, f.rating, round(avg(f.length),2) as avg_length
from sakila.film f
group by f.rating
having avg_length >= 120;