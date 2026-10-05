-- =========================
-- Fact Tables
-- =========================

CREATE TABLE FactInternetSales (
    SalesID INT AUTO_INCREMENT PRIMARY KEY,
    ProductKey INT,
    CustomerKey INT,
    SalesTerritoryKey INT,
    SalesOrderNumber VARCHAR(50),
    SalesOrderLineNumber INT,
    DiscountAmount DECIMAL(12,2),
    TotalProductCost DECIMAL(12,2),
    SalesAmount DECIMAL(12,2),
    Freight DECIMAL(12,2),
    CarrierTrackingNumber VARCHAR(100),
    OrderDate DATE,
    DueDate DATE,
    ShipDate DATE
);

CREATE TABLE FactResellerSales (
    SalesID INT AUTO_INCREMENT PRIMARY KEY,
    ProductKey INT,
    ResellerKey INT,
    EmployeeKey INT,
    SalesTerritoryKey INT,
    SalesOrderNumber VARCHAR(50),
    SalesOrderLineNumber INT,
    DiscountAmount DECIMAL(12,2),
    TotalProductCost DECIMAL(12,2),
    SalesAmount DECIMAL(12,2),
    Freight DECIMAL(12,2),
    CarrierTrackingNumber VARCHAR(100),
    OrderDate DATE,
    DueDate DATE,
    ShipDate DATE
);