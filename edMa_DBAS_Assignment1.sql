/*
Student: Edward Ma
Student ID: W0057568
DBAS-1100 Assignment 1
*/

/* 1 Create a query that returns all album titles in alphabetical order for the artist with ID 22. */

SELECT Title FROM Album WHERE ArtistId = 22 ORDER BY Title ASC;

/* 2 Create a query that will list all the album titles containing the word “Best”. 
(You need only to accommodate the displayed spelling of the word.)*/

SELECT Title FROM Album WHERE Title LIKE '%Best%' ORDER BY Title DESC;

/* 3 Create a query that lists all songs with the genre ‘Alternative’ that do not have a composer. 
Build the query as if you do not have direct access to the id for ‘Alternative’. 
Sort the results alphabetically.*/

SELECT Track.Name 
FROM Track 
WHERE Track.Composer is null AND GENREID = (SELECT GenreID From Genre WHERE Name = 'Alternative') 
ORDER BY Track.Name ASC;

/* 4 Create a query that lists all employees who were hired less than fourteen years ago and who are older than 50 years of age.*/

SELECT Lastname, Firstname, hiredate, birthdate 
FROM Employee 
WHERE (HIREDATE > (CURRENT_DATE - TO_YMINTERVAL('14-0'))) AND (BIRTHDATE < CURRENT_DATE - TO_YMINTERVAL('50-0'));

/* 5 Create a query that lists the first name, last name and email address of all customers who have 'Steve Johnson' as a support rep.  
Build the query as if you do not know Steve Johnson's id.  Sort the results alphabetically by last name.*/

SELECT CUSTOMER.FIRSTNAME, CUSTOMER.LASTNAME, CUSTOMER.EMAIL 
FROM CUSTOMER
WHERE SUPPORTREPID = (SELECT EMPLOYEEID FROM EMPLOYEE WHERE LASTNAME = 'Johnson' AND FIRSTNAME = 'Steve')
ORDER BY CUSTOMER.LASTNAME ASC;

/* 6 Create a query that returns all tracks that either start with the letter ‘A’, or end with the letter ‘t’. 
Suppress any duplicate track names and sort the results in reverse alphabetical order.*/

SELECT DISTINCT NAME FROM TRACK WHERE NAME LIKE 'A%' OR NAME LIKE '%t' ORDER BY NAME DESC;

/* 7 Create a query that returns the highest number of albums available from a single artist.*/
-- trouble!
--SELECT DISTINCT NAME, Artist.ARTISTID FROM Artist, Album WHERE Artist.ARTISTID = 90;

SELECT * FROM (SELECT ARTISTID, COUNT(TITLE) FROM Album GROUP BY ARTISTID ORDER BY COUNT(TITLE) DESC) WHERE ROWNUM <= 1;

/* 8 Create a query that lists the CustomerId and number of orders placed for each customer.
Then modify the query to display only those records whose total is more than 40 dollars. 
Sort from highest total to lowest total, then sort by CustomerId from lowest to highest.*/

SELECT CustomerID, COUNT(*), SUM(TOTAL) FROM Invoice GROUP BY CustomerID ORDER BY SUM(TOTAL) DESC;

/* 9 Create a query that returns the InvoiceId and the total number of items sold for each invoice. 
Sort the results from the most number of items sold to least number of items sold. 
Then sort by InvoiceId from lowest to highest.*/

SELECT INVOICEID, SUM(QUANTITY) FROM INVOICELINE GROUP BY INVOICEID ORDER BY SUM(QUANTITY) DESC, INVOICEID ASC;

/* 10 Create a query that returns all customers who have invoices with a total over $5.00 and are affiliated with a company.*/

--Select CustomerID From Customer where company is not null;

Select distinct Customer.customerid From customer, Invoice Where Invoice.TOTAL > 5 AND customer.COMPANY is not null Order By customerid ASC;

/* 11 Create a query that lists the AlbumId and Track Count for albums containing more than 25 tracks. 
Sort the results by the Track Count in descending order.*/

Select ALBUMID, COUNT(TRACKID) AS "TRACK COUNT" from Track GROUP By ALBUMID HAVING COUNT(TRACKID) > 25 ORDER BY COUNT(TRACKID) DESC;

/* 12 Create a query that returns the names of the songs contained in the playlist with ID 17.  
Sort the song names alphabetically.*/

select name from track where trackid in (select trackid from playlisttrack where playlistid = 17) ORDER BY name asc;

/* 13 Create a query that only lists the playlist ids of playlists containing more than 100 tracks. 
Sort from largest to smallest playlist.*/

select playlistid, count(trackid) from playlisttrack group by playlistid having count(trackid) > 100 order by count(trackid) desc;

/* 14 Create a query that displays the total number of tracks that have not yet been purchased at least once. */

Select count(trackid) from track Where trackid not in (select trackid from invoiceline);

/* 15 Create a query that lists all of the playlist ids for any playlists that contain the track with the title "Stairway To Heaven". 
Display Playlist IDs in Ascending order*/

Select distinct playlistid from playlisttrack, track where track.name = 'Stairway To Heaven' AND playlisttrack.trackid = track.trackid order by playlistid asc;
