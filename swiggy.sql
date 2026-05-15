use swiggy;
select * from database;
select name , city from database;
select * from database
where city = "sirsa";
select name ,rating from database
where rating > 4.5;
select * from database
where cost <=300;
select * from database
where cuisine = "biryani";
use swiggy;
select * from database;
select name ,rating from database
where rating > 4.5;
select name , rating from database
order by rating desc 
limit 5;
select name , rating_count from database
where rating_count > 1000;
select count(*) as total_res
from database; 
select avg(cost) as avg_cost
from database;
select name ,cost from database
order by cost asc;
select cuisine ,min(cost)as min_cost,max(cost)as max_cost
from database
group by cuisine;
select city ,avg(rating)as avg_rating
from database
group by city;
select city , count(*) as count_res
from database
group by city;
select count(city) from database;
select count(distinct city)as unique_cities
from database;
select * from database
where rating >4 and rating_count > 3000;
select * from database
where city = "mumbai" or rating=5;
select * from database
where rating_count between 3000 and 10000;
select * from database
 where city in ( "mumbai","delhi","goa","pune");
 select cuisine ,count(*)as total_database
 from database
 group by cuisine
 having count(*)> 100;
 select city ,avg(rating) from database
 group by city
 having avg(rating)> 4.5;
 
