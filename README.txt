SQL SERVER REAL-TIME TRAINING PROJECT
======================================
Project: E-Commerce Sales & Operations

1. Install SQL Server Developer/Express and SSMS.
2. Open 01_Create_Database.sql and run it.
3. Run 02_Create_Tables.sql.
4. Put the Data folder at C:\SQLTrainer_ECommerce\Data
   OR change the paths in 03_Bulk_Insert.sql.
5. Run 03_Bulk_Insert.sql.
6. Open 04_Questions.sql and start solving.

IMPORTANT BULK INSERT NOTE:
The SQL Server service account must be able to read the CSV files.
If BULK INSERT fails because of permissions, copy the Data folder to a
SQL Server-accessible local path or use the SSMS Import Flat File wizard.

DATA VOLUME:
~30K customers
500 products
60 suppliers
50 stores
250 employees
120K orders
300K+ order details
120K payments
~100K shipments
~4K returns
750K inventory snapshots

TRAINER TIP:
Give students 1-105 first without solutions. Use 106-145 for guided
business cases. Use 146-175 as interview/capstone assignments.
