USE SQLTrainer_ECommerce;
GO
BULK INSERT dbo.Categories FROM 'C:\SQLTrainer_ECommerce\Data\Categories.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.Suppliers FROM 'C:\SQLTrainer_ECommerce\Data\Suppliers.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.Products FROM 'C:\SQLTrainer_ECommerce\Data\Products.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.Stores FROM 'C:\SQLTrainer_ECommerce\Data\Stores.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.Employees FROM 'C:\SQLTrainer_ECommerce\Data\Employees.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.Customers FROM 'C:\SQLTrainer_ECommerce\Data\Customers.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.Orders FROM 'C:\SQLTrainer_ECommerce\Data\Orders.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.OrderDetails FROM 'C:\SQLTrainer_ECommerce\Data\OrderDetails.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.Payments FROM 'C:\SQLTrainer_ECommerce\Data\Payments.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.Shipments FROM 'C:\SQLTrainer_ECommerce\Data\Shipments.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.Returns FROM 'C:\SQLTrainer_ECommerce\Data\Returns.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
BULK INSERT dbo.Inventory FROM 'C:\SQLTrainer_ECommerce\Data\Inventory.csv'
WITH (FORMAT='CSV', FIRSTROW=2, FIELDQUOTE='"', TABLOCK);
GO
