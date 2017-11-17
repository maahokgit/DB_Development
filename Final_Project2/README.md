Author: Edward Ma

DBAS Project 2 - Data Migration

In case we are needed to redo this, because something terrible happen...

Please run the following files in sequence

MigrationDDL.sql
MigrationDML.sql

This will migrate from the Original NorthWind Database to the new Enhanced one.
Then run

Enhancement1_1.sql and Enhancement1_2 for the first enchancement.
Enhancement2.sql for the second enchancement.
Enhancement3_1.sql and Enhancement3_2 for the third enchancement.
Enhancement4.sql for the fourth enchancement.

Testscripts.sql are extra scripting I have done to make sure it is Foreign key are all correct, and the new HR_Name will auto populate when
enter the title of Courtesy, first name and last name.

PS: this was fun.
