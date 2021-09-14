-- Weather Observation Station
-- The STATION table is described as follows

--|----------|--------------|
--| Field    |   Type       |
--|----------|--------------|
--|ID        | NUMBER       |
--|----------|--------------|
--|CITY      | VARCHAR2(21) |
--|----------|--------------|
--|STATE     | VARCHAR2(2)  |
--|----------|--------------|
--|LAT_N     | NUMBER       |
--|----------|--------------|
--|LONG_W    | NUMBER       |
--|----------|--------------|


-------------------------------------------------------------------------------------------
-- #1 Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
--    as both their first and last characters.  Your result cannot contain duplicates.
-------------------------------------------------------------------------------------------
select distinct(CITY)
from STATION
where left(CITY,1) in ('a','e','i','o','u') and right(CITY,1) in ('a','e','i','o','u')


-------------------------------------------------------------------------------------------
-- #2 Query the list of CITY names from STATION that do not start with vowels. 
--    Your result cannot contain duplicates.
-------------------------------------------------------------------------------------------
select distinct(CITY)
from STATION
where CITY REGEXP '^[^aeiou]'


-------------------------------------------------------------------------------------------
-- #3 Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
-- Your result cannot contain duplicates.
-------------------------------------------------------------------------------------------
select distinct(CITY)
from STATION
where CITY REGEXP '^[aeiou]'


-------------------------------------------------------------------------------------------
-- #4 Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
--    Your result cannot contain duplicates.
-------------------------------------------------------------------------------------------
select distinct(CITY)
from STATION
where RIGHT(CITY,1) in ('a','e','i','o','u');

-------------------------------------------------------------------------------------------
-- #5 Query the list of CITY names from STATION that do not end with vowels.
--    Your result cannot contain duplicates.
-------------------------------------------------------------------------------------------
select distinct(CITY)
from STATION
where substr(CITY,-1,1) not in ('a','e','i','o','u');

-- Use right( ) function 
select distinct(CITY)
from STATION
where right(CITY,1) not in ('a','e','i','o','u');


-------------------------------------------------------------------------------------------
-- #6 Query the list of CITY names from STATION that do not end with vowels.
--    Your result cannot contain duplicates.
-------------------------------------------------------------------------------------------
select distinct(CITY)
from STATION
where left(CITY,1) not in ('a','e','i','o','u') or right(CITY,1) not in ('a','e','i','o','u')

-- Use REGEXP
select distinct(CITY)
from STATION
where CITY not REGEXP '^[aeiou]' or CITY not REGEXP '[aeiou]$'
