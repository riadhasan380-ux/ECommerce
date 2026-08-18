USE SQL_ECommerce;
GO

-- ============================================================
-- QUESTION 1
-- ============================================================
SELECT * FROM dbo.Customers WHERE IsActive = 1;
GO

-- ============================================================
-- QUESTION 2
-- ============================================================
SELECT TOP (100) * FROM dbo.Products ORDER BY UnitPrice DESC;
GO

-- ============================================================
-- QUESTION 3
-- ============================================================
SELECT * FROM dbo.Customers WHERE State = 'Maharashtra';
GO

-- ============================================================
-- QUESTION 4
-- ============================================================
SELECT * FROM dbo.Products WHERE UnitPrice > 50000;
GO

-- ============================================================
-- QUESTION 5
-- ============================================================
SELECT * FROM dbo.Orders WHERE OrderDate >= '2025-01-01' AND OrderDate < '2026-01-01';
GO

-- ============================================================
-- QUESTION 6
-- ============================================================
SELECT COUNT(*) AS TotalCustomers FROM dbo.Customers;
GO

-- ============================================================
-- QUESTION 7
-- ============================================================
SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount
FROM dbo.Categories c LEFT JOIN dbo.Products p ON p.CategoryID=c.CategoryID
GROUP BY c.CategoryName;
GO

-- ============================================================
-- QUESTION 8
-- ============================================================
SELECT MIN(UnitPrice) AS MinPrice, MAX(UnitPrice) AS MaxPrice, AVG(UnitPrice) AS AvgPrice FROM dbo.Products;
GO

-- ============================================================
-- QUESTION 9
-- ============================================================
SELECT DISTINCT PaymentMethod FROM dbo.Payments;
GO

-- ============================================================
-- QUESTION 10
-- ============================================================
SELECT * FROM dbo.Orders WHERE OrderStatus='Completed';
GO

-- ============================================================
-- QUESTION 11
-- ============================================================
SELECT OrderStatus, COUNT(*) AS OrderCount FROM dbo.Orders GROUP BY OrderStatus;
GO

-- ============================================================
-- QUESTION 12
-- ============================================================
SELECT State, COUNT(*) AS CustomerCount FROM dbo.Customers GROUP BY State ORDER BY CustomerCount DESC;
GO

-- ============================================================
-- QUESTION 13
-- ============================================================
SELECT * FROM dbo.Products WHERE UnitPrice BETWEEN 1000 AND 10000;
GO

-- ============================================================
-- QUESTION 14
-- ============================================================
SELECT * FROM dbo.Customers WHERE CustomerName LIKE 'A%';
GO

-- ============================================================
-- QUESTION 15
-- ============================================================
SELECT * FROM dbo.Products WHERE ProductName LIKE '%Product%';
GO

-- ============================================================
-- QUESTION 16
-- ============================================================
SELECT TOP (20) * FROM dbo.Products ORDER BY UnitPrice DESC;
GO

-- ============================================================
-- QUESTION 17
-- ============================================================
SELECT * FROM dbo.Orders WHERE PaymentStatus='Paid' AND OrderStatus <> 'Completed';
GO

-- ============================================================
-- QUESTION 18
-- ============================================================
SELECT Carrier, COUNT(*) AS ShipmentCount FROM dbo.Shipments GROUP BY Carrier;
GO

-- ============================================================
-- QUESTION 19
-- ============================================================
SELECT * FROM dbo.Returns;
GO

-- ============================================================
-- QUESTION 20
-- ============================================================
SELECT AVG(SupplierRating) AS AvgSupplierRating FROM dbo.Suppliers;
GO

-- ============================================================
-- QUESTION 21
-- ============================================================
SELECT p.ProductName,c.CategoryName,s.SupplierName FROM dbo.Products p JOIN dbo.Categories c ON c.CategoryID=p.CategoryID JOIN dbo.Suppliers s ON s.SupplierID=p.SupplierID;
GO

-- ============================================================
-- QUESTION 22
-- ============================================================
SELECT o.OrderID,c.CustomerName,o.OrderDate FROM dbo.Orders o JOIN dbo.Customers c ON c.CustomerID=o.CustomerID;
GO

-- ============================================================
-- QUESTION 23
-- ============================================================
SELECT od.OrderID,p.ProductName,od.Quantity,od.UnitPrice,od.DiscountPct FROM dbo.OrderDetails od JOIN dbo.Products p ON p.ProductID=od.ProductID;
GO

-- ============================================================
-- QUESTION 24
-- ============================================================
SELECT OrderDetailID, Quantity*UnitPrice AS GrossAmount FROM dbo.OrderDetails;
GO

-- ============================================================
-- QUESTION 25
-- ============================================================
SELECT OrderDetailID, Quantity*UnitPrice*(1-DiscountPct/100.0) AS NetAmount FROM dbo.OrderDetails;
GO

-- ============================================================
-- QUESTION 26
-- ============================================================
SELECT c.* FROM dbo.Customers c WHERE EXISTS (SELECT 1 FROM dbo.Orders o WHERE o.CustomerID=c.CustomerID);
GO

-- ============================================================
-- QUESTION 27
-- ============================================================
SELECT StoreID,StoreName,Region FROM dbo.Stores ORDER BY Region,StoreName;
GO

-- ============================================================
-- QUESTION 28
-- ============================================================
SELECT * FROM dbo.Employees WHERE Department='Sales';
GO

-- ============================================================
-- QUESTION 29
-- ============================================================
SELECT i.StoreID,i.ProductID,i.ClosingStock,p.ReorderLevel FROM dbo.Inventory i JOIN dbo.Products p ON p.ProductID=i.ProductID WHERE i.ClosingStock < p.ReorderLevel;
GO

-- ============================================================
-- QUESTION 30
-- ============================================================
SELECT ProductID,SUM(Quantity) AS TotalQtySold FROM dbo.OrderDetails GROUP BY ProductID ORDER BY TotalQtySold DESC;
GO

-- ============================================================
-- QUESTION 31
-- ============================================================
SELECT YEAR(o.OrderDate) AS SalesYear,MONTH(o.OrderDate) AS SalesMonth,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) AS Revenue
FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled'
GROUP BY YEAR(o.OrderDate),MONTH(o.OrderDate) ORDER BY SalesYear,SalesMonth;
GO

-- ============================================================
-- QUESTION 32
-- ============================================================
SELECT YEAR(o.OrderDate) AS SalesYear,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) AS Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY YEAR(o.OrderDate) ORDER BY SalesYear;
GO

-- ============================================================
-- QUESTION 33
-- ============================================================
SELECT TOP (10) c.CustomerID,c.CustomerName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) AS Revenue
FROM dbo.Customers c JOIN dbo.Orders o ON o.CustomerID=c.CustomerID JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled'
GROUP BY c.CustomerID,c.CustomerName ORDER BY Revenue DESC;
GO

-- ============================================================
-- QUESTION 34
-- ============================================================
SELECT TOP (10) p.ProductID,p.ProductName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) AS Revenue
FROM dbo.Products p JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID JOIN dbo.Orders o ON o.OrderID=od.OrderID WHERE o.OrderStatus<>'Cancelled'
GROUP BY p.ProductID,p.ProductName ORDER BY Revenue DESC;
GO

-- ============================================================
-- QUESTION 35
-- ============================================================
SELECT c.CategoryName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) AS Revenue
FROM dbo.Categories c JOIN dbo.Products p ON p.CategoryID=c.CategoryID JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID JOIN dbo.Orders o ON o.OrderID=od.OrderID WHERE o.OrderStatus<>'Cancelled'
GROUP BY c.CategoryName ORDER BY Revenue DESC;
GO

-- ============================================================
-- QUESTION 36
-- ============================================================
SELECT s.StoreName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) AS Revenue FROM dbo.Stores s JOIN dbo.Orders o ON o.StoreID=s.StoreID JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY s.StoreName ORDER BY Revenue DESC;
GO

-- ============================================================
-- QUESTION 37
-- ============================================================
WITH x AS (SELECT o.OrderID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,MIN(o.OrderDate) OrderDate FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY o.OrderID) SELECT YEAR(OrderDate) SalesYear,MONTH(OrderDate) SalesMonth,AVG(Revenue) AOV FROM x GROUP BY YEAR(OrderDate),MONTH(OrderDate) ORDER BY SalesYear,SalesMonth;
GO

-- ============================================================
-- QUESTION 38
-- ============================================================
SELECT YEAR(RegistrationDate) RegYear,MONTH(RegistrationDate) RegMonth,COUNT(*) NewCustomers FROM dbo.Customers GROUP BY YEAR(RegistrationDate),MONTH(RegistrationDate) ORDER BY RegYear,RegMonth;
GO

-- ============================================================
-- QUESTION 39
-- ============================================================
SELECT CustomerID,COUNT(*) OrderCount FROM dbo.Orders GROUP BY CustomerID HAVING COUNT(*)>5 ORDER BY OrderCount DESC;
GO

-- ============================================================
-- QUESTION 40
-- ============================================================
SELECT c.* FROM dbo.Customers c LEFT JOIN dbo.Orders o ON o.CustomerID=c.CustomerID WHERE o.OrderID IS NULL;
GO

-- ============================================================
-- QUESTION 41
-- ============================================================
SELECT p.* FROM dbo.Products p LEFT JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID WHERE od.OrderDetailID IS NULL;
GO

-- ============================================================
-- QUESTION 42
-- ============================================================
WITH r AS (SELECT p.*,DENSE_RANK() OVER(PARTITION BY CategoryID ORDER BY UnitPrice DESC) rn FROM dbo.Products p) SELECT * FROM r WHERE rn=2;
GO

-- ============================================================
-- QUESTION 43
-- ============================================================
WITH x AS (SELECT p.CategoryID,p.ProductID,p.ProductName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Products p JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID JOIN dbo.Orders o ON o.OrderID=od.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY p.CategoryID,p.ProductID,p.ProductName), r AS (SELECT *,DENSE_RANK() OVER(PARTITION BY CategoryID ORDER BY Revenue DESC) rn FROM x) SELECT * FROM r WHERE rn<=3;
GO

-- ============================================================
-- QUESTION 44
-- ============================================================
WITH x AS (SELECT s.Region,s.StoreID,s.StoreName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Stores s JOIN dbo.Orders o ON o.StoreID=s.StoreID JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY s.Region,s.StoreID,s.StoreName), r AS (SELECT *,DENSE_RANK() OVER(PARTITION BY Region ORDER BY Revenue DESC) rn FROM x) SELECT * FROM r WHERE rn<=5;
GO

-- ============================================================
-- QUESTION 45
-- ============================================================
SELECT YEAR(o.OrderDate) Y,MONTH(o.OrderDate) M,COUNT(DISTINCT o.OrderID) Orders,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY YEAR(o.OrderDate),MONTH(o.OrderDate) ORDER BY Y,M;
GO

-- ============================================================
-- QUESTION 46
-- ============================================================
SELECT YEAR(OrderDate) Y,MONTH(OrderDate) M,100.0*SUM(CASE WHEN OrderStatus='Cancelled' THEN 1 ELSE 0 END)/COUNT(*) CancellationPct FROM dbo.Orders GROUP BY YEAR(OrderDate),MONTH(OrderDate) ORDER BY Y,M;
GO

-- ============================================================
-- QUESTION 47
-- ============================================================
SELECT PaymentMethod,100.0*SUM(CASE WHEN PaymentStatus='Failed' THEN 1 ELSE 0 END)/COUNT(*) FailurePct FROM dbo.Payments GROUP BY PaymentMethod;
GO

-- ============================================================
-- QUESTION 48
-- ============================================================
SELECT c.CategoryName,AVG(od.DiscountPct) AvgDiscount FROM dbo.Categories c JOIN dbo.Products p ON p.CategoryID=c.CategoryID JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID GROUP BY c.CategoryName;
GO

-- ============================================================
-- QUESTION 49
-- ============================================================
SELECT ReturnReason,SUM(RefundAmount) RefundAmount FROM dbo.Returns GROUP BY ReturnReason ORDER BY RefundAmount DESC;
GO

-- ============================================================
-- QUESTION 50
-- ============================================================
WITH sold AS (SELECT ProductID,SUM(Quantity) SoldQty FROM dbo.OrderDetails GROUP BY ProductID), ret AS (SELECT ProductID,SUM(ReturnQty) ReturnQty FROM dbo.Returns GROUP BY ProductID) SELECT p.ProductName,COALESCE(s.SoldQty,0) SoldQty,COALESCE(r.ReturnQty,0) ReturnQty,100.0*COALESCE(r.ReturnQty,0)/NULLIF(s.SoldQty,0) ReturnRatePct FROM dbo.Products p LEFT JOIN sold s ON s.ProductID=p.ProductID LEFT JOIN ret r ON r.ProductID=p.ProductID;
GO

-- ============================================================
-- QUESTION 51
-- ============================================================
SELECT Carrier,AVG(DATEDIFF(DAY,ShipmentDate,DeliveryDate)*1.0) AvgDeliveryDays FROM dbo.Shipments WHERE DeliveryDate IS NOT NULL GROUP BY Carrier;
GO

-- ============================================================
-- QUESTION 52
-- ============================================================
SELECT * FROM dbo.Shipments WHERE DeliveryDate IS NOT NULL AND DATEDIFF(DAY,ShipmentDate,DeliveryDate)>7;
GO

-- ============================================================
-- QUESTION 53
-- ============================================================
WITH x AS (SELECT CustomerID,MAX(OrderDate) LatestOrder FROM dbo.Orders GROUP BY CustomerID) SELECT c.CustomerID,c.CustomerName,x.LatestOrder FROM dbo.Customers c JOIN x ON x.CustomerID=c.CustomerID WHERE x.LatestOrder>='2025-01-01' AND x.LatestOrder<'2026-01-01';
GO

-- ============================================================
-- QUESTION 54
-- ============================================================
SELECT CustomerID,MIN(OrderDate) FirstOrder,MAX(OrderDate) LastOrder FROM dbo.Orders GROUP BY CustomerID;
GO

-- ============================================================
-- QUESTION 55
-- ============================================================
SELECT o.CustomerID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) LifetimeRevenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY o.CustomerID;
GO

-- ============================================================
-- QUESTION 56
-- ============================================================
WITH x AS (SELECT ProductID,SUM(Quantity*UnitPrice*(1-DiscountPct/100.0)) Revenue FROM dbo.OrderDetails GROUP BY ProductID), a AS (SELECT AVG(Revenue) AvgRevenue FROM x) SELECT x.* FROM x CROSS JOIN a WHERE x.Revenue>a.AvgRevenue;
GO

-- ============================================================
-- QUESTION 57
-- ============================================================
WITH x AS (SELECT o.StoreID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY o.StoreID), a AS (SELECT AVG(Revenue) AvgRevenue FROM x) SELECT x.* FROM x CROSS JOIN a WHERE Revenue>AvgRevenue;
GO

-- ============================================================
-- QUESTION 58
-- ============================================================
WITH m AS (SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) MonthStart,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)), x AS (SELECT *,LAG(Revenue) OVER(ORDER BY MonthStart) PrevRevenue FROM m) SELECT MonthStart,Revenue,PrevRevenue,100.0*(Revenue-PrevRevenue)/NULLIF(PrevRevenue,0) GrowthPct FROM x;
GO

-- ============================================================
-- QUESTION 59
-- ============================================================
WITH m AS (SELECT DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) MonthStart,COUNT(*) Orders FROM dbo.Orders GROUP BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)), x AS (SELECT *,LAG(Orders) OVER(ORDER BY MonthStart) PrevOrders FROM m) SELECT *,100.0*(Orders-PrevOrders)/NULLIF(PrevOrders,0) GrowthPct FROM x;
GO

-- ============================================================
-- QUESTION 60
-- ============================================================
WITH x AS (SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) MonthStart,p.ProductID,p.ProductName,SUM(od.Quantity) Qty FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1),p.ProductID,p.ProductName), r AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY MonthStart ORDER BY Qty DESC) rn FROM x) SELECT * FROM r WHERE rn=1;
GO

-- ============================================================
-- QUESTION 61
-- ============================================================
WITH x AS (SELECT o.StoreID,o.CustomerID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY o.StoreID,o.CustomerID), r AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY StoreID ORDER BY Revenue DESC) rn FROM x) SELECT * FROM r WHERE rn=1;
GO

-- ============================================================
-- QUESTION 62
-- ============================================================
SELECT TOP (1) c.CategoryName,AVG(x.OrderValue) AvgOrderValue FROM dbo.Categories c JOIN dbo.Products p ON p.CategoryID=c.CategoryID JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID JOIN (SELECT OrderID,SUM(Quantity*UnitPrice*(1-DiscountPct/100.0)) OrderValue FROM dbo.OrderDetails GROUP BY OrderID) x ON x.OrderID=od.OrderID GROUP BY c.CategoryName ORDER BY AvgOrderValue DESC;
GO

-- ============================================================
-- QUESTION 63
-- ============================================================
SELECT e.EmployeeID,e.EmployeeName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Employees e JOIN dbo.Orders o ON o.EmployeeID=e.EmployeeID JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY e.EmployeeID,e.EmployeeName ORDER BY Revenue DESC;
GO

-- ============================================================
-- QUESTION 64
-- ============================================================
WITH x AS (SELECT c.CategoryName,r.ReturnReason,COUNT(*) Cnt FROM dbo.Returns r JOIN dbo.Products p ON p.ProductID=r.ProductID JOIN dbo.Categories c ON c.CategoryID=p.CategoryID GROUP BY c.CategoryName,r.ReturnReason), z AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY CategoryName ORDER BY Cnt DESC) rn FROM x) SELECT * FROM z WHERE rn=1;
GO

-- ============================================================
-- QUESTION 65
-- ============================================================
WITH latest AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY StoreID,ProductID ORDER BY InventoryDate DESC) rn FROM dbo.Inventory) SELECT l.StoreID,l.ProductID,l.ClosingStock,p.ReorderLevel FROM latest l JOIN dbo.Products p ON p.ProductID=l.ProductID WHERE l.rn=1 AND l.ClosingStock<=p.ReorderLevel;
GO

-- ============================================================
-- QUESTION 66
-- ============================================================
WITH x AS (SELECT p.CategoryID,p.ProductID,p.ProductName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Products p JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID GROUP BY p.CategoryID,p.ProductID,p.ProductName) SELECT *,DENSE_RANK() OVER(PARTITION BY CategoryID ORDER BY Revenue DESC) RevenueRank FROM x;
GO

-- ============================================================
-- QUESTION 67
-- ============================================================
WITH x AS (SELECT c.State,c.CustomerID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Customers c JOIN dbo.Orders o ON o.CustomerID=c.CustomerID JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY c.State,c.CustomerID) SELECT *,DENSE_RANK() OVER(PARTITION BY State ORDER BY Revenue DESC) StateRank FROM x;
GO

-- ============================================================
-- QUESTION 68
-- ============================================================
WITH m AS (SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) M,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)) SELECT M,Revenue,SUM(Revenue) OVER(ORDER BY M ROWS UNBOUNDED PRECEDING) RunningRevenue FROM m;
GO

-- ============================================================
-- QUESTION 69
-- ============================================================
WITH x AS (SELECT o.StoreID,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) M,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY o.StoreID,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)) SELECT *,SUM(Revenue) OVER(PARTITION BY StoreID ORDER BY M) RunningRevenue FROM x;
GO

-- ============================================================
-- QUESTION 70
-- ============================================================
WITH m AS (SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) M,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)) SELECT M,Revenue,AVG(Revenue) OVER(ORDER BY M ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) Moving3MonthAvg FROM m;
GO

-- ============================================================
-- QUESTION 71
-- ============================================================
WITH m AS (SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) M,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)) SELECT *,100.0*(Revenue-LAG(Revenue) OVER(ORDER BY M))/NULLIF(LAG(Revenue) OVER(ORDER BY M),0) MoMGrowthPct FROM m;
GO

-- ============================================================
-- QUESTION 72
-- ============================================================
WITH y AS (SELECT YEAR(o.OrderDate) Y,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY YEAR(o.OrderDate)) SELECT *,LAG(Revenue) OVER(ORDER BY Y) PrevYearRevenue,100.0*(Revenue-LAG(Revenue) OVER(ORDER BY Y))/NULLIF(LAG(Revenue) OVER(ORDER BY Y),0) YoYGrowthPct FROM y;
GO

-- ============================================================
-- QUESTION 73
-- ============================================================
WITH x AS (SELECT o.CustomerID,od.ProductID,o.OrderDate,ROW_NUMBER() OVER(PARTITION BY o.CustomerID ORDER BY o.OrderDate,o.OrderID) rn FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID) SELECT * FROM x WHERE rn=1;
GO

-- ============================================================
-- QUESTION 74
-- ============================================================
SELECT o.CustomerID FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID GROUP BY o.CustomerID HAVING COUNT(DISTINCT p.CategoryID)>=5;
GO

-- ============================================================
-- QUESTION 75
-- ============================================================
SELECT CustomerID FROM dbo.Orders WHERE OrderDate>='2025-01-01' AND OrderDate<'2026-01-01' GROUP BY CustomerID HAVING COUNT(DISTINCT DATEPART(QUARTER,OrderDate))=4;
GO

-- ============================================================
-- QUESTION 76
-- ============================================================
WITH m AS (SELECT DISTINCT CustomerID,DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) M FROM dbo.Orders), x AS (SELECT *,LAG(M) OVER(PARTITION BY CustomerID ORDER BY M) PrevM FROM m) SELECT * FROM x WHERE DATEDIFF(MONTH,PrevM,M)=1;
GO

-- ============================================================
-- QUESTION 77
-- ============================================================
WITH x AS (SELECT CustomerID,OrderDate,LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) PrevOrder FROM dbo.Orders) SELECT TOP (100) *,DATEDIFF(DAY,PrevOrder,OrderDate) GapDays FROM x WHERE PrevOrder IS NOT NULL ORDER BY GapDays DESC;
GO

-- ============================================================
-- QUESTION 78
-- ============================================================
WITH x AS (SELECT CustomerID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY CustomerID), r AS (SELECT *,PERCENT_RANK() OVER(ORDER BY Revenue DESC) PctRank FROM x) SELECT * FROM r WHERE PctRank<=0.10;
GO

-- ============================================================
-- QUESTION 79
-- ============================================================
WITH x AS (SELECT CustomerID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY CustomerID) SELECT *,CASE WHEN Revenue>=1000000 THEN 'Platinum' WHEN Revenue>=500000 THEN 'Gold' WHEN Revenue>=100000 THEN 'Silver' ELSE 'Bronze' END Segment FROM x;
GO

-- ============================================================
-- QUESTION 80
-- ============================================================
WITH m AS (SELECT DISTINCT CustomerID,DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) M FROM dbo.Orders), x AS (SELECT M,CustomerID,LEAD(M) OVER(PARTITION BY CustomerID ORDER BY M) NextM FROM m) SELECT M,COUNT(*) ActiveCustomers,SUM(CASE WHEN DATEDIFF(MONTH,M,NextM)=1 THEN 1 ELSE 0 END) RetainedNextMonth FROM x GROUP BY M;
GO

-- ============================================================
-- QUESTION 81
-- ============================================================
WITH m AS (SELECT ProductID,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) M,SUM(od.Quantity) Qty FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY ProductID,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)), x AS (SELECT *,LAG(Qty,1) OVER(PARTITION BY ProductID ORDER BY M) Q1,LAG(Qty,2) OVER(PARTITION BY ProductID ORDER BY M) Q2 FROM m) SELECT * FROM x WHERE Qty>Q1 AND Q1>Q2;
GO

-- ============================================================
-- QUESTION 82
-- ============================================================
WITH m AS (SELECT ProductID,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) M,SUM(od.Quantity) Qty FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY ProductID,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)), x AS (SELECT *,LAG(Qty) OVER(PARTITION BY ProductID ORDER BY M) Q1,LAG(Qty,2) OVER(PARTITION BY ProductID ORDER BY M) Q2 FROM m) SELECT * FROM x WHERE Qty<Q1 AND Q1<Q2;
GO

-- ============================================================
-- QUESTION 83
-- ============================================================
WITH x AS (SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) M,p.CategoryID,p.ProductID,SUM(od.Quantity) Qty FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1),p.CategoryID,p.ProductID), r AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY M,CategoryID ORDER BY Qty DESC) rn FROM x) SELECT * FROM r WHERE rn<=3;
GO

-- ============================================================
-- QUESTION 84
-- ============================================================
WITH x AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY StoreID,ProductID ORDER BY InventoryDate DESC) rn FROM dbo.Inventory) SELECT * FROM x WHERE rn=1;
GO

-- ============================================================
-- QUESTION 85
-- ============================================================
SELECT * FROM dbo.Inventory WHERE ClosingStock<0 OR OpeningStock+ReceivedQty-SoldQty<>ClosingStock OR ReceivedQty<0 OR SoldQty<0;
GO

-- ============================================================
-- QUESTION 86
-- ============================================================
SELECT TransactionReference,COUNT(*) Cnt FROM dbo.Payments GROUP BY TransactionReference HAVING COUNT(*)>1;
GO

-- ============================================================
-- QUESTION 87
-- ============================================================
WITH calc AS (SELECT o.OrderID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) CalcAmount FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY o.OrderID) SELECT c.OrderID,c.CalcAmount,p.Amount FROM calc c JOIN dbo.Payments p ON p.OrderID=c.OrderID WHERE ABS(c.CalcAmount-p.Amount)>1;
GO

-- ============================================================
-- QUESTION 88
-- ============================================================
SELECT o.OrderID FROM dbo.Orders o LEFT JOIN dbo.Payments p ON p.OrderID=o.OrderID WHERE o.PaymentStatus='Paid' AND p.PaymentID IS NULL;
GO

-- ============================================================
-- QUESTION 89
-- ============================================================
SELECT o.OrderID FROM dbo.Orders o LEFT JOIN dbo.Shipments s ON s.OrderID=o.OrderID WHERE o.OrderStatus='Completed' AND s.ShipmentID IS NULL;
GO

-- ============================================================
-- QUESTION 90
-- ============================================================
SELECT * FROM dbo.Shipments WHERE DeliveryDate<ShipmentDate;
GO

-- ============================================================
-- QUESTION 91
-- ============================================================
WITH s AS (SELECT ProductID,SUM(Quantity) SoldQty FROM dbo.OrderDetails GROUP BY ProductID),r AS (SELECT ProductID,SUM(ReturnQty) ReturnQty FROM dbo.Returns GROUP BY ProductID) SELECT s.ProductID,100.0*r.ReturnQty/NULLIF(s.SoldQty,0) ReturnRatePct FROM s LEFT JOIN r ON r.ProductID=s.ProductID;
GO

-- ============================================================
-- QUESTION 92
-- ============================================================
WITH x AS (SELECT StoreID,YEAR(o.OrderDate) Y,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY StoreID,YEAR(o.OrderDate)), y AS (SELECT *,LAG(Revenue) OVER(PARTITION BY StoreID ORDER BY Y) PrevRevenue FROM x) SELECT * FROM y WHERE PrevRevenue IS NOT NULL AND Revenue>PrevRevenue*1.20;
GO

-- ============================================================
-- QUESTION 93
-- ============================================================
WITH x AS (SELECT ProductID,SUM(Quantity*UnitPrice*(1-DiscountPct/100.0)) Revenue FROM dbo.OrderDetails GROUP BY ProductID), y AS (SELECT *,SUM(Revenue) OVER(ORDER BY Revenue DESC ROWS UNBOUNDED PRECEDING) CumRevenue,SUM(Revenue) OVER() TotalRevenue FROM x) SELECT * FROM y WHERE CumRevenue-Revenue < TotalRevenue*0.80;
GO

-- ============================================================
-- QUESTION 94
-- ============================================================
WITH x AS (SELECT CustomerID,SUM(Quantity*UnitPrice*(1-DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY CustomerID), y AS (SELECT *,SUM(Revenue) OVER(ORDER BY Revenue DESC) CumRevenue,SUM(Revenue) OVER() TotalRevenue FROM x) SELECT * FROM y WHERE CumRevenue-Revenue < TotalRevenue*0.80;
GO

-- ============================================================
-- QUESTION 95
-- ============================================================
WITH x AS (SELECT OrderID,SUM(Quantity*UnitPrice*(1-DiscountPct/100.0)) OrderValue FROM dbo.OrderDetails GROUP BY OrderID) SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY OrderValue) OVER() MedianOrderValue FROM x;
GO

-- ============================================================
-- QUESTION 96
-- ============================================================
WITH x AS (SELECT OrderID,SUM(Quantity*UnitPrice*(1-DiscountPct/100.0)) OrderValue FROM dbo.OrderDetails GROUP BY OrderID) SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY OrderValue) OVER() P90OrderValue FROM x;
GO

-- ============================================================
-- QUESTION 97
-- ============================================================
WITH y AS (SELECT c.CategoryName,YEAR(o.OrderDate) Y,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Categories c JOIN dbo.Products p ON p.CategoryID=c.CategoryID JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID JOIN dbo.Orders o ON o.OrderID=od.OrderID GROUP BY c.CategoryName,YEAR(o.OrderDate)), z AS (SELECT *,LAG(Revenue) OVER(PARTITION BY CategoryName ORDER BY Y) PrevRevenue FROM y) SELECT TOP (1) CategoryName,Y,Revenue,100.0*(Revenue-PrevRevenue)/NULLIF(PrevRevenue,0) GrowthPct FROM z WHERE PrevRevenue IS NOT NULL ORDER BY GrowthPct DESC;
GO

-- ============================================================
-- QUESTION 98
-- ============================================================
WITH x AS (SELECT c.State,c.CustomerID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Customers c JOIN dbo.Orders o ON o.CustomerID=c.CustomerID JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY c.State,c.CustomerID), a AS (SELECT State,AVG(Revenue) AvgRevenue FROM x GROUP BY State) SELECT x.* FROM x JOIN a ON a.State=x.State WHERE x.Revenue>a.AvgRevenue;
GO

-- ============================================================
-- QUESTION 99
-- ============================================================
WITH x AS (SELECT p.CategoryID,p.ProductID,p.UnitPrice,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Products p JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID GROUP BY p.CategoryID,p.ProductID,p.UnitPrice), a AS (SELECT CategoryID,AVG(UnitPrice) AvgPrice,AVG(Revenue) AvgRevenue FROM x GROUP BY CategoryID) SELECT x.* FROM x JOIN a ON a.CategoryID=x.CategoryID WHERE x.UnitPrice>a.AvgPrice AND x.Revenue<a.AvgRevenue;
GO

-- ============================================================
-- QUESTION 100
-- ============================================================
WITH x AS (SELECT o.StoreID,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) M,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY o.StoreID,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)), r AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY StoreID ORDER BY Revenue DESC) BestRN,ROW_NUMBER() OVER(PARTITION BY StoreID ORDER BY Revenue) WorstRN FROM x) SELECT * FROM r WHERE BestRN=1 OR WorstRN=1;
GO

-- ============================================================
-- QUESTION 101
-- ============================================================
WITH x AS (SELECT o.*,c.RegistrationDate FROM dbo.Orders o JOIN dbo.Customers c ON c.CustomerID=o.CustomerID WHERE o.OrderDate>=c.RegistrationDate), r AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY OrderDate) rn FROM x) SELECT * FROM r WHERE rn=1;
GO

-- ============================================================
-- QUESTION 102
-- ============================================================
WITH x AS (SELECT c.CustomerID,c.RegistrationDate,MIN(o.OrderDate) FirstOrder FROM dbo.Customers c JOIN dbo.Orders o ON o.CustomerID=c.CustomerID AND o.OrderDate>=c.RegistrationDate GROUP BY c.CustomerID,c.RegistrationDate) SELECT *,DATEDIFF(DAY,RegistrationDate,FirstOrder) DaysToFirstPurchase FROM x;
GO

-- ============================================================
-- QUESTION 103
-- ============================================================
SELECT CustomerID FROM dbo.Orders o JOIN dbo.Returns r ON r.OrderID=o.OrderID GROUP BY CustomerID HAVING COUNT(*)>2;
GO

-- ============================================================
-- QUESTION 104
-- ============================================================
WITH x AS (SELECT p.SupplierID,SUM(r.ReturnQty) ReturnsQty,SUM(od.Quantity) SoldQty FROM dbo.Products p JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID LEFT JOIN dbo.Returns r ON r.ProductID=p.ProductID GROUP BY p.SupplierID) SELECT *,100.0*ReturnsQty/NULLIF(SoldQty,0) ReturnRate FROM x ORDER BY ReturnRate DESC;
GO

-- ============================================================
-- QUESTION 105
-- ============================================================
WITH m AS (SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) M,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,COUNT(DISTINCT o.OrderID) Orders FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)) SELECT *,Revenue/NULLIF(Orders,0) AOV,LAG(Revenue) OVER(ORDER BY M) PrevRevenue FROM m;
GO

-- ============================================================
-- QUESTION 106
-- ============================================================
SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) MonthStart,COUNT(DISTINCT o.OrderID) Orders,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,SUM(od.Quantity*(od.UnitPrice- p.UnitCost)*(1-od.DiscountPct/100.0)) Profit,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0))/NULLIF(COUNT(DISTINCT o.OrderID),0) AOV FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID WHERE o.OrderStatus<>'Cancelled' GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1);
GO

-- ============================================================
-- QUESTION 107
-- ============================================================
WITH calc AS (SELECT o.OrderID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) OrderAmount FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY o.OrderID) SELECT c.OrderID,c.OrderAmount,p.Amount FROM calc c JOIN dbo.Payments p ON p.OrderID=c.OrderID WHERE ABS(c.OrderAmount-p.Amount)>1;
GO

-- ============================================================
-- QUESTION 108
-- ============================================================
SELECT s.*,DATEDIFF(DAY,s.ShipmentDate,s.DeliveryDate) DeliveryDays FROM dbo.Shipments s WHERE s.DeliveryDate IS NOT NULL AND DATEDIFF(DAY,s.ShipmentDate,s.DeliveryDate)>7;
GO

-- ============================================================
-- QUESTION 109
-- ============================================================
WITH latest AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY StoreID,ProductID ORDER BY InventoryDate DESC) rn FROM dbo.Inventory) SELECT l.StoreID,l.ProductID,l.ClosingStock,p.ReorderLevel FROM latest l JOIN dbo.Products p ON p.ProductID=l.ProductID WHERE l.rn=1 AND l.ClosingStock<=p.ReorderLevel;
GO

-- ============================================================
-- QUESTION 110
-- ============================================================
WITH x AS (SELECT CustomerID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY CustomerID), r AS (SELECT *,NTILE(20) OVER(ORDER BY Revenue DESC) Bucket FROM x) SELECT * FROM r WHERE Bucket=1;
GO

-- ============================================================
-- QUESTION 111
-- ============================================================
SELECT c.CustomerID,c.CustomerName FROM dbo.Customers c WHERE EXISTS (SELECT 1 FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID JOIN dbo.Categories cat ON cat.CategoryID=p.CategoryID WHERE o.CustomerID=c.CustomerID AND cat.CategoryName='Electronics') AND NOT EXISTS (SELECT 1 FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID JOIN dbo.Categories cat ON cat.CategoryID=p.CategoryID WHERE o.CustomerID=c.CustomerID AND cat.CategoryName='Accessories');
GO

-- ============================================================
-- QUESTION 112
-- ============================================================
WITH x AS (SELECT s.Region,s.StoreID,s.StoreName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Stores s JOIN dbo.Orders o ON o.StoreID=s.StoreID JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY s.Region,s.StoreID,s.StoreName),r AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY Region ORDER BY Revenue DESC) rn FROM x) SELECT * FROM r WHERE rn=1;
GO

-- ============================================================
-- QUESTION 113
-- ============================================================
SELECT YEAR(ReturnDate) Y,MONTH(ReturnDate) M,ReturnReason,SUM(RefundAmount) RefundAmount FROM dbo.Returns GROUP BY YEAR(ReturnDate),MONTH(ReturnDate),ReturnReason ORDER BY Y,M;
GO

-- ============================================================
-- QUESTION 114
-- ============================================================
SELECT s.SupplierID,s.SupplierName,s.SupplierRating,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Suppliers s JOIN dbo.Products p ON p.SupplierID=s.SupplierID JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID WHERE s.SupplierRating<3.5 GROUP BY s.SupplierID,s.SupplierName,s.SupplierRating ORDER BY Revenue DESC;
GO

-- ============================================================
-- QUESTION 115
-- ============================================================
WITH m AS (SELECT p.ProductID,p.ProductName,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) M,SUM(od.Quantity) Qty FROM dbo.Products p JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID JOIN dbo.Orders o ON o.OrderID=od.OrderID WHERE p.ProductLaunchDate<DATEADD(MONTH,-12,GETDATE()) GROUP BY p.ProductID,p.ProductName,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)), x AS (SELECT *,LAG(Qty) OVER(PARTITION BY ProductID ORDER BY M) PrevQty FROM m) SELECT * FROM x WHERE Qty<PrevQty;
GO

-- ============================================================
-- QUESTION 116
-- ============================================================
SELECT o.CustomerID FROM dbo.Orders o JOIN dbo.Returns r ON r.OrderID=o.OrderID WHERE r.ReturnDate>=DATEADD(MONTH,-12,CAST(GETDATE() AS DATE)) GROUP BY o.CustomerID HAVING COUNT(*)>3;
GO

-- ============================================================
-- QUESTION 117
-- ============================================================
SELECT Carrier,COUNT(*) Shipments,SUM(CASE WHEN DATEDIFF(DAY,ShipmentDate,DeliveryDate)<=7 THEN 1 ELSE 0 END) WithinSLA,100.0*SUM(CASE WHEN DATEDIFF(DAY,ShipmentDate,DeliveryDate)<=7 THEN 1 ELSE 0 END)/COUNT(*) SLAPct FROM dbo.Shipments WHERE DeliveryDate IS NOT NULL GROUP BY Carrier;
GO

-- ============================================================
-- QUESTION 118
-- ============================================================
SELECT s.StoreID,s.StoreName,100.0*SUM(CASE WHEN o.OrderStatus='Cancelled' THEN 1 ELSE 0 END)/COUNT(*) CancellationPct FROM dbo.Stores s JOIN dbo.Orders o ON o.StoreID=s.StoreID GROUP BY s.StoreID,s.StoreName ORDER BY CancellationPct DESC;
GO

-- ============================================================
-- QUESTION 119
-- ============================================================
SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) MonthStart,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,SUM(od.Quantity*(od.UnitPrice-p.UnitCost)*(1-od.DiscountPct/100.0)) GrossProfit FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID WHERE o.OrderStatus<>'Cancelled' GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1);
GO

-- ============================================================
-- QUESTION 120
-- ============================================================
WITH x AS (SELECT p.ProductID,p.ProductName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,SUM(od.Quantity*(od.UnitPrice-p.UnitCost)*(1-od.DiscountPct/100.0)) Profit FROM dbo.Products p JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID GROUP BY p.ProductID,p.ProductName) SELECT * FROM x WHERE Revenue>(SELECT AVG(Revenue) FROM x) AND Profit<(SELECT AVG(Profit) FROM x);
GO

-- ============================================================
-- QUESTION 121
-- ============================================================
-- Combine store revenue with repeat-customer rate; adjust thresholds to business policy.
WITH rev AS (SELECT StoreID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY StoreID), cust AS (SELECT StoreID,CustomerID,COUNT(*) Orders FROM dbo.Orders GROUP BY StoreID,CustomerID), rep AS (SELECT StoreID,100.0*SUM(CASE WHEN Orders>1 THEN 1 ELSE 0 END)/COUNT(*) RepeatPct FROM cust GROUP BY StoreID) SELECT r.StoreID,r.Revenue,rep.RepeatPct FROM rev r JOIN rep ON rep.StoreID=r.StoreID ORDER BY r.Revenue DESC,rep.RepeatPct;
GO

-- ============================================================
-- QUESTION 122
-- ============================================================
WITH x AS (SELECT o.CustomerID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,MAX(o.OrderDate) LastOrder FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY o.CustomerID), r AS (SELECT *,NTILE(10) OVER(ORDER BY Revenue DESC) Decile FROM x) SELECT * FROM r WHERE Decile=1 AND LastOrder<DATEADD(DAY,-180,GETDATE());
GO

-- ============================================================
-- QUESTION 123
-- ============================================================
SELECT c.CustomerID,c.CustomerName,MAX(o.OrderDate) LastOrder FROM dbo.Customers c JOIN dbo.Orders o ON o.CustomerID=c.CustomerID GROUP BY c.CustomerID,c.CustomerName HAVING MAX(o.OrderDate)<DATEADD(DAY,-180,GETDATE());
GO

-- ============================================================
-- QUESTION 124
-- ============================================================
SELECT p.ProductID,p.ProductName,COUNT(r.ReturnID) ReturnCount FROM dbo.Products p JOIN dbo.Returns r ON r.ProductID=p.ProductID GROUP BY p.ProductID,p.ProductName ORDER BY ReturnCount DESC;
GO

-- ============================================================
-- QUESTION 125
-- ============================================================
SELECT a.CustomerID,a.OrderID Order1,b.OrderID Order2,a.OrderDate OrderTime1,b.OrderDate OrderTime2 FROM dbo.Orders a JOIN dbo.Orders b ON b.CustomerID=a.CustomerID AND b.OrderID>a.OrderID AND DATEDIFF(MINUTE,a.OrderDate,b.OrderDate)<=5;
GO

-- ============================================================
-- QUESTION 126
-- ============================================================
SELECT p1.PaymentID,p2.PaymentID,p1.OrderID,p2.OrderID,p1.Amount FROM dbo.Payments p1 JOIN dbo.Payments p2 ON p2.PaymentID>p1.PaymentID AND p2.Amount=p1.Amount AND ABS(DATEDIFF(MINUTE,p1.PaymentDate,p2.PaymentDate))<=5;
GO

-- ============================================================
-- QUESTION 127
-- ============================================================
WITH x AS (SELECT o.*,LAG(ShippingCity) OVER(PARTITION BY CustomerID ORDER BY OrderDate,OrderID) PrevCity,LAG(ShippingState) OVER(PARTITION BY CustomerID ORDER BY OrderDate,OrderID) PrevState FROM dbo.Orders o) SELECT * FROM x WHERE PrevCity<>ShippingCity OR PrevState<>ShippingState;
GO

-- ============================================================
-- QUESTION 128
-- ============================================================
SELECT TOP (1) DATENAME(WEEKDAY,OrderDate) DayName,COUNT(*) Orders FROM dbo.Orders GROUP BY DATENAME(WEEKDAY,OrderDate),DATEPART(WEEKDAY,OrderDate) ORDER BY COUNT(*) DESC;
GO

-- ============================================================
-- QUESTION 129
-- ============================================================
SELECT DATEPART(HOUR,OrderDate) OrderHour,COUNT(*) Orders FROM dbo.Orders GROUP BY DATEPART(HOUR,OrderDate) ORDER BY Orders DESC;
GO

-- ============================================================
-- QUESTION 130
-- ============================================================
SELECT c.CategoryName,MONTH(o.OrderDate) MonthNo,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Categories c JOIN dbo.Products p ON p.CategoryID=c.CategoryID JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID JOIN dbo.Orders o ON o.OrderID=od.OrderID GROUP BY c.CategoryName,MONTH(o.OrderDate) ORDER BY c.CategoryName,MonthNo;
GO

-- ============================================================
-- QUESTION 131
-- ============================================================
WITH x AS (SELECT o.CustomerID,p.ProductID,p.ProductName,SUM(od.Quantity) Qty FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID GROUP BY o.CustomerID,p.ProductID,p.ProductName),r AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY Qty DESC) rn FROM x) SELECT * FROM r WHERE rn=1;
GO

-- ============================================================
-- QUESTION 132
-- ============================================================
WITH y AS (SELECT o.CustomerID,YEAR(o.OrderDate) Y,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY o.CustomerID,YEAR(o.OrderDate)), x AS (SELECT CustomerID,MAX(CASE WHEN Y=2025 THEN Revenue END) CurrentYear,MAX(CASE WHEN Y=2024 THEN Revenue END) PreviousYear FROM y GROUP BY CustomerID) SELECT * FROM x WHERE CurrentYear<PreviousYear;
GO

-- ============================================================
-- QUESTION 133
-- ============================================================
WITH y AS (SELECT o.StoreID,YEAR(o.OrderDate) Y,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY o.StoreID,YEAR(o.OrderDate)), x AS (SELECT StoreID,MAX(CASE WHEN Y=2025 THEN Revenue END) CurrentYear,MAX(CASE WHEN Y=2024 THEN Revenue END) PreviousYear FROM y GROUP BY StoreID) SELECT * FROM x WHERE CurrentYear<PreviousYear;
GO

-- ============================================================
-- QUESTION 134
-- ============================================================
SELECT p.ProductID,p.ProductName FROM dbo.Products p WHERE p.IsActive=1 AND NOT EXISTS (SELECT 1 FROM dbo.OrderDetails od JOIN dbo.Orders o ON o.OrderID=od.OrderID WHERE od.ProductID=p.ProductID AND o.OrderDate>=DATEADD(DAY,-90,GETDATE()));
GO

-- ============================================================
-- QUESTION 135
-- ============================================================
WITH latest AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY StoreID,ProductID ORDER BY InventoryDate DESC) rn FROM dbo.Inventory), sales AS (SELECT StoreID,ProductID,SUM(SoldQty) SoldQty FROM dbo.Inventory WHERE InventoryDate>=DATEADD(MONTH,-3,GETDATE()) GROUP BY StoreID,ProductID) SELECT l.StoreID,l.ProductID,l.ClosingStock,COALESCE(s.SoldQty,0) SoldQty FROM latest l LEFT JOIN sales s ON s.StoreID=l.StoreID AND s.ProductID=l.ProductID WHERE l.rn=1 AND l.ClosingStock>100 AND COALESCE(s.SoldQty,0)<10;
GO

-- ============================================================
-- QUESTION 136
-- ============================================================
WITH latest AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY StoreID,ProductID ORDER BY InventoryDate DESC) rn FROM dbo.Inventory), sales AS (SELECT StoreID,ProductID,SUM(SoldQty)/90.0 DailySales FROM dbo.Inventory WHERE InventoryDate>=DATEADD(DAY,-90,GETDATE()) GROUP BY StoreID,ProductID) SELECT l.StoreID,l.ProductID,l.ClosingStock,s.DailySales,l.ClosingStock/NULLIF(s.DailySales,0) DaysOfInventory FROM latest l JOIN sales s ON s.StoreID=l.StoreID AND s.ProductID=l.ProductID WHERE l.rn=1;
GO

-- ============================================================
-- QUESTION 137
-- ============================================================
WITH x AS (SELECT CustomerID,MAX(OrderDate) LastOrder,COUNT(*) Orders FROM dbo.Orders GROUP BY CustomerID) SELECT *,DATEDIFF(DAY,LastOrder,GETDATE()) DaysSinceLastOrder,CASE WHEN DATEDIFF(DAY,LastOrder,GETDATE())>180 AND Orders>=5 THEN 'High Churn Risk' WHEN DATEDIFF(DAY,LastOrder,GETDATE())>90 THEN 'Medium Churn Risk' ELSE 'Low Churn Risk' END ChurnRisk FROM x;
GO

-- ============================================================
-- QUESTION 138
-- ============================================================
WITH x AS (SELECT o.CustomerID,DATEDIFF(DAY,MAX(o.OrderDate),GETDATE()) Recency,COUNT(DISTINCT o.OrderID) Frequency,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Monetary FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY o.CustomerID), s AS (SELECT *,NTILE(5) OVER(ORDER BY Recency DESC) R_Score,NTILE(5) OVER(ORDER BY Frequency) F_Score,NTILE(5) OVER(ORDER BY Monetary) M_Score FROM x) SELECT *,CONCAT(R_Score,F_Score,M_Score) RFM_Code FROM s;
GO

-- ============================================================
-- QUESTION 139
-- ============================================================
WITH x AS (SELECT p.ProductID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Products p JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID GROUP BY p.ProductID), y AS (SELECT *,SUM(Revenue) OVER(ORDER BY Revenue DESC) CumRevenue,SUM(Revenue) OVER() TotalRevenue FROM x) SELECT *,CASE WHEN CumRevenue<=TotalRevenue*.80 THEN 'A' WHEN CumRevenue<=TotalRevenue*.95 THEN 'B' ELSE 'C' END ABCClass FROM y;
GO

-- ============================================================
-- QUESTION 140
-- ============================================================
WITH x AS (SELECT s.StoreID,s.StoreName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,AVG(CASE WHEN DATEDIFF(DAY,sh.ShipmentDate,sh.DeliveryDate)<=7 THEN 1.0 ELSE 0 END) SLA,AVG(CASE WHEN o.OrderStatus='Cancelled' THEN 1.0 ELSE 0 END) Cancellation FROM dbo.Stores s JOIN dbo.Orders o ON o.StoreID=s.StoreID JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID LEFT JOIN dbo.Shipments sh ON sh.OrderID=o.OrderID GROUP BY s.StoreID,s.StoreName) SELECT *,CASE WHEN Revenue>=10000000 AND SLA>=.90 AND Cancellation<.05 THEN 'A' WHEN Revenue>=5000000 THEN 'B' ELSE 'C' END Grade FROM x;
GO

-- ============================================================
-- QUESTION 141
-- ============================================================
SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) MonthStart,COUNT(DISTINCT o.OrderID) Orders,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,SUM(od.Quantity*(od.UnitPrice-p.UnitCost)*(1-od.DiscountPct/100.0)) GrossProfit,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0))/COUNT(DISTINCT o.OrderID) AOV,100.0*SUM(CASE WHEN o.OrderStatus='Cancelled' THEN 1 ELSE 0 END)/COUNT(DISTINCT o.OrderID) CancellationRate FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1);
GO

-- ============================================================
-- QUESTION 142
-- ============================================================
WITH d AS (SELECT CAST(o.OrderDate AS DATE) OrderDate,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID GROUP BY CAST(o.OrderDate AS DATE)), s AS (SELECT AVG(Revenue) AvgRevenue,STDEV(Revenue) StdRevenue FROM d) SELECT d.*,CASE WHEN ABS(d.Revenue-s.AvgRevenue)>2*s.StdRevenue THEN 'ANOMALY' ELSE 'NORMAL' END Flag FROM d CROSS JOIN s;
GO

-- ============================================================
-- QUESTION 143
-- ============================================================
SELECT TOP (10) c.CustomerID,c.CustomerName,COUNT(*) DelayedShipments FROM dbo.Customers c JOIN dbo.Orders o ON o.CustomerID=c.CustomerID JOIN dbo.Shipments s ON s.OrderID=o.OrderID WHERE DATEDIFF(DAY,s.ShipmentDate,s.DeliveryDate)>7 GROUP BY c.CustomerID,c.CustomerName ORDER BY DelayedShipments DESC;
GO

-- ============================================================
-- QUESTION 144
-- ============================================================
WITH m AS (SELECT p.CategoryID,DATEFROMPARTS(YEAR(r.ReturnDate),MONTH(r.ReturnDate),1) M,COUNT(*) Returns FROM dbo.Returns r JOIN dbo.Products p ON p.ProductID=r.ProductID GROUP BY p.CategoryID,DATEFROMPARTS(YEAR(r.ReturnDate),MONTH(r.ReturnDate),1)), x AS (SELECT *,LAG(Returns) OVER(PARTITION BY CategoryID ORDER BY M) Prev1,LAG(Returns,2) OVER(PARTITION BY CategoryID ORDER BY M) Prev2 FROM m) SELECT * FROM x WHERE Returns>Prev1 AND Prev1>Prev2;
GO

-- ============================================================
-- QUESTION 145
-- ============================================================
-- Example category-based recommendation: categories purchased by customer, then unpurchased products in those categories.
DECLARE @CustomerID INT=1;
WITH bought AS (SELECT DISTINCT p.CategoryID FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID WHERE o.CustomerID=@CustomerID), purchased AS (SELECT DISTINCT od.ProductID FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.CustomerID=@CustomerID) SELECT TOP (20) p.ProductID,p.ProductName,p.CategoryID FROM dbo.Products p JOIN bought b ON b.CategoryID=p.CategoryID LEFT JOIN purchased x ON x.ProductID=p.ProductID WHERE x.ProductID IS NULL AND p.IsActive=1 ORDER BY p.CategoryID,p.ProductID;
GO

-- ============================================================
-- QUESTION 146
-- ============================================================
CREATE OR ALTER VIEW dbo.vw_MonthlySales AS SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) MonthStart,COUNT(DISTINCT o.OrderID) Orders,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1);
GO

-- ============================================================
-- QUESTION 147
-- ============================================================
CREATE OR ALTER VIEW dbo.vw_CustomerLifetimeValue AS SELECT o.CustomerID,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) LifetimeRevenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderStatus<>'Cancelled' GROUP BY o.CustomerID;
GO

-- ============================================================
-- QUESTION 148
-- ============================================================
CREATE OR ALTER PROCEDURE dbo.usp_SalesBetweenDates @FromDate DATE,@ToDate DATE AS BEGIN SET NOCOUNT ON; SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) MonthStart,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.OrderDate>=@FromDate AND o.OrderDate<DATEADD(DAY,1,@ToDate) AND o.OrderStatus<>'Cancelled' GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1); END;
GO

-- ============================================================
-- QUESTION 149
-- ============================================================
CREATE OR ALTER PROCEDURE dbo.usp_CustomerOrderHistory @CustomerID INT AS BEGIN SELECT o.*,od.ProductID,od.Quantity,od.UnitPrice,od.DiscountPct FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.CustomerID=@CustomerID ORDER BY o.OrderDate DESC; END;
GO

-- ============================================================
-- QUESTION 150
-- ============================================================
CREATE OR ALTER PROCEDURE dbo.usp_LowStock AS BEGIN WITH x AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY StoreID,ProductID ORDER BY InventoryDate DESC) rn FROM dbo.Inventory) SELECT x.StoreID,x.ProductID,x.ClosingStock,p.ReorderLevel FROM x JOIN dbo.Products p ON p.ProductID=x.ProductID WHERE rn=1 AND ClosingStock<=ReorderLevel; END;
GO

-- ============================================================
-- QUESTION 151
-- ============================================================
CREATE OR ALTER PROCEDURE dbo.usp_TopProductsByCategory @N INT=3 AS BEGIN WITH x AS (SELECT p.CategoryID,p.ProductID,p.ProductName,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue FROM dbo.Products p JOIN dbo.OrderDetails od ON od.ProductID=p.ProductID GROUP BY p.CategoryID,p.ProductID,p.ProductName),r AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY CategoryID ORDER BY Revenue DESC) rn FROM x) SELECT * FROM r WHERE rn<=@N; END;
GO

-- ============================================================
-- QUESTION 152
-- ============================================================
CREATE OR ALTER FUNCTION dbo.ufn_CustomerLifetimeRevenue(@CustomerID INT) RETURNS DECIMAL(18,2) AS BEGIN DECLARE @v DECIMAL(18,2); SELECT @v=SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID WHERE o.CustomerID=@CustomerID AND o.OrderStatus<>'Cancelled'; RETURN COALESCE(@v,0); END;
GO

-- ============================================================
-- QUESTION 153
-- ============================================================
CREATE OR ALTER FUNCTION dbo.ufn_CustomerSegment(@Revenue DECIMAL(18,2)) RETURNS VARCHAR(20) AS BEGIN RETURN CASE WHEN @Revenue>=1000000 THEN 'Platinum' WHEN @Revenue>=500000 THEN 'Gold' WHEN @Revenue>=100000 THEN 'Silver' ELSE 'Bronze' END; END;
GO

-- ============================================================
-- QUESTION 154
-- ============================================================
CREATE TABLE dbo.ProductPriceAudit(AuditID BIGINT IDENTITY PRIMARY KEY,ProductID INT,OldPrice DECIMAL(12,2),NewPrice DECIMAL(12,2),ChangedAt DATETIME2 DEFAULT SYSDATETIME());
GO
CREATE OR ALTER TRIGGER dbo.trg_ProductPriceAudit ON dbo.Products AFTER UPDATE AS BEGIN INSERT dbo.ProductPriceAudit(ProductID,OldPrice,NewPrice) SELECT i.ProductID,d.UnitPrice,i.UnitPrice FROM inserted i JOIN deleted d ON d.ProductID=i.ProductID WHERE i.UnitPrice<>d.UnitPrice; END;
GO

-- ============================================================
-- QUESTION 155
-- ============================================================
CREATE TABLE dbo.OrderStatusAudit(AuditID BIGINT IDENTITY PRIMARY KEY,OrderID BIGINT,OldStatus VARCHAR(30),NewStatus VARCHAR(30),ChangedAt DATETIME2 DEFAULT SYSDATETIME());
GO
CREATE OR ALTER TRIGGER dbo.trg_OrderStatusAudit ON dbo.Orders AFTER UPDATE AS BEGIN INSERT dbo.OrderStatusAudit(OrderID,OldStatus,NewStatus) SELECT i.OrderID,d.OrderStatus,i.OrderStatus FROM inserted i JOIN deleted d ON d.OrderID=i.OrderID WHERE i.OrderStatus<>d.OrderStatus; END;
GO

-- ============================================================
-- QUESTION 156
-- ============================================================
BEGIN TRAN;
BEGIN TRY
    INSERT dbo.Orders(CustomerID,StoreID,EmployeeID,OrderDate,OrderStatus,PaymentStatus,ShippingCity,ShippingState) VALUES (1,1,1,SYSDATETIME(),'Completed','Paid','Mumbai','Maharashtra');
    DECLARE @OrderID BIGINT=SCOPE_IDENTITY();
    INSERT dbo.Payments(OrderID,PaymentDate,PaymentMethod,Amount,PaymentStatus,TransactionReference) VALUES(@OrderID,SYSDATETIME(),'UPI',1000,'Paid',CONCAT('MANUAL-',@OrderID));
    COMMIT;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT>0 ROLLBACK; THROW;
END CATCH;
GO

-- ============================================================
-- QUESTION 157
-- ============================================================
BEGIN TRY
 BEGIN TRAN;
 -- business changes
 COMMIT;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0 ROLLBACK;
 SELECT ERROR_NUMBER() ErrorNumber,ERROR_MESSAGE() ErrorMessage;
 THROW;
END CATCH;
GO

-- ============================================================
-- QUESTION 158
-- ============================================================
CREATE INDEX IX_Orders_Customer_OrderDate ON dbo.Orders(CustomerID,OrderDate) INCLUDE(OrderStatus,PaymentStatus);
CREATE INDEX IX_OrderDetails_Product_Order ON dbo.OrderDetails(ProductID,OrderID) INCLUDE(Quantity,UnitPrice,DiscountPct);
CREATE INDEX IX_Orders_Store_OrderDate ON dbo.Orders(StoreID,OrderDate) INCLUDE(OrderStatus);
CREATE INDEX IX_Inventory_Store_Product_Date ON dbo.Inventory(StoreID,ProductID,InventoryDate DESC) INCLUDE(ClosingStock,SoldQty);
GO

-- ============================================================
-- QUESTION 159
-- ============================================================
SET STATISTICS IO, TIME ON;
-- Run a representative query before indexes, create indexes from Q158, then run the same query again.
SET STATISTICS IO, TIME OFF;
GO

-- ============================================================
-- QUESTION 160
-- ============================================================
-- In SSMS: Query > Include Actual Execution Plan (Ctrl+M), execute the query, then inspect scans, seeks, warnings and expensive operators.
-- Compare Estimated vs Actual Rows and look for key lookups, scans and spills.
GO

-- ============================================================
-- QUESTION 161
-- ============================================================
-- Pattern: replace a correlated MAX/COUNT subquery with a window function.
WITH x AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY OrderDate DESC,OrderID DESC) rn FROM dbo.Orders) SELECT * FROM x WHERE rn=1;
GO

-- ============================================================
-- QUESTION 162
-- ============================================================
-- Prefer set-based aggregation over row-by-row cursor processing.
SELECT CustomerID,COUNT(*) OrderCount,SUM(1) AS ProcessedRows FROM dbo.Orders GROUP BY CustomerID;
GO

-- ============================================================
-- QUESTION 163
-- ============================================================
-- Benchmark each approach with SET STATISTICS IO,TIME ON; choose based on actual execution plan, cardinality and reuse.
GO

-- ============================================================
-- QUESTION 164
-- ============================================================
-- Example diagnostic: SELECT * FROM dbo.Orders WHERE CustomerID='100';  -- bad if CustomerID is INT.
-- Correct: SELECT * FROM dbo.Orders WHERE CustomerID=100;
GO

-- ============================================================
-- QUESTION 165
-- ============================================================
-- Use the missing-index DMVs as recommendations only; validate workload, overlap, write cost and selectivity before creating an index.
GO

-- ============================================================
-- QUESTION 166
-- ============================================================
CREATE TABLE dbo.MonthlySalesSummary(MonthStart DATE PRIMARY KEY,Orders INT,Revenue DECIMAL(18,2),GrossProfit DECIMAL(18,2));
GO

-- ============================================================
-- QUESTION 167
-- ============================================================
CREATE OR ALTER PROCEDURE dbo.usp_RefreshMonthlySalesSummary AS BEGIN SET NOCOUNT ON; TRUNCATE TABLE dbo.MonthlySalesSummary; INSERT dbo.MonthlySalesSummary SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1),COUNT(DISTINCT o.OrderID),SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)),SUM(od.Quantity*(od.UnitPrice-p.UnitCost)*(1-od.DiscountPct/100.0)) FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID JOIN dbo.Products p ON p.ProductID=od.ProductID WHERE o.OrderStatus<>'Cancelled' GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1); END;
GO

-- ============================================================
-- QUESTION 168
-- ============================================================
-- SQL Agent design: create a job -> daily schedule -> step executes EXEC dbo.usp_RefreshMonthlySalesSummary -> log success/failure -> alert on failure.
GO

-- ============================================================
-- QUESTION 169
-- ============================================================
-- Exercise: compare READ COMMITTED, REPEATABLE READ and SERIALIZABLE using two SSMS windows and concurrent transactions. Observe blocking/locks with sys.dm_exec_requests and sys.dm_tran_locks.
GO

-- ============================================================
-- QUESTION 170
-- ============================================================
-- Capture baseline IO/time + actual plan; document top operators; add/revise indexes; rewrite query; capture new metrics; report logical reads, CPU, elapsed time and plan changes.
GO

-- ============================================================
-- QUESTION 171
-- ============================================================
WITH Sales AS (
SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) MonthStart,
COUNT(DISTINCT o.OrderID) Orders,
SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,
SUM(od.Quantity*(od.UnitPrice-p.UnitCost)*(1-od.DiscountPct/100.0)) GrossProfit
FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID
JOIN dbo.Products p ON p.ProductID=od.ProductID
WHERE o.OrderStatus<>'Cancelled'
GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1)
)
SELECT *,Revenue/NULLIF(Orders,0) AOV FROM Sales;
GO

-- ============================================================
-- QUESTION 172
-- ============================================================
DECLARE @CustomerID INT=1;
SELECT c.CustomerID,c.CustomerName,c.Email,MIN(o.OrderDate) FirstOrder,MAX(o.OrderDate) LastOrder,
COUNT(DISTINCT o.OrderID) Orders,SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,
AVG(x.OrderValue) AOV,DATEDIFF(DAY,MAX(o.OrderDate),GETDATE()) DaysSinceLastPurchase
FROM dbo.Customers c JOIN dbo.Orders o ON o.CustomerID=c.CustomerID
JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID
JOIN (SELECT OrderID,SUM(Quantity*UnitPrice*(1-DiscountPct/100.0)) OrderValue FROM dbo.OrderDetails GROUP BY OrderID) x ON x.OrderID=o.OrderID
WHERE c.CustomerID=@CustomerID GROUP BY c.CustomerID,c.CustomerName,c.Email;
GO

-- ============================================================
-- QUESTION 173
-- ============================================================
WITH latest AS (
SELECT *,ROW_NUMBER() OVER(PARTITION BY StoreID,ProductID ORDER BY InventoryDate DESC) rn
FROM dbo.Inventory
), sales AS (
SELECT StoreID,ProductID,SUM(SoldQty)/90.0 DailySales
FROM dbo.Inventory WHERE InventoryDate>=DATEADD(DAY,-90,CAST(GETDATE() AS DATE))
GROUP BY StoreID,ProductID
)
SELECT l.StoreID,l.ProductID,l.ClosingStock,s.DailySales,
l.ClosingStock/NULLIF(s.DailySales,0) DaysOfInventory,
CASE WHEN l.ClosingStock<=0 THEN 'OUT OF STOCK'
WHEN l.ClosingStock/NULLIF(s.DailySales,0)<p.ReorderLevel THEN 'REORDER'
ELSE 'OK' END Risk
FROM latest l JOIN sales s ON s.StoreID=l.StoreID AND s.ProductID=l.ProductID
JOIN dbo.Products p ON p.ProductID=l.ProductID WHERE l.rn=1;
GO

-- ============================================================
-- QUESTION 174
-- ============================================================
SELECT 'Payment mismatch' ExceptionType,o.OrderID
FROM dbo.Orders o JOIN dbo.Payments p ON p.OrderID=o.OrderID
JOIN (SELECT OrderID,SUM(Quantity*UnitPrice*(1-DiscountPct/100.0)) Amount FROM dbo.OrderDetails GROUP BY OrderID) x ON x.OrderID=o.OrderID
WHERE ABS(x.Amount-p.Amount)>1
UNION ALL
SELECT 'Delayed shipment',OrderID FROM dbo.Shipments WHERE DeliveryDate IS NOT NULL AND DATEDIFF(DAY,ShipmentDate,DeliveryDate)>7
UNION ALL
SELECT 'High return product',ProductID FROM dbo.Returns GROUP BY ProductID HAVING COUNT(*)>=5
UNION ALL
SELECT 'Inactive VIP customer',c.CustomerID FROM dbo.Customers c WHERE c.CustomerSegment='VIP' AND NOT EXISTS (SELECT 1 FROM dbo.Orders o WHERE o.CustomerID=c.CustomerID AND o.OrderDate>=DATEADD(DAY,-180,GETDATE()));
GO

-- ============================================================
-- QUESTION 175
-- ============================================================
FINAL CAPSTONE – recommended architecture:
1) Build reusable views/CTEs for Sales, Customers, Inventory and Logistics.
2) Create KPI queries for Revenue, Gross Profit, AOV, retention, returns,
   cancellation and delivery SLA.
3) Add data-quality exception queries for payment, shipment and inventory issues.
4) Add indexes only after measuring actual execution plans.
5) Create stored procedures for date-range reporting and operational alerts.
6) Document assumptions, KPI definitions, performance before/after and
   business recommendations.

Example starting point:
SELECT DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) MonthStart,
COUNT(DISTINCT o.OrderID) Orders,
SUM(od.Quantity*od.UnitPrice*(1-od.DiscountPct/100.0)) Revenue,
SUM(od.Quantity*(od.UnitPrice-p.UnitCost)*(1-od.DiscountPct/100.0)) GrossProfit
FROM dbo.Orders o JOIN dbo.OrderDetails od ON od.OrderID=o.OrderID
JOIN dbo.Products p ON p.ProductID=od.ProductID
WHERE o.OrderStatus<>'Cancelled'
GROUP BY DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1);
GO

