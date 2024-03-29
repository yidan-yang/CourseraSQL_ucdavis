-- All of the questions in this quiz refer to the open source Chinook Database


/* #1 Using a subquery, find the names of all the tracks for the album "Californication".*/
select Name from Tracks where AlbumId is (
select AlbumId from Albums where Title = 'Californication')

+-------------------+
| Name              |
+-------------------+
| Around The World  |
| Parallel Universe |
| Scar Tissue       |
| Otherside         |
| Get On Top        |
| Californication   |
| Easily            |
| Porcelain         |
| Emit Remmus       |
| I Like Dirt       |
+-------------------+
(Output limit exceeded, 10 of 15 total rows shown)


/* #2 Find the total number of invoices for each customer along with the customer's full name, city and email. */
select c.FirstName, c.LastName, c.City, c.Email, count(i.CustomerId) as numinv
from Customers c inner join Invoices i on c.CustomerId = i.CustomerId
group by c.CustomerId

-- Note: This one has to use group by in the end, otherwise it only shows one client's name.

+-----------+-------------+---------------------+--------------------------+--------+
| FirstName | LastName    | City                | Email                    | numinv |
+-----------+-------------+---------------------+--------------------------+--------+
| Luís      | Gonçalves   | São José dos Campos | luisg@embraer.com.br     |      7 |
| Leonie    | Köhler      | Stuttgart           | leonekohler@surfeu.de    |      7 |
| François  | Tremblay    | Montréal            | ftremblay@gmail.com      |      7 |
| Bjørn     | Hansen      | Oslo                | bjorn.hansen@yahoo.no    |      7 |
| František | Wichterlová | Prague              | frantisekw@jetbrains.com |      7 |
| Helena    | Holý        | Prague              | hholy@gmail.com          |      7 |
| Astrid    | Gruber      | Vienne              | astrid.gruber@apple.at   |      7 |
| Daan      | Peeters     | Brussels            | daan_peeters@apple.be    |      7 |
| Kara      | Nielsen     | Copenhagen          | kara.nielsen@jubii.dk    |      7 |
| Eduardo   | Martins     | São Paulo           | eduardo@woodstock.com.br |      7 |
+-----------+-------------+---------------------+--------------------------+--------+
(Output limit exceeded, 10 of 59 total rows shown)



/* #3 What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.*/ 
-- first try, the problem description is 'For Those About to Rock We Salute You'
-- But it's actually 'For Those About To Rock We Salute You' (case sensitive)
-- Use wildcards
select t.Name as TrackName, t.AlbumId, a.ArtistId, t.TrackId,a.Title
from Tracks t inner join Albums a on t.AlbumId = a.AlbumId
where a.Title like 'For%' and t.TrackId = 12
+--------------------+---------+----------+---------+---------------------------------------+
| TrackName          | AlbumId | ArtistId | TrackId | Title                                 |
+--------------------+---------+----------+---------+---------------------------------------+
| Breaking The Rules |       1 |        1 |      12 | For Those About To Rock We Salute You |
+--------------------+---------+----------+---------+---------------------------------------+

-- Final soln
select t.Name as TrackName, t.AlbumId, a.ArtistId, t.TrackId,a.Title
from Tracks t inner join Albums a on t.AlbumId = a.AlbumId
where a.Title = 'For Those About To Rock We Salute You' and t.TrackId = 12



-- Given the AlbumId of 'For Those About to Rock We Salute You' is 1, we can use
select t.Name as TrackName, t.AlbumId, a.ArtistId, t.TrackId,a.Title
from Tracks t inner join Albums a on t.AlbumId = a.AlbumId
where a.AlbumId = 1



/* #4 Retrieve a list with the managers last name, and the last name of the employees who report to him or her.*/
/* After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?*/
-- First, check the job types among the employees table
select Title
from Employees

+---------------------+
| Title               |
+---------------------+
| General Manager     |
| Sales Manager       |
| Sales Support Agent |
| Sales Support Agent |
| Sales Support Agent |
| IT Manager          |
| IT Staff            |
| IT Staff            |
+---------------------+

-- There are 3 managers: General Manager, IT Manager and Sales Manager

-- Use wildcards to retrieve Managers' name
select FirstName, LastName, Title, ReportsTo, EmployeeId
from Employees
where Title like '%Manager'

+-----------+----------+-----------------+-----------+------------+
| FirstName | LastName | Title           | ReportsTo | EmployeeId |
+-----------+----------+-----------------+-----------+------------+
| Andrew    | Adams    | General Manager |      None |          1 |
| Nancy     | Edwards  | Sales Manager   |         1 |          2 |
| Michael   | Mitchell | IT Manager      |         1 |          6 |
+-----------+----------+-----------------+-----------+------------+

-- start another query
select FirstName, LastName, Title, ReportsTo
from Employees
where ReportsTo = 6


+-----------+----------+----------+-----------+
| FirstName | LastName | Title    | ReportsTo |
+-----------+----------+----------+-----------+
| Robert    | King     | IT Staff |         6 |
| Laura     | Callahan | IT Staff |         6 |
+-----------+----------+----------+-----------+



/* #5 Find the name and ID of the artists who do not have albums. */
/* After running the query described above, two of the records returned have the same last name. Enter that name below.*/
-- use left join
select ar.ArtistId, ar.Name as ArtistName, al.AlbumId
from Artists ar left join Albums al on ar.ArtistId = al.ArtistId
where al.AlbumId is NULL

+----------+----------------------------+---------+
| ArtistId | ArtistName                 | AlbumId |
+----------+----------------------------+---------+
|       25 | Milton Nascimento & Bebeto |    None |
|       26 | Azymuth                    |    None |
|       28 | João Gilberto              |    None |
|       29 | Bebel Gilberto             |    None |
|       30 | Jorge Vercilo              |    None |
|       31 | Baby Consuelo              |    None |
|       32 | Ney Matogrosso             |    None |
|       33 | Luiz Melodia               |    None |
|       34 | Nando Reis                 |    None |
|       35 | Pedro Luís & A Parede      |    None |
+----------+----------------------------+---------+
(Output limit exceeded, 10 of 71 total rows shown)



/* #6 Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.*/
/* After running the query described above, determine what is the last name of the 6th record?*/
/* Enter it below. Remember to order things in descending order to be sure to get the correct answer.*/
select FirstName, LastName 
from Employees  
union
select FirstName, LastName
from Customers
order by LastName DESC

+-----------+--------------+
| FirstName | LastName     |
+-----------+--------------+
| Fynn      | Zimmermann   |
| Stanisław | Wójcik       |
| František | Wichterlová  |
| Johannes  | Van der Berg |
| François  | Tremblay     |
| Mark      | Taylor       |
| Ellie     | Sullivan     |
| Victor    | Stevens      |
| Puja      | Srivastava   |
| Jack      | Smith        |
+-----------+--------------+
(Output limit exceeded, 10 of 67 total rows shown)


/* #7 See if there are any customers who have a different city listed in their billing city versus their customer city.*/
select c.CustomerId, c.City, i.BillingCity
from Customers c
inner join Invoices i on c.CustomerId = i.CustomerId
where c.City != i.BillingCity

-- For non-matching, we can use another syntax <>
select c.CustomerId, c.City, i.BillingCity
from Customers c
inner join Invoices i on c.CustomerId = i.CustomerId
where c.City <> i.BillingCity

+------------+------+-------------+
| CustomerId | City | BillingCity |
+------------+------+-------------+
+------------+------+-------------+
(Zero rows)

