#Instructions
#0.Inspect the database structure and find the best-fitting table to analyse for the next task.
#1.Using multiple JOIN() clauses display the store ID, city, and country of each store.
#city, country, address, store
select s.store_id, t.city, c.country from sakila.store s
join sakila.address a
on s.address_id= a.address_id
join sakila.city t
on t.city_id= a.city_id
join sakila.country c
on c.country_id= t.country_id;

#2.Display the total payment amount for each store.
#store, customer, payment
select s.store_id, sum(p.amount) as total_payment from sakila.payment p
join sakila.customer c 
on p.customer_id=c.customer_id
join sakila.store s
on s.store_id=c.store_id
group by s.store_id;

#3.What is the average film length per each category? Which category of films are the longest?
#film, film_category, category 
select c.name as Genre, round(avg(f.length),2) as Avg_length_in_min from sakila.film f
join sakila.film_category fc
on f.film_id=fc.film_id
join sakila.category c
on fc.category_id = c.category_id
group by c.category_id
order by round(avg(f.length),2) desc;
#limit 1;
#longest is sports with 128,2 min avg

#4.Display the 2 most frequently rented movies in descending order.
#rental, inventory, film
select f.title, count(r.rental_id) from sakila.rental r
join sakila.inventory i 
on r.inventory_id = i.inventory_id
join sakila.film f
on f.film_id=i.film_id
group by f.film_id
order by count(r.rental_id) desc
limit 2;

#5.Display the top 5 categories with highest revenue (payment amount) in descending order.
#payment, rental, inventory, film, film_category, category 
select c.name as Genre, sum(p.amount) as Revenue from sakila.payment p
join sakila.rental r 
on p.rental_id= r.rental_id
join sakila.inventory i 
on i.inventory_id=r.inventory_id
join sakila.film f
on f.film_id=i.film_id
join sakila.film_category fc
on fc.film_id=f.film_id
join sakila.category c
on c.category_id=fc.category_id
group by c.category_id 
order by sum(p.amount) desc
limit 5;

#6.Is the Academy Dinosaur movie available for rent from Store 1? If yes, display the title, store_id and inventory_id of the available copies of that movie.
#film, inventory, store
select f.title, s.store_id, i.inventory_id 
from sakila.store s
join sakila.inventory i
on s.store_id=i.store_id
join sakila.film f 
on f.film_id = i.film_id
where f.title='Academy Dinosaur' and s.store_id=1;
#yes, 4 copies available in store 1







