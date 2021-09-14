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


-------------------------------------------------------------------------------------------
-- #7 Query the list of CITY names from STATION that do not start with vowels and do not end with vowels
--    Your result cannot contain duplicates.
-------------------------------------------------------------------------------------------
select distinct(CITY)
from STATION
where left(CITY,1) not in ('a','e','i','o','u') and right(CITY,1) not in ('a','e','i','o','u')

-- USE REGEXP
select distinct(CITY)
from STATION
where CITY not REGEXP '^[aeiou]' and CITY not REGEXP '[aeiou]$'



-------------------------------------------------------------------------------------------
-- #8 Query the two cities in STATION with the shortest and longest CITY names, 
--    as well as their respective lengths (i.e.: number of characters in the name). 
--    If there is more than one smallest or largest city, 
--    choose the one that comes first when ordered alphabetically.
--    https://www.hackerrank.com/challenges/weather-observation-station-5/problem
-------------------------------------------------------------------------------------------
(select CITY, length(CITY)
from STATION
order by length(CITY) DESC, CITY ASC limit 1)
union
(select CITY, length(CITY)
from STATION
order by length(CITY) ASC, CITY ASC limit 1)
