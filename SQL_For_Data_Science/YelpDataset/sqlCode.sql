-- Final: Yelp dataset
-- Code

-- Part 1: Yelp Dataset Profiling and Understanding
-- 1. Profile the data by finding the total number of records for each of the tables below:

select count(*)
from business /* or other table's name*/

-- 2. Find the total distinct records by either the foreign key or primary key for each table. 
--    If two foreign keys are listed in the table, please specify which foreign key.

select count(distinct business_id)                      
as total_records
from hours;

-- 3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

select *
from user
where id IS NULL OR 
      name IS NULL OR 
      review_count IS NULL OR 
      yelping_since IS NULL OR
      useful IS NULL OR 
	  funny IS NULL OR 
	  cool IS NULL OR 
	  fans IS NULL OR 
	  average_stars IS NULL OR 
      compliment_hot IS NULL OR 
	  compliment_more IS NULL OR 
	  compliment_profile IS NULL OR 
	  compliment_cute IS NULL OR 
	  compliment_list IS NULL OR 
	  compliment_note IS NULL OR 
	  compliment_plain IS NULL OR 
	  compliment_cool IS NULL OR 
	  compliment_funny IS NULL OR 
	  compliment_writer IS NULL OR 
	  compliment_photos IS NULL 


-- 4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	--i. Table: Review, Column: Stars
	-- min:		max:		avg:
	select min(stars), max(stars), avg(stars)
	from review
		
	
	--ii. Table: Business, Column: Stars
	-- min:		max:		avg:
	select min(stars), max(stars), avg(stars)
	from business

		
	
	--iii. Table: Tip, Column: Likes
	-- min:		max:		avg:
	select min(likes), max(likes), avg(likes)
	from tip

		
	
	--iv. Table: Checkin, Column: Count
	-- min:		max:		avg:
	select min(count), max(count), avg(count)
	from checkin
	
	
	--v. Table: User, Column: Review_count
	-- min:		max:		avg:
	select min(review_count), max(review_count), avg(review_count)
	from user
	

-- 5. List the cities with the most reviews in descending order:
select city, sum(review_count) as total_reviews
from business
group by city
order by total_reviews desc


-- 6. Find the distribution of star ratings to the business in the following cities:
-- i. Avon
select stars, review_count
from business
where city = 'Avon'
group by stars


-- ii. Beachwood
select stars, review_count
from business
where city = 'Beachwood'
group by stars


-- 7. Find the top 3 users based on their total number of reviews: