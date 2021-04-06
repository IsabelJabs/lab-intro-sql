#1.Get the unique release years.
select distinct release_year from sakila.film;

#2.Get all films with ARMAGEDDON in the title.
select * from sakila.film
where title like '%Armageddon%'

#3.Get all films which title ends with APOLLO.
select * from sakila.film
where title like '%Apollo'

#4.Get 10 the longest films.
select title, length from sakila.film
order by length DESC 
limit 10;

#5.How many films include Behind the Scenes content?
select count(film_id) from sakila.film
where special_features like '%Behind the scenes%'

#7.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
#select * from sakila.customer
#where first_name= 'tammy' 
#select * from sakila.staff
INSERT INTO sakila.staff (staff_id, first_name, last_name, address_id,  email, store_id,active, username) 
VALUES ('3', 'tammy', 'sanders','79','TAMMY.SANDERS@sakilacustomer.org','2', '1', 'tammy');
select * from sakila.staff

#8.Add a rental for movie "Academy Dinosaur" by the customer "Charlotte Hunter" from employee Mike Hillyer at Store 1. 
#You can use current date for the rental_date column in the rental table. 
#Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information in other tables. 
#For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
#select customer_id from sakila.customer
#where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#Use similar method to get inventory_id, film_id, and staff_id.
select * from sakila.rentals
#rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
#Mike Hillyer staff_id 1, store_id 1
select film_id from sakila.film
where title = 'Academy Dinosaur'
#film_id 1
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#customer_id 130
select *,inventory_id from sakila.inventory
where film_id = '1'
select *,inventory_id from sakila.rental
where customer_id = '130'
#inventory_id 9
#now that all info is available, add the rental
select * from sakila.rental
order by rental_id DESC
#next rental_id 16050
INSERT INTO sakila.rental (rental_id, rental_date, inventory_id, customer_id, staff_id) 
VALUES ('16050', CURRENT_TIMESTAMP, '9','130','1');
#check output
select * from sakila.rental
order by rental_id DESC