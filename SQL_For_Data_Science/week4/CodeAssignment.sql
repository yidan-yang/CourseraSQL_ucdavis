--  Week 4 Code Assignment Note
--  Same ER diagram as week 3

-- #1: Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. 
--     Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)

select FirstName ||' '|| LastName as FullName, Address, UPPER(City||' '|| Country) as Location
from Customers
where CustomerID = 16

+--------------+---------------------------+-------------------+
| FullName     | Address                   | Location          |
+--------------+---------------------------+-------------------+
| Frank Harris | 1600 Amphitheatre Parkway | MOUNTAIN VIEW USA |
+--------------+---------------------------+-------------------+


-- #2: Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. 
--    Make the new field lower case and pull each individual step to show your work.

select lower(substr(FirstName,1,4) || substr(LastName,1,2)) as Username
from Employees
where FirstName is 'Robert' and LastName is 'King'

+----------+
| Username |
+----------+
| robeki   |
+----------+


-- #3: Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.

select FirstName, LastName, DATE('now')-strftime('%Y', HireDate) as WorkYear
from Employees
order by LastName ASC

+-----------+----------+----------+
| FirstName | LastName | WorkYear |
+-----------+----------+----------+
| Andrew    | Adams    |       19 |
| Laura     | Callahan |       17 |
| Nancy     | Edwards  |       19 |
| Steve     | Johnson  |       18 |
| Robert    | King     |       17 |
| Michael   | Mitchell |       18 |
| Margaret  | Park     |       18 |
| Jane      | Peacock  |       19 |
+-----------+----------+----------+


-- #4: Profiling the Customers table, answer the following question.
--     Are there any columns with null values? Indicate any below. Select all that apply.

select *
from Customers
where PostalCode is null


-- #5: Find the cities with the most customers and rank in descending order.
--     Which of the following cities indicate having 2 customers?

select City, Count(CustomerId)
from Customers 
group by City
order by count(CustomerId) desc

+---------------+-------------------+
| City          | Count(CustomerId) |
+---------------+-------------------+
| Berlin        |                 2 |
| London        |                 2 |
| Mountain View |                 2 |
| Paris         |                 2 |
| Prague        |                 2 |
| São Paulo     |                 2 |
| Amsterdam     |                 1 |
| Bangalore     |                 1 |
| Bordeaux      |                 1 |
| Boston        |                 1 |
| Brasília      |                 1 |
| Brussels      |                 1 |
| Budapest      |                 1 |
| Buenos Aires  |                 1 |
| Chicago       |                 1 |
| Copenhagen    |                 1 |
| Cupertino     |                 1 |
| Delhi         |                 1 |
| Dijon         |                 1 |
| Dublin        |                 1 |
| Edinburgh     |                 1 |
| Edmonton      |                 1 |
| Fort Worth    |                 1 |
| Frankfurt     |                 1 |
| Halifax       |                 1 |
+---------------+-------------------+
(Output limit exceeded, 25 of 53 total rows shown)


-- #6: Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
--     Select all of the correct "AstridGruber" entries that are returned in your results below. Select all that apply.

select c.FirstName||c.LastName||i.InvoiceId as NewInvoiceId
from Customers c, Invoices i
where c.CustomerId = i.CustomerId
order by c.FirstName asc

+-------------------+
| NewInvoiceId      |
+-------------------+
| AaronMitchell50   |
| AaronMitchell61   |
| AaronMitchell116  |
| AaronMitchell245  |
| AaronMitchell268  |
| AaronMitchell290  |
| AaronMitchell342  |
| AlexandreRocha57  |
| AlexandreRocha68  |
| AlexandreRocha123 |
| AlexandreRocha252 |
| AlexandreRocha275 |
| AlexandreRocha297 |
| AlexandreRocha349 |
| AstridGruber78    |
| AstridGruber89    |
| AstridGruber144   |
| AstridGruber273   |
| AstridGruber296   |
| AstridGruber318   |
| AstridGruber370   |
| BjørnHansen2      |
| BjørnHansen24     |
| BjørnHansen76     |
| BjørnHansen197    |
+-------------------+
(Output limit exceeded, 25 of 412 total rows shown)

-- Another way to solve #6 is:
select c.FirstName||c.LastName as FullName, c.FirstName||c.LastName||i.InvoiceId as NewInvoiceId
from Customers c, Invoices i
where c.CustomerId = i.CustomerId and FullName is 'AstridGruber'

+--------------+-----------------+
| FullName     | NewInvoiceId    |
+--------------+-----------------+
| AstridGruber | AstridGruber78  |
| AstridGruber | AstridGruber89  |
| AstridGruber | AstridGruber144 |
| AstridGruber | AstridGruber273 |
| AstridGruber | AstridGruber296 |
| AstridGruber | AstridGruber318 |
| AstridGruber | AstridGruber370 |
+--------------+-----------------+
