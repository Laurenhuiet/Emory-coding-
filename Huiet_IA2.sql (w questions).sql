use sakila;

#### What are the names of all the languages in the database (sorted alphabetically)?;
select distinct * from language order by 2 ASC;

## 2 Return the full names (first and last) of actors with “SON” in their last name, ordered by their first name.
select first_name, last_name from customer 
where last_name regexp "son"
order by first_name ASC; 
select * from Address;

###3 Find all the addresses where the second address is not NULL, and return these sorted by addresses.
select * from Address where address2 is not null order by address ASC;

###4 How many film title contain “cat” or “dog”?
select count(*) from film_text where title regexp "DOG" or "cat";

#5 Return the first and last names of actors who played in a film containing “cat” or “dog”, along with the release year of the movie, sorted by the actors’ last names.

select a.first_name, a.last_name, release_year
from film as f
left join film_actor as fa 
on f.film_id = fa.film_id
left join actor as a
on a.actor_id = fa.actor_id
where f.title regexp "dog" or "cat"
order by a.last_name asc;

####7 Find all film category names with average difference between the film replacement cost and the rental rate larger than 17?

SELECT c.name FROM category as c
inner join film_category as fc
on c.Category_id=fc.category_id
inner join film as f 
on fc.film_id = f.film_id
group by c.name
having avg(f.replacement_cost - f.rental_rate) > 17;

###8 8.Find the address district name(s) and smallest postal code in each district(s). Ignores empty postal codes and empty district names.



select district, min(postal_code) as "PC"
from address 
group by postal_code
having PC >=0.1 and district >= 'a'
order by PC DESC;

SET sql_mode = '';


#####9.Find the names (first and last) of all customers whose first name is the same as the first name of the actor with ID 8. You cannot use the name of the actor with ID 8 as a constant (only the ID).



SELECT cust.first_name, cust.last_name 
FROM (
  SELECT c.first_name,c.last_name 
  FROM customer as c
  UNION ALL
  SELECT a.first_name,a.actor_id
  FROM actor as a 
  WHERE a.actor_id = 8 
) as cust
inner join actor as a on a.first_name = cust.first_name
where actor_id = 8;


###10 
 #Pick any district and any movie, and find names (first, last) of customers
 #that rented that selected movie and have addresses in that selected district; 

select title from film; using alter victoy; 
select district from address; using california;

select c.first_name, c.last_name from customer c 
where c.first_name >= 'a'
union all
select a.district, a.address_id from address a 
where a.district = 'california'
union all
select f.title, f.film_id from film as f
where f.title ='alter victory';



