-- The Employee table containing employee data for a company is described as follows:
----------------------------
--| Column      |  Type    |
--|-------------|----------|
--| employee_id |  Integer |
--|-------------|----------|
--| Name        |  String  |
--|-------------|----------|
--| Month       |  Integer |
--|-------------|----------|
--| Salary      |  Integer |
--|-------------|----------|

-- employee_id is an employee's ID number
-- name is their name
-- months is the total number of months they've been working for the company
-- salary is their monthly salary

-----------------------------------------------------------------------------------
-- #1 Write a query that prints a list of employee names 
--    (i.e.: the name attribute) from the Employee table in alphabetical order.
-----------------------------------------------------------------------------------
select Name
from Employee
order by Name ASC


-----------------------------------------------------------------------------------
-- #2 Write a query that prints a list of employee names 
--   (i.e.: the name attribute) for employees in Employee having a salary greater than
--   $2000 per month who have been employees for less than 10 months.
--    Sort your result by ascending employee_id.
-----------------------------------------------------------------------------------
select Name
from Employee
where salary>2000 and months<10
order by employee_id asc