/*  
Author: Edward Ma
Student ID: W0057568

Data Migration Project.
Test Scripts

Just some test scripts to make sure everything is cool.
*/

-- found this script on http://blog.mclaughlinsoftware.com/2009/03/05/validating-foreign-keys/
-- not quite sure how it works... though.

SELECT   uc.constraint_name||CHR(10)
||      '('||ucc1.table_name||'.'||ucc1.column_name||')' constraint_source
,       'REFERENCES'||CHR(10)
||      '('||ucc2.table_name||'.'||ucc2.column_name||')' references_column
FROM     user_constraints uc
,        user_cons_columns ucc1
,        user_cons_columns ucc2
WHERE    uc.constraint_name = ucc1.constraint_name
AND      uc.r_constraint_name = ucc2.constraint_name
AND      ucc1.position = ucc2.position -- Correction for multiple column primary keys.
AND      uc.constraint_type = 'R'
ORDER BY ucc1.table_name
,        uc.constraint_name;
