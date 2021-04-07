#Instructions

#0.Inspect the database structure and find the best-fitting table to analyse for the next task.
#1. Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, and the rank.
select f.title, f.length,
rank() over (order by f.length asc) as 'Rank'
from sakila.film f
where f.length <> 0 and f.length is not null;

#2. Build on top of the previous query and rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, rating and the rank.
select f.title, f.length, f.rating, 
rank() over (partition by f.rating order by f.length asc) as 'Rank'
from sakila.film f
where f.length <> 0 and f.length is not null;

#3. How many films are there for each of the categories? Inspect the database structure and use appropriate join to write this query.
select c.name, count(fc.film_id) as num_of_films 
from sakila.category c
join sakila.film_category fc
on c.category_id=fc.category_id
group by c.name;

#4. Which actor has appeared in the most films?
select count(fa.film_id) as num_of_films, a.first_name, a.last_name
from sakila.film_actor fa
join sakila.actor a
on a.actor_id = fa.actor_id
group by a.actor_id
order by num_of_films desc;
#Gina Degeneres 42 films

#5. Most active customer (the customer that has rented the most number of films)
select c.first_name, c.last_name, count(r.rental_id) as num_of_films 
from sakila.rental r
join sakila.customer c
on c.customer_id=r.customer_id
group by r.customer_id
order by num_of_films desc
#Eleanor Hunt 46 films

# Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. 
#Give it a try. We will talk about queries with multiple join statements later in the lessons.
# film , inventory, rental
select f.title, count(r.rental_id) as num_of_rentals
from sakila.rental r
inner join sakila.inventory i
on r.inventory_id=i.inventory_id
inner join sakila.film f
on i.film_id = f.film_id
group by f.film_id
order by num_of_rentals desc;
#Bucket Brotherhood 34 times


