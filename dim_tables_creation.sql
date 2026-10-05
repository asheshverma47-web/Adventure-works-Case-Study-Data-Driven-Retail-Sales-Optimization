USE adventureworks_dw;

-- =========================
-- Dimension Tables
-- =========================

CREATE TABLE DimCustomer (
    CustomerKey INT PRIMARY KEY,
    GeographyKey INT,
    CustomerName VARCHAR(255),
    BirthDate DATE,
    MaritalStatus CHAR(1),
    Gender CHAR(1),
    EmailAddress VARCHAR(255),
    YearlyIncome DECIMAL(12,2),
    Education VARCHAR(100),
    Occupation VARCHAR(100),
    HouseOwenerFlag VARCHAR(10),
    Address VARCHAR(255),
    FirstPurchaseDate DATE
);

CREATE TABLE DimEmployee (
    EmployeeKey INT PRIMARY KEY,
    ParentEmployeeKey INT,
    SalesTerritoryKey INT,
    EmployeeName VARCHAR(255),
    Title VARCHAR(255),
    EmailAddress VARCHAR(255),
    DepartmentName VARCHAR(255),
    HireDate DATE,
    BirthDate DATE
);

CREATE TABLE DimGeography (
    GeographyKey INT PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    PostalCode VARCHAR(20),
    SalesTerritoryKey INT
);

CREATE TABLE DimProduct (
    ProductKey INT PRIMARY KEY,
    ProductSubcategoryKey INT,
    Product VARCHAR(255),
    Color VARCHAR(50),
    Model VARCHAR(255),
    Subcategory VARCHAR(255),
    Category VARCHAR(255)
);

CREATE TABLE DimReseller (
    ResellerKey INT PRIMARY KEY,
    GeographyKey INT,
    BusinessType VARCHAR(100),
    ResellerName VARCHAR(255)
);

CREATE TABLE DimSalesTerritory (
    SalesTerritoryKey INT PRIMARY KEY,
    SalesTerritoryRegion VARCHAR(100),
    SalesTerritoryCountry VARCHAR(100),
    SalesTerritoryGroup VARCHAR(100)
);

