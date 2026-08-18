USE SQLTrainer_ECommerce;
GO

CREATE TABLE dbo.Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    Phone VARCHAR(20),
    City NVARCHAR(60),
    State NVARCHAR(60),
    Country NVARCHAR(60) DEFAULT 'India',
    CustomerSegment VARCHAR(30),
    RegistrationDate DATE,
    IsActive BIT DEFAULT 1
);

CREATE TABLE dbo.Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE dbo.Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName NVARCHAR(120) NOT NULL,
    City NVARCHAR(60),
    State NVARCHAR(60),
    SupplierRating DECIMAL(3,2)
);

CREATE TABLE dbo.Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(150) NOT NULL,
    CategoryID INT NOT NULL,
    SupplierID INT NOT NULL,
    UnitCost DECIMAL(12,2) NOT NULL,
    UnitPrice DECIMAL(12,2) NOT NULL,
    ReorderLevel INT NOT NULL,
    ProductLaunchDate DATE,
    IsActive BIT DEFAULT 1,
    CONSTRAINT FK_Products_Category FOREIGN KEY(CategoryID) REFERENCES dbo.Categories(CategoryID),
    CONSTRAINT FK_Products_Supplier FOREIGN KEY(SupplierID) REFERENCES dbo.Suppliers(SupplierID)
);

CREATE TABLE dbo.Stores (
    StoreID INT IDENTITY(1,1) PRIMARY KEY,
    StoreName NVARCHAR(100) NOT NULL,
    City NVARCHAR(60),
    State NVARCHAR(60),
    Region NVARCHAR(30),
    OpenDate DATE
);

CREATE TABLE dbo.Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName NVARCHAR(100) NOT NULL,
    StoreID INT,
    Department VARCHAR(50),
    HireDate DATE,
    ManagerID INT NULL,
    CONSTRAINT FK_Employees_Store FOREIGN KEY(StoreID) REFERENCES dbo.Stores(StoreID)
);

CREATE TABLE dbo.Orders (
    OrderID BIGINT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    StoreID INT NOT NULL,
    EmployeeID INT NULL,
    OrderDate DATETIME2 NOT NULL,
    OrderStatus VARCHAR(30) NOT NULL,
    PaymentStatus VARCHAR(30) NOT NULL,
    ShippingCity NVARCHAR(60),
    ShippingState NVARCHAR(60),
    CONSTRAINT FK_Orders_Customer FOREIGN KEY(CustomerID) REFERENCES dbo.Customers(CustomerID),
    CONSTRAINT FK_Orders_Store FOREIGN KEY(StoreID) REFERENCES dbo.Stores(StoreID),
    CONSTRAINT FK_Orders_Employee FOREIGN KEY(EmployeeID) REFERENCES dbo.Employees(EmployeeID)
);

CREATE TABLE dbo.OrderDetails (
    OrderDetailID BIGINT IDENTITY(1,1) PRIMARY KEY,
    OrderID BIGINT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(12,2) NOT NULL,
    DiscountPct DECIMAL(5,2) DEFAULT 0,
    CONSTRAINT FK_OrderDetails_Order FOREIGN KEY(OrderID) REFERENCES dbo.Orders(OrderID),
    CONSTRAINT FK_OrderDetails_Product FOREIGN KEY(ProductID) REFERENCES dbo.Products(ProductID)
);

CREATE TABLE dbo.Payments (
    PaymentID BIGINT IDENTITY(1,1) PRIMARY KEY,
    OrderID BIGINT NOT NULL,
    PaymentDate DATETIME2,
    PaymentMethod VARCHAR(30),
    Amount DECIMAL(12,2),
    PaymentStatus VARCHAR(30),
    TransactionReference VARCHAR(60),
    CONSTRAINT FK_Payments_Order FOREIGN KEY(OrderID) REFERENCES dbo.Orders(OrderID)
);

CREATE TABLE dbo.Shipments (
    ShipmentID BIGINT IDENTITY(1,1) PRIMARY KEY,
    OrderID BIGINT NOT NULL,
    ShipmentDate DATETIME2,
    DeliveryDate DATETIME2 NULL,
    Carrier VARCHAR(50),
    ShippingCost DECIMAL(10,2),
    ShipmentStatus VARCHAR(30),
    CONSTRAINT FK_Shipments_Order FOREIGN KEY(OrderID) REFERENCES dbo.Orders(OrderID)
);

CREATE TABLE dbo.Returns (
    ReturnID BIGINT IDENTITY(1,1) PRIMARY KEY,
    OrderID BIGINT NOT NULL,
    ProductID INT NOT NULL,
    ReturnDate DATE,
    ReturnQty INT,
    ReturnReason VARCHAR(100),
    RefundAmount DECIMAL(12,2),
    CONSTRAINT FK_Returns_Order FOREIGN KEY(OrderID) REFERENCES dbo.Orders(OrderID),
    CONSTRAINT FK_Returns_Product FOREIGN KEY(ProductID) REFERENCES dbo.Products(ProductID)
);

CREATE TABLE dbo.Inventory (
    InventoryID BIGINT IDENTITY(1,1) PRIMARY KEY,
    StoreID INT NOT NULL,
    ProductID INT NOT NULL,
    InventoryDate DATE NOT NULL,
    OpeningStock INT,
    ReceivedQty INT,
    SoldQty INT,
    ClosingStock INT,
    CONSTRAINT FK_Inventory_Store FOREIGN KEY(StoreID) REFERENCES dbo.Stores(StoreID),
    CONSTRAINT FK_Inventory_Product FOREIGN KEY(ProductID) REFERENCES dbo.Products(ProductID)
);
GO
