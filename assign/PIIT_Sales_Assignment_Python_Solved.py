# PIIT Sales Assignment - Complete Python/pandas Solution
import pandas as pd
import numpy as np

sales_data = [{'OrderID': 'O1001', 'Salesperson': 'Asha', 'Region': 'North', 'Product': 'Laptop', 'Category': 'Electronics', 'Units': 5, 'UnitPrice': 500, 'Revenue': 2500}, {'OrderID': 'O1002', 'Salesperson': 'Ravi', 'Region': 'South', 'Product': 'Mouse', 'Category': 'Accessories', 'Units': 20, 'UnitPrice': 20, 'Revenue': 400}, {'OrderID': 'O1003', 'Salesperson': 'Neha', 'Region': 'West', 'Product': 'Keyboard', 'Category': 'Accessories', 'Units': 15, 'UnitPrice': 30, 'Revenue': 450}, {'OrderID': 'O1004', 'Salesperson': 'Amit', 'Region': 'East', 'Product': 'Monitor', 'Category': 'Electronics', 'Units': 7, 'UnitPrice': 180, 'Revenue': 1260}, {'OrderID': 'O1005', 'Salesperson': 'Asha', 'Region': 'North', 'Product': 'Printer', 'Category': 'Office', 'Units': 3, 'UnitPrice': 220, 'Revenue': 660}, {'OrderID': 'O1006', 'Salesperson': 'Ravi', 'Region': 'West', 'Product': 'Laptop', 'Category': 'Electronics', 'Units': 2, 'UnitPrice': 500, 'Revenue': 1000}, {'OrderID': 'O1007', 'Salesperson': 'Neha', 'Region': 'South', 'Product': 'Chair', 'Category': 'Furniture', 'Units': 6, 'UnitPrice': 90, 'Revenue': 540}, {'OrderID': 'O1008', 'Salesperson': 'Amit', 'Region': 'East', 'Product': 'Desk', 'Category': 'Furniture', 'Units': 2, 'UnitPrice': 200, 'Revenue': 400}, {'OrderID': 'O1009', 'Salesperson': 'Asha', 'Region': 'West', 'Product': 'Mouse', 'Category': 'Accessories', 'Units': 25, 'UnitPrice': 20, 'Revenue': 500}, {'OrderID': 'O1010', 'Salesperson': 'Ravi', 'Region': 'North', 'Product': 'Monitor', 'Category': 'Electronics', 'Units': 4, 'UnitPrice': 180, 'Revenue': 720}, {'OrderID': 'O1011', 'Salesperson': 'Neha', 'Region': 'East', 'Product': 'Laptop', 'Category': 'Electronics', 'Units': 3, 'UnitPrice': 500, 'Revenue': 1500}, {'OrderID': 'O1012', 'Salesperson': 'Amit', 'Region': 'South', 'Product': 'Printer', 'Category': 'Office', 'Units': 4, 'UnitPrice': 220, 'Revenue': 880}, {'OrderID': 'O1013', 'Salesperson': 'Asha', 'Region': 'North', 'Product': 'Keyboard', 'Category': 'Accessories', 'Units': 10, 'UnitPrice': 30, 'Revenue': 300}, {'OrderID': 'O1014', 'Salesperson': 'Ravi', 'Region': 'East', 'Product': 'Desk', 'Category': 'Furniture', 'Units': 1, 'UnitPrice': 200, 'Revenue': 200}, {'OrderID': 'O1015', 'Salesperson': 'Neha', 'Region': 'West', 'Product': 'Chair', 'Category': 'Furniture', 'Units': 8, 'UnitPrice': 90, 'Revenue': 720}, {'OrderID': 'O1016', 'Salesperson': 'Amit', 'Region': 'North', 'Product': 'Laptop', 'Category': 'Electronics', 'Units': 6, 'UnitPrice': 500, 'Revenue': 3000}, {'OrderID': 'O1017', 'Salesperson': 'Asha', 'Region': 'South', 'Product': 'Monitor', 'Category': 'Electronics', 'Units': 5, 'UnitPrice': 180, 'Revenue': 900}, {'OrderID': 'O1018', 'Salesperson': 'Ravi', 'Region': 'West', 'Product': 'Printer', 'Category': 'Office', 'Units': 2, 'UnitPrice': 220, 'Revenue': 440}, {'OrderID': 'O1019', 'Salesperson': 'Neha', 'Region': 'East', 'Product': 'Mouse', 'Category': 'Accessories', 'Units': 18, 'UnitPrice': 20, 'Revenue': 360}, {'OrderID': 'O1020', 'Salesperson': 'Amit', 'Region': 'South', 'Product': 'Keyboard', 'Category': 'Accessories', 'Units': 14, 'UnitPrice': 30, 'Revenue': 420}, {'OrderID': 'O1021', 'Salesperson': 'Asha', 'Region': 'North', 'Product': 'Desk', 'Category': 'Furniture', 'Units': 2, 'UnitPrice': 200, 'Revenue': 400}, {'OrderID': 'O1022', 'Salesperson': 'Ravi', 'Region': 'West', 'Product': 'Chair', 'Category': 'Furniture', 'Units': 5, 'UnitPrice': 90, 'Revenue': 450}, {'OrderID': 'O1023', 'Salesperson': 'Neha', 'Region': 'South', 'Product': 'Laptop', 'Category': 'Electronics', 'Units': 4, 'UnitPrice': 500, 'Revenue': 2000}, {'OrderID': 'O1024', 'Salesperson': 'Amit', 'Region': 'East', 'Product': 'Monitor', 'Category': 'Electronics', 'Units': 9, 'UnitPrice': 180, 'Revenue': 1620}, {'OrderID': 'O1024', 'Salesperson': 'Amit', 'Region': 'East', 'Product': 'Monitor', 'Category': 'Electronics', 'Units': 9, 'UnitPrice': 180, 'Revenue': 1620}]
df = pd.DataFrame(sales_data)

# 1 Headers / freeze-row equivalent
headers = df.columns.tolist()

# 2 Sort Revenue descending
sorted_by_revenue = df.sort_values("Revenue", ascending=False).reset_index(drop=True)

# 3-9 Summary calculations
total_revenue = df["Revenue"].sum()
average_revenue = df["Revenue"].mean()
total_records = len(df)
numeric_revenue_cells = df["Revenue"].count()
north_orders = df["Region"].eq("North").sum()
electronics_revenue = df.loc[df["Category"].eq("Electronics"), "Revenue"].sum()
asha_average_units = df.loc[df["Salesperson"].eq("Asha"), "Units"].mean()

# 10-11 Conditional styling
high_revenue_style = df.style.map(lambda value: "background-color: lightgreen; font-weight: bold" if value > 1000 else "", subset=["Revenue"])
revenue_colour_scale = df.style.background_gradient(subset=["Revenue"], cmap="RdYlGn")

# 12 Duplicates
duplicate_orders = df[df["OrderID"].duplicated(keep=False)]

# 13 VLOOKUP equivalent
product_lookup = df[["Product", "Category"]].drop_duplicates().sort_values("Product").reset_index(drop=True)
product_to_category = product_lookup.set_index("Product")["Category"]
df_vlookup = df[["OrderID", "Product"]].copy()
df_vlookup["Category_from_lookup"] = df_vlookup["Product"].map(product_to_category)

# 14 XLOOKUP equivalent
df_xlookup = df[["OrderID", "Product"]].merge(product_lookup, on="Product", how="left", validate="many_to_one")

# 15 Pivot / QUERY equivalent
revenue_by_region = df.groupby("Region", as_index=False)["Revenue"].sum().sort_values("Revenue", ascending=False)

# 16 Sort Units descending
units_descending = df.sort_values(["Units", "Revenue"], ascending=[False, False]).reset_index(drop=True)

# 17 Maximum and minimum
highest_revenue = df["Revenue"].max()
lowest_revenue = df["Revenue"].min()

# 18 Percentage contribution
df_percentage = df.copy()
df_percentage["Revenue_Percentage"] = (df_percentage["Revenue"] / total_revenue * 100).round(2)

# 19 IF equivalent
df_labelled = df.copy()
df_labelled["Revenue_Level"] = np.where(df_labelled["Revenue"] >= 1000, "High", "Low")

# 20 Protect original data by deriving results in a separate DataFrame
df_original = df.copy(deep=True)
df_results = df_original.assign(Revenue_Percentage=lambda x: (x["Revenue"] / x["Revenue"].sum() * 100).round(2), Revenue_Level=lambda x: np.where(x["Revenue"] >= 1000, "High", "Low"))

print("Total Revenue:", total_revenue)
print("Average Revenue:", average_revenue)
print("North Orders:", north_orders)
print("Electronics Revenue:", electronics_revenue)
print("Duplicate OrderIDs:")
print(duplicate_orders)
print("Revenue by Region:")
print(revenue_by_region)
