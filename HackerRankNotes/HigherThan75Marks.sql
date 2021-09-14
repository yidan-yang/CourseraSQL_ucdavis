-- The STUDENTS table is described as follows:
------------------------
--| Column  |  Type    |
--|---------|----------|
--|ID       |  Integer |
--|---------|----------|
--|Name     |  String  |
--|---------|----------|
--|Marks    |  Integer |
--|---------|----------|

-----------------------------------------------------------------------------------
-- #1 Query the Name of any student in STUDENTS who scored higher than 75 Marks.
--    Order your output by the last three characters of each name. 
--     If two or more students both have names ending in the same last three characters 
--     (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
-----------------------------------------------------------------------------------
select Name
from STUDENTS
where Marks > 75
order by right(Name,3), ID asc

-- Use SUBSTR
select Name
from STUDENTS
where Marks > 75
order by substr(Name,-3), ID asc