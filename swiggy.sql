use swiggy;
select * from restaurants;
select name , city from restaurants;
select * from restaurants
where city = "sirsa";
select name ,rating from restaurants
where rating > 4.5;
select * from restaurants
where cost <=300;
select * from restaurants
where cuisine = "biryani";
use swiggy;
select * from restaurants;
select name ,rating from restaurants
where rating > 4.5;
select name , rating from restaurants
order by rating desc 
limit 5;
select name , rating_count from restaurants
where rating_count > 1000;
select count(*) as total_res
from restaurants; 
select avg(cost) as avg_cost
from restaurants;
select name ,cost from restaurants
order by cost asc;
select cuisine ,min(cost)as min_cost,max(cost)as max_cost
from restaurants
group by cuisine;
select city ,avg(rating)as avg_rating
from restaurants
group by city;
select city , count(*) as count_res
from restaurants
group by city;
select count(city) from restaurants;
select count(distinct city)as unique_cities
from restaurants;
select * from restaurants
where rating >4 and rating_count > 3000;
select * from restaurants
where city = "mumbai" or rating=5;
select * from restaurants
where rating_count between 3000 and 10000;
select * from restaurants
 where city in ( "mumbai","delhi","goa","pune");
 select cuisine ,count(*)as total_restaurants
 from restaurants
 group by cuisine
 having count(*)> 100;
 select city ,avg(rating) from restaurants
 group by city
 having avg(rating)> 4.5;
 