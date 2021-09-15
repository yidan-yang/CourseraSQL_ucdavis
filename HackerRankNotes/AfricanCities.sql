-- The CITY and COUNTRY tables are described as follows:

---------------CITY----------------          -------------COUNTRY--------------
--==============================             ==================================
--| Field       |  Type        |             | Field         | Type           |
--|-------------|--------------|             |---------------|-----------------
--| ID          | NUMBER       |             |CODE           | VARCHAR2(3)    |
--|-------------|--------------|             |---------------|-----------------
--| Name        | VARCHAR2(17) |             |NAME           | VARCHAR2(44)   |
--|-------------|--------------|             |---------------|-----------------
--| COUNTRYCODE | VARCHAR2(3)  |             |CONTINENT      | VARCHAR2(13)   |
--|-------------|--------------|             |---------------|-----------------
--| DISTRICT    | VARCHAR2(20) |             |REGION         | VARCHAR2(25)   |
--|-------------|--------------|             |---------------|-----------------
--| POPULATION  | NUMBER       |             |SURFACEAREA    | NUMBER         |
--===============================            |---------------|-----------------      
--                                           |INDEPYEAR      | VARCHAR2(5)    |
--                                           |---------------|-----------------
--                                           |POPULATION     | NUMBER         |
--                                           |---------------|-----------------
--                                           |LIFEEXPECYANCY | VARCHAR2(4)    |
--                                           |---------------|-----------------
--                                           |GNP            | NUMBER         |
--                                           |---------------|-----------------
--                                           |GNPOLD         | VARCHAR2(9)    |
--                                           |---------------|-----------------
--                                           |LOCALNAME      | VARCHAR2(44)   |
--                                           |---------------|-----------------
--                                           |GOVERNMENTFORM | VARCHAR2(44)   |
--                                           |---------------|-----------------
--                                           |HEADOFSTATE    | VARCHAR2(32)   |
--                                           |---------------|-----------------
--                                           |CAPITAL        | VARCHAR2(4)    |
--                                           |---------------|-----------------
--                                           |CODE2          | VARCHAR2(2)    |
--                                           |=================================
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
--
---------------------------------------------------------------------------------
-- #1 Given the CITY and COUNTRY tables, query the names of all cities where 
--    the CONTINENT is 'Africa'.
-----------------------------------------------------------------------------------
select ci.NAME
from CITY ci, COUNTRY co 
where ci.COUNTRYCODE = co.CODE and co.CONTINENT='Africa'

-- Use inner join
select ci.NAME
from CITY ci inner join COUNTRY co on ci.COUNTRYCODE = co.CODE
where co.CONTINENT='Africa'


---------------------------------------------------------------------------------
-- #2 Given the CITY and COUNTRY tables, query the names  of all the continents
--   (COUNTRY.Continent) and their respective average city populations (CITY.Population)
--    rounded down to the nearest integer.
-----------------------------------------------------------------------------------
select COUNTRY.CONTINENT, floor(avg(CITY.POPULATION)) 
from COUNTRY, CITY
where COUNTRY.CODE = CITY.COUNTRYCODE
group by COUNTRY.CONTINENT

-- Remark: function round(decimal, 0) doesn't work here

-- Inner join works as well
select COUNTRY.CONTINENT, floor(avg(CITY.POPULATION)) 
from COUNTRY inner join CITY on
COUNTRY.CODE = CITY.COUNTRYCODE
group by COUNTRY.CONTINENT
