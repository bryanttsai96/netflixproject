create schema netflix;
select * from netflixusers;

-- how many subscribers for each subscription type
select Subscription_Type, count(Subscription_Type) as num_subscibers
from netflixusers
group by Subscription_Type;

-- how many customers of the 2 reported genders
select gender, count(Gender) as count_reported_gender
from netflixusers
group by Gender;

-- how many customers of the 2 reported genders using each device type
select gender, device, count(*) as device_count
from netflixusers
group by gender, device
order by gender, device;

-- count number of customers in reported countries
select country, count(*) as customer_count
from netflixusers
group by country
order by country;

-- for each device type, how many customers in each country use it
select device, country, count(*) as customer_count, gender
from netflixusers
group by device, country, gender
order by device, customer_count desc;

-- revenue generated from each customer, assuming the same plan since they joined
select user_id, Monthly_Revenue * (Last_Payment_Date - Join_Date) as rev_per_customer
from netflixusers
where Last_Payment_Date > Join_Date
group by user_id;

