# R + Tableau : LODs

#lib-----
pacman::p_load(dplyr)


#data-----
gitData ='https://raw.githubusercontent.com/dupadhyaya/piit/refs/heads/main/data/superstore_orders.csv'

orders = read.csv(gitData)
dim(orders)
names(orders)
#LODS---
#A simple way to explain them is:
# FIXED: “Use exactly this level.”
# INCLUDE: “Temporarily calculate at a more detailed level.”
# EXCLUDE: “Temporarily calculate at a less detailed level.”

#FIXED-----
#{ FIXED : SUM([Sales]) }
#This calculates total sales for each order. If an order contains several product rows, Tableau combines them into one order total.

orders %>% group_by(State.Province) %>% summarise(sales = sum(Sales, na.rm=T), .groups = 'drop')
orders %>% mutate(LOD_FX_SALES = sum(Sales, na.rm=T)) #same no of rows
orders %>% mutate(LOD_FX_SALES = sum(Sales, na.rm=T)) %>% group_by(State.Province) %>% summarise(sales = sum(Sales, na.rm=T), LOD_FX_SALES = first(LOD_FX_SALES), PercTotal = round(100*sales/LOD_FX_SALES,2), .groups = 'drop')


#FIXED-Region------
orders %>% group_by(Region) %>% summarise(sales = sum(Sales, na.rm=T), .groups = 'drop')
orders %>% mutate(LOD_FX_SALES = sum(Sales, na.rm=T)) %>% group_by(Region) %>% summarise(sales = sum(Sales, na.rm=T), LOD_FX_SALES = first(LOD_FX_SALES), .groups = 'drop')


#FIXED:Customer-------
#{ FIXED [Region], [Customer Name] : SUM([Sales]) }
names(orders)
regCustSales <- orders %>% group_by(Region, Customer.Name,) %>% summarise(regCustSalesAmt = sum(Sales, na.rm=T), .groups = 'drop')
regCustSales %>% arrange(Customer.Name, Region)
orders %>% left_join(regCustSales, by=c('Region', 'Customer.Name')) %>% select(Order.ID, Customer.ID, Customer.Name, Region, Sales, regCustSalesAmt ) %>% arrange(Customer.Name) %>% head(10)

#INCLUDE:------
#show Region-TotalSales : Include Col showing AvgSales Per Order
#{ INCLUDE [Order ID] : SUM([Sales]) } -> AVG([LOD_AVG_ORDER_SALES])

regOrders <- orders %>% group_by(Region, Order.ID) %>% summarise(regOrderSales = sum(Sales, na.rm=T), .groups ='drop')
dim(regOrders)
regOrders %>% head(10)
dim(orders)
duplicated(x=c())
n_distinct(orders$Order.ID)
orders %>% select(Region, Order.ID, Sales) %>% arrange(Order.ID) %>% head(10)

region_summary <- regOrders %>% group_by(Region) %>%  summarise( orderCnt = n_distinct(Order.ID),  sales = sum(regOrderSales, na.rm = TRUE), LOD_AVG_ORDER_SALES = mean(regOrderSales, na.rm = TRUE), .groups = "drop"  )
region_summary



#EXCLUDE------
#{ EXCLUDE [Sub-Category] : SUM([Sales]) }
orders %>% group_by(Category, Sub.Category) %>% summarise(Sales = sum(Sales, na.rm = TRUE), .groups = "drop")

exclude_subcat <- orders %>%  group_by(Category, Sub.Category) %>%  summarise( Sales = sum(Sales, na.rm = TRUE),  .groups = "drop"  ) %>% group_by(Category) %>%  mutate( LOD_EX_SUBC_SALES = sum(Sales, na.rm = TRUE)  ) %>%  ungroup()

exclude_subcat
