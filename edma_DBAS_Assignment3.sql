/* Student: Edward Ma (W0057568)
DBAS-1100 Assignment 3 */

/* 1.(Chinook db) Display the Name of every available track. In addition, 
display the number of times that the track has been included as part of an order.*/
SELECT DISTINCT Track.NAME, counter.total 
FROM Track, (
  SELECT COUNT(InvoiceID) TOTAL 
  FROM Invoiceline 
  GROUP BY TRACKID
  ) Counter 
ORDER BY Counter.TOTAL DESC;

/* 2.(Chinook db) Display the TrackID, Track Name, of any tracks in Chinook DB 
that have not yet been purchased.*/

SELECT Name, TrackID 
FROM Track 
WHERE TrackID NOT IN (
                      SELECT TrackID 
                      FROM InvoiceLine
                      ) 
ORDER BY Track.NAME ASC;

/* 3.(Bookstore db) Using the “b_” tables, display the first and last names of 
all authors who currently do not have any books listed.*/

SELECT B_Author.FNAME, B_Author.LNAME
FROM B_AUTHOR
FULL OUTER JOIN B_BOOKAUTHOR ON B_BOOKAUTHOR.AUTHORID = B_AUTHOR.AUTHORID
FULL OUTER JOIN B_BOOKS ON B_BOOKS.ISBN = B_BOOKAUTHOR.ISBN
WHERE B_BOOKS.ISBN IS NULL;

/* 4.(Bookstore db) Using the “b_” tables, display the Title of any book that 
has yet to have been purchased.*/

SELECT B_Books.TITLE
FROM B_Books
LEFT OUTER JOIN B_ORDERITEMS ON B_Books.ISBN = B_ORDERITEMS.ISBN
WHERE B_ORDERITEMS.ORDER# IS NULL;

/* 5.(Bookstore db) Using the “b_” tables, display the Customer number, First 
name, and Last name of any customers who have yet to place an order.*/

SELECT B_Customers.CUSTOMER#, B_Customers.FIRSTNAME, B_Customers.LASTNAME FROM B_Customers
LEFT OUTER JOIN B_Orders ON B_Orders.Customer# = B_Customers.Customer#
WHERE B_Orders.ORDER# IS NULL;

/* 6.(Numbers db) Create an Inner Join between the tables NUMBERS_twos and NUMBERS_threes. Look at the results and note what is returned between the two tables.
a)	Change the Inner Join to a Left Outer Join and note the differences. Make sure you are clear as to what the differences are before you continue.
b)	Change the Left Outer Join to a Right Outer Join and note the differences. Make sure you are clear as to what the differences are before you continue.
c)	Change the Right Outer Join to a Full Join and note the differences. Make sure you are clear as to what the differences are before you continue.
d)	Using what you’ve observed, create a SQL statement to return the results shown below:
(HINT: It’s a sorting issue and involves the NVL function)*/
SELECT
  Numbers_twos.MULTIPLE_OF_2, 
  Numbers_threes.MULTIPLE_OF_3
FROM NUMBERS_TWOS
INNER JOIN Numbers_threes ON Numbers_threes.MULTIPLE_OF_3 = Numbers_twos.MULTIPLE_OF_2;

-- A)
SELECT
  Numbers_twos.MULTIPLE_OF_2, 
  Numbers_threes.MULTIPLE_OF_3
FROM NUMBERS_TWOS
LEFT OUTER JOIN Numbers_threes ON Numbers_threes.MULTIPLE_OF_3 = Numbers_twos.MULTIPLE_OF_2;

-- B)
SELECT
  Numbers_twos.MULTIPLE_OF_2, 
  Numbers_threes.MULTIPLE_OF_3
FROM NUMBERS_TWOS
RIGHT OUTER JOIN Numbers_threes ON Numbers_threes.MULTIPLE_OF_3 = Numbers_twos.MULTIPLE_OF_2;

-- C) and D)
SELECT 
  Numbers_twos.MULTIPLE_OF_2, 
  Numbers_threes.MULTIPLE_OF_3, 
  NVL(Numbers_threes.MULTIPLE_OF_3, Numbers_twos.MULTIPLE_OF_2) AS "SORT ORDER"
FROM Numbers_twos
FULL OUTER JOIN Numbers_threes ON Numbers_threes.MULTIPLE_OF_3 = Numbers_twos.MULTIPLE_OF_2;

/* 7.	(Cars db) Using the Cars_Car_Types, Cars_Number_Of_Doors, Cars_Colors tables, 
create a query that returns every possible combination of the values of each table. (Hint: The result set should contain 24 rows.)*/

SELECT * FROM Cars_Car_Types
CROSS JOIN Cars_Colors
CROSS JOIN CARS_NUMBER_OF_DOORS;

/* 8.	(Lunches db) List the employee ID, last name, and phone number of each 
employee with the name and phone number of his or her manager. Make sure that 
every employee is listed, even those that do not have a manager. Sort the rows 
by the employee’s id number.*/

SELECT emp.EMPLOYEE_ID AS "Employee ID", 
       emp.LAST_NAME AS "Employee Last Name",
       emp.PHONE_NUMBER AS "Phone Number", 
       mgr.FIRST_NAME ||' '|| mgr.LAST_NAME AS "Manager", 
       mgr.PHONE_NUMBER AS "Phone Number"
FROM L_Employees emp
LEFT OUTER JOIN L_Employees mgr ON mgr.EMPLOYEE_ID = emp.MANAGER_ID
ORDER BY emp.EMPLOYEE_ID ASC;

/* 9.	(Bookstore db) List the customer#, first name and last name of each customer 
that has been referred by another customer. Include the first name and last name 
of the customer who did the act of referring. Research a method on the internet 
to combine the first and last names of the referrer so that it displays in one 
column labeled “Referred By”. Make sure that there is a space between the first 
name and last name when you combine the two. */

SELECT cus.CUSTOMER#, cus.FIRSTNAME, cus.LASTNAME, ref.FIRSTNAME ||' '||ref.LASTNAME AS "Referred By"
FROM B_Customers cus
INNER JOIN B_Customers ref ON ref.CUSTOMER# = cus.REFERRED
ORDER BY cus.CUSTOMER# ASC;

/* 10.	(Multiple dbs) Create one full list of first names and last names of all 
customers from the Chinook tables, all authors from the Bookstore tables, all 
customers from the Bookstore tables, and all employees from the Lunches tables. 
Sort the list by last name and first name in ascending order.*/

--connection is lunches.
SELECT UPPER(firstname) as "First Name", UPPER(lastname) as "Last Name" FROM (
              SELECT FIRSTNAME firstname, LASTNAME lastname FROM CHINOOK.CUSTOMER
              UNION
              SELECT FNAME firstname, LNAME lastname FROM BOOKSTORE.B_AUTHOR
              UNION
              SELECT FIRSTNAME firstname, LASTNAME lastname FROM BOOKSTORE.B_CUSTOMERS
              UNION
              SELECT FIRST_NAME firstname, LAST_NAME lastname FROM L_EMPLOYEES
              )
ORDER BY UPPER(lastname) ASC, UPPER(firstname) ASC;

/* 11.	(Numbers db) Using the Numbers_Twos and Numbers_Threes tables, show the 
results of a query that only displays numbers that do not have a matching value 
in the other table.*/

SELECT * FROM NUMBERS_TWOS
LEFT JOIN NUMBERS_THREES ON NUMBERS_THREES.MULTIPLE_OF_3 = NUMBERS_TWOS.MULTIPLE_OF_2
WHERE Numbers_Threes.MULTIPLE_OF_3 IS NULL
ORDER BY NUMBERS_TWOS.MULTIPLE_OF_2 ASC;

/* 12.	(Numbers db) Using the Numbers_Twos and Numbers_threes tables, show the 
results of a query that only displays numbers that have a matching value in the 
other table. Here’s the catch: You are not permitted to use a WHERE clause or joins for this query.*/

SELECT * FROM NUMBERS_TWOS
LEFT OUTER JOIN NUMBERS_THREES ON NUMBERS_THREES.MULTIPLE_OF_3 = NUMBERS_TWOS.MULTIPLE_OF_2;
