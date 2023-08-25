SELECT * FROM swiggy_project.swiggy;
#Q1. Restaurant with rating greater than 4.5
select count(distinct restaurant_name) as high_rated_restro from swiggy_project.swiggy where rating>4.5;

#Q2.Which is the top 1 city with highest no of restaurants
select city,count(distinct restaurant_name) as restro_count from swiggy_project.swiggy group by city order by restro_count desc limit 1;

#Q3. How many restaurants have "PIZZA" in their name?

select count(distinct restaurant_name) as pizza_count from swiggy_project.swiggy where restaurant_name like "%Pizza%";
select distinct restaurant_name as pizza_count from swiggy_project.swiggy where restaurant_name like "%Pizza%";

#Q.4 What is the most common cuisine among the restaurants in the dataset?
select cuisine,count(*) as cuisine_count from swiggy_project.swiggy group by cuisine order by cuisine_count desc limit 1;

#Q5. What is the avg rating of restaurants in each city?
select city,avg(rating) from swiggy_project.swiggy group by city; 

#Q.6 What is the highest price of item under the 'recommended' menu category for each restaurant?
select distinct restaurant_name,menu_category,max(price) as highestprice from swiggy_project.swiggy where menu_category='Recommended' group by restaurant_name,menu_category;

#Q.7 Find the top 5 most expensive restaurants that offer cuisine other than indian cuisine.
select distinct restaurant_name,cost_per_person from swiggy_project.swiggy where cuisine!='Indian' order by cost_per_person desc limit 5;

 #Q.8 Find the restaurants that have an average cost which is higher than the total average cost of all restaurants together.
 select distinct restaurant_name ,cost_per_person from swiggy_project.swiggy where cost_per_person > (select avg(cost_per_person) from swiggy_project.swiggy) ; 
 
 #Q.9 Retrive the details of restaurants that have the same name but are located in different cities.
 select distinct t1.restaurant_name,t1.city,t2.city from swiggy_project.swiggy t1 join swiggy_project.swiggy t2 on t1.restaurant_name=t2.restaurant_name and t1.city!=t2.city;
 
 #Q.10 Which restaurant offers the most number of items in the main course category?
 select distinct restaurant_name ,count(item) as cnt from swiggy_project.swiggy where menu_category='Main Course' group by restaurant_name,menu_category order by cnt desc limit 1; 
 
 #Q.11 List the names of restaurants that are 100% vegeatarian in alphabetical order of restaurant name
 select distinct restaurant_name,
 (count(case when veg_or_non-veg='Veg' then 1 end)*100/count(*))as veg_percent
 from swiggy_project.swiggy group by restaurant_name 
 having veg_percent=100.00  order by restaurant_name;
 
 #Q.12 Which is the restaurant providing the lowest average price for all items?
 select distinct restaurant_name,avg(price) as average_price from swiggy_project.swiggy group by restaurant_name
 order by average_price limit 1;
 
 #Q.13 Which top 5 restaurant offers highest number of categories?
 select distinct restaurant_name,count(distinct menu_category) as cnt from swiggy_project.swiggy group by restaurant_name
 order by cnt desc limit 5;
 
 #Q.14 Which restaurant provides the highest percentage of non-veg food?
 select distinct restaurant_name,(count(case when veg_or_non_veg='Non-veg' then 1 end)*100/count(*))as nonveg_per
 from swiggy_project.swiggy group by restaurant_name order by  nonveg_per desc limit 1;
 
 
    