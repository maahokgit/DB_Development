/*  
Author: Edward Ma
Student ID: W0057568

Data Migration Project.
Enhancement #1 Part 2

Alter Table of Products so there is a relationship to the newly created Warehouse Table.
*/

-- Dropping InventoryID, and making ProductID and WarehouseID as PK.
ALTER TABLE Inventory
DROP (InventoryID);
-- check to see if it is correct
SELECT * FROM Inventory;

-- Creating compound pk for Inventory
ALTER TABLE Inventory
ADD (
      CONSTRAINT PK_Inventory PRIMARY KEY (ProductID,	WarehouseID, OrderID),
      CONSTRAINT FK_Inventory_Products FOREIGN KEY (ProductID)
        REFERENCES Products (ProductID),
      CONSTRAINT FK_Inventory_Warehouse FOREIGN KEY (WarehouseID)
        REFERENCES Warehouse (WarehouseID)
    );
