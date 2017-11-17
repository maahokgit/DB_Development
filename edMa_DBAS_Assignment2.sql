/* 
Student: Edward Ma
Student ID: W0057568
Date: March 23, 2017
DBAS-1100 Assignment 2
*/

/* 1.	Display the First Name, Last Name of each customer along with the First 
Name and Last Name of their support rep. Give the support rep the appropriate 
alias. */

SELECT Customer.FirstName, Customer.LastName, Employee.FirstName  ||' '||  Employee.LastName AS "Support Rep"
FROM Customer
INNER JOIN Employee ON Employee.EmployeeID=Customer.SupportRepID
ORDER BY Customer.LASTNAME ASC;

/* 2.	Display the track name, genre name, and mediatype name for each track in 
the database. */

SELECT Track.NAME AS "Track Name", Genre.NAME AS "Genre", Mediatype.NAME AS "Media Type"
FROM Track
INNER JOIN Mediatype ON Track.MEDIATYPEID = Mediatype.MEDIATYPEID
INNER JOIN Genre ON Track.GENREID = Genre.GENREID
ORDER BY Track.NAME ASC;

/* 3.	Display the first name and last name of each customer along with the name 
of each track that they have purchased and the date the track was purchased on. 
Sort the results by customer last name, then first name, then name of the track.*/ 

SELECT Customer.FIRSTNAME AS "First Name", 
Customer.LASTNAME AS "Last Name", 
Track.NAME AS "Track Name", 
TO_CHAR(Invoice.INVOICEDATE, 'MON-DD-YYYY') AS "Invoice Date"
FROM Customer
INNER JOIN Invoice ON Customer.CUSTOMERID = Invoice.CUSTOMERID
INNER JOIN Invoiceline ON Invoice.INVOICEID = Invoiceline.INVOICEID
INNER JOIN Track ON Invoiceline.TRACKID = Track.TRACKID
ORDER BY Customer.LASTNAME ASC, Customer.FIRSTNAME ASC, Track.NAME ASC;

/* 4.	Display the first name and last name of each employee along with the first 
name and last name of their respective manager. */

SELECT Employee.FIRSTNAME, EMPLOYEE.LASTNAME, Mananger.FIRSTNAME ||' '|| Mananger.LASTNAME AS "Manager Name"
FROM Employee
INNER JOIN Employee Mananger ON Mananger.EMPLOYEEID = Employee.REPORTSTO
ORDER BY Employee.LASTNAME ASC;

/* 5.	Display the name of the artist and the total number of albums the artist 
has available for sale. */

SELECT Artist.NAME, total.AlbumCount
FROM Artist
INNER JOIN (
  SELECT ArtistID, COUNT(Album.TITLE) AlbumCount 
  FROM Album GROUP BY ArtistID) Total 
ON Artist.ARTISTID = total.ARTISTID
ORDER BY Total.AlbumCount DESC;

/* 6.	Display the name of each track along with the name of the album it’s from 
and the name of the artist who performs it. */

SELECT Artist.NAME AS "Artist Name", Track.NAME AS "Track Name", Album.TITLE AS "Album Title"
FROM Artist, Track, Album
WHERE Track.ALBUMID = Album.ALBUMID AND Album.ARTISTID = Artist.ARTISTID
ORDER BY Album.TITLE ASC;

/* 7.	Display the first name and last name of each customer along with the 
various types of media that they have purchased. */

SELECT Customer.FIRSTNAME AS "First Name", Customer.LASTNAME AS "Last Name", MediaType.NAME  AS "MediaType"
FROM Customer
INNER JOIN Invoice ON Invoice.CUSTOMERID = Customer.CUSTOMERID
INNER JOIN Invoiceline ON Invoiceline.INVOICEID = Invoice.INVOICEID
INNER JOIN Track ON Track.TRACKID = Invoiceline.TRACKID
INNER JOIN MediaType ON MediaType.MEDIATYPEID = Track.MEDIATYPEID
ORDER BY Customer.LASTNAME ASC;

/* 8.	Display the Invoice id, invoice date, total invoice item quantity, and the
first and last name of the customer who made the purchase. */

SELECT Invoice.INVOICEID, Invoice.INVOICEDATE, Item.Total, Customer.FIRSTNAME, Customer.LASTNAME
FROM Customer
INNER JOIN Invoice ON Invoice.CUSTOMERID = Customer.CUSTOMERID
INNER JOIN (
  SELECT InvoiceID, COUNT(Quantity) total 
  FROM Invoiceline 
  GROUP BY INVOICEID) Item 
  ON Item.InvoiceID = Invoice.INVOICEID
ORDER BY Item.Total DESC, Customer.LASTNAME ASC;

/* 9.	Display the first name and last name of the customer(s) who has purchased 
the most video tracks. */

SELECT * FROM (
  SELECT Customer.FIRSTNAME, Customer.LASTNAME, COUNT(Track.MEDIATYPEID) AS "Total Video Track", Mediatype.NAME
  FROM Customer
  INNER JOIN Invoice ON Invoice.CUSTOMERID = Customer.CUSTOMERID
  INNER JOIN Invoiceline ON Invoiceline.INVOICEID = Invoice.INVOICEID
  INNER JOIN Track ON Track.TRACKID = Invoiceline.TRACKID
  INNER JOIN MediaType ON Track.MEDIATYPEID = MediaType.MEDIATYPEID
  Where Track.MEDIATYPEID = 3
  GROUP BY Customer.FIRSTNAME, Customer.LASTNAME, Track.MEDIATYPEID, Mediatype.NAME
  ORDER BY COUNT(Track.MEDIATYPEID) DESC)
WHERE ROWNUM = 1;
  
/* 10.	Display the name of the artist and number of orders for the artist who 
has had the highest number orders of his/her music placed.*/

SELECT * FROM (
  SELECT Artist.NAME, COUNT(Invoiceline.INVOICEID) AS "Total Orders"
  FROM Artist
  INNER JOIN Album ON Album.ARTISTID = Artist.ARTISTID
  INNER JOIN Track ON Track.ALBUMID = Album.ALBUMID
  INNER JOIN Invoiceline ON Invoiceline.TRACKID = Track.TRACKID
  GROUP BY Artist.NAME
  ORDER BY COUNT(Invoiceline.INVOICEID) DESC)
WHERE ROWNUM = 1;