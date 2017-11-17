/*  
Author: Edward Ma
Student ID: W0057568

Data Migration Project.
Enhancement #1 Part 1

Creating Warehouse table, adding name of warehouse, address and postal code. ASSUMING
it's all in the same city.
*/

-- drop table
DROP TABLE Warehouse PURGE;
DROP TABLE Inventory PURGE;
-- create table
CREATE TABLE Warehouse 
	(
	WarehouseID NUMBER NOT NULL,
	NAME Varchar(18) NOT NULL,
	Address VARCHAR(50),
	PostalCode VARCHAR(7),
	CONSTRAINT PK_Warehouse PRIMARY KEY (WarehouseID)
	);

CREATE TABLE Inventory
  (
  InventoryID NUMBER NULL,
  ProductID NUMBER NULL,
  OrderID NUMBER NULL,
  WarehouseID NUMBER NULL,
  UnitsInStock NUMBER NULL
  );
-- insert new value warehouse table
INSERT INTO Warehouse VALUES(1,'Dockside Warehouse', '38 College Lane', 'B0N 2S0');
INSERT INTO Warehouse VALUES(2,'Airport Warehouse', '8916 College St', 'B3K 5L2');
INSERT INTO Warehouse VALUES(3,'Central Warehouse', '26 Parker Ave', 'B0M 1X0');

-- moving UnitedInStock, UnitsOnOrder, and ReorderLevel from Products to Inventory
-- found out total product
--SELECT COUNT(ProductID) FROM Products;
-- answer is 77

-- insert primary key
BEGIN
  FOR x IN 1..77
    LOOP
      INSERT INTO Inventory (InventoryID, ProductID) VALUES (x, x);
    END LOOP;
END;

-- insert UnitsInStock from Products to Inventory
MERGE INTO Inventory inv
USING (
      SELECT * FROM Products
      ) pro
ON (pro.ProductID = inv.ProductID)
WHEN MATCHED THEN UPDATE
SET inv.UnitsInStock = pro.UnitsInStock;

-- manually adding warehouse ID to Inventory Table.
UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 1; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 2; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 3; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 4; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 5; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 6; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 7; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 8; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 9; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 10; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 11;

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 12; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 13; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 14; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 15; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 16; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 17; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 18; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 19; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 20; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 21; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 22; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 23; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 24; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 25; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 26; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 27; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 28; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 29; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 30; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 31; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 32; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 33; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 34; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 35; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 36; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 37; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 38; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 39; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 40; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 41; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 42; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 43; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 44; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 45; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 46; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 47; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 48; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 49; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 50; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 51; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 52; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 53; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 54; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 55; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 56; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 57; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 58; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 59; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 60; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 61; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 62; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 63; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 64; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 65; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 66; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 67; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 68; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 69; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 70; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 71; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 72; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 73; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 74; 

UPDATE Inventory
SET WarehouseID = 2
WHERE INVENTORYID = 75; 

UPDATE Inventory
SET WarehouseID = 3
WHERE INVENTORYID = 76; 

UPDATE Inventory
SET WarehouseID = 1
WHERE INVENTORYID = 77; 

-- test to see if it update correctly
SELECT * FROM Inventory;
--comparing UnitsInStock,  from Products and Inventory before removing from products
--SELECT Inv.UnitsInStock, pro.UnitsInStock
--FROM Inventory inv, Products pro
--WHERE pro.PRODUCTID = inv.INVENTORYID;

-- removing UnitsInStock, UnitsOnOrder, ReorderLevel from Products
ALTER TABLE Products
DROP (UnitsInStock);