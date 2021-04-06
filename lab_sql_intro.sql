#Instructions
#Review the tables in the database.
#Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from sakila.actor;
select * from sakila.address;
select * from sakila.category;
select* from sakila.language;
select * from sakila.film;
select * from sakila.city, sakila.film;
#Select one column from a table. Get film titles.
select title from sakila.film;
#Select one column from a table and alias it. Get unique list of film languages under the alias language. 
#Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select name as genre from sakila.category;
select * from sakila.language;
select distinct name from sakila.language;
#Using the select statements and reviewing how many records are returned, can you find out how many stores and staff does the company have? 
#Can you return a list of employee first names only?
select * from sakila.rental;
select return_date, staff_id from sakila.rental;
select first_name from sakila.staff;
#Bonus: How many unique days did customers rent movies in this dataset?
#select distinct rental_date from sakila.rental;
