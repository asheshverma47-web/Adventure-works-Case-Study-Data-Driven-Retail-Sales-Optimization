import pandas as pd
from sqlalchemy import create_engine

# MySQL Connection
engine = create_engine(
    "mysql+pymysql://root:ashesh2708@localhost/adventureworks_dw"
)

# -------------------------
# Load Dimension Tables
# -------------------------

excel_dim = pd.ExcelFile("DimTables.xlsx")

dim_customer = pd.read_excel(excel_dim, sheet_name="DimCustomer")
dim_employee = pd.read_excel(excel_dim, sheet_name="DimEmployee")
dim_geography = pd.read_excel(excel_dim, sheet_name="DimGeography")
dim_product = pd.read_excel(excel_dim, sheet_name="DimProduct")
dim_reseller = pd.read_excel(excel_dim, sheet_name="DimReseller")
dim_salesterritory = pd.read_excel(excel_dim, sheet_name="DimSalesTerritory")

# Rename column to match MySQL table
if 'Firstpurchasedate' in dim_customer.columns:
    dim_customer.rename(
        columns={'Firstpurchasedate': 'FirstPurchaseDate'},
        inplace=True
    )

# -------------------------
# Load Fact Tables
# -------------------------

fact_internet = pd.read_excel(
    "FactInternetSales.xlsx",
    sheet_name="FactInternetSales"
)

fact_reseller = pd.read_excel(
    "FactResellerSales.xlsx",
    sheet_name="FactResellerSales"
)

# -------------------------
# Insert Data Into MySQL
# -------------------------

dim_customer.to_sql(
    "DimCustomer",
    con=engine,
    if_exists="append",
    index=False
)

dim_employee.to_sql(
    "DimEmployee",
    con=engine,
    if_exists="append",
    index=False
)

dim_geography.to_sql(
    "DimGeography",
    con=engine,
    if_exists="append",
    index=False
)

dim_product.to_sql(
    "DimProduct",
    con=engine,
    if_exists="append",
    index=False
)

dim_reseller.to_sql(
    "DimReseller",
    con=engine,
    if_exists="append",
    index=False
)

dim_salesterritory.to_sql(
    "DimSalesTerritory",
    con=engine,
    if_exists="append",
    index=False
)

fact_internet.to_sql(
    "FactInternetSales",
    con=engine,
    if_exists="append",
    index=False
)

fact_reseller.to_sql(
    "FactResellerSales",
    con=engine,
    if_exists="append",
    index=False
)

print("Data Loaded Successfully!")