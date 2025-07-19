# day2 - sales Data


#libraries------
library(dplyr)
pacman::p_load(tidyverse, googlesheets4)
#read data-----
print(gsid)
gsid = '1NTNtEhHe4JShDhZ_DmX_k2u93V_bmVz1t8j9DliCg1A'
gsid
sales <- read_sheet(ss=gsid, sheet = "sales1", col_types='Dcccinn', skip=1)
#view data -----
head(sales, n=3)
tail(sales, n=4)
#understand data-----
names(sales)
str(sales)

year(sales$Date)
yday(sales$Date)
day(sales$Date)
month(sales$Date)
month(sales$Date, label=T)

#summaries--------
head(sales)

sales %>% mutate(totaPrice = Units_Sold * Unit_Price) 
str(sales)

#distinct Region, SalesPerson, Product
unique(sales$Region)
unique(sales$Sales_Rep)
unique(sales$Product)

#summaries-----
library(dplyr)
names(sales)
sales %>% group_by(Region) %>% summarise(salesCount = n(), totalRev = sum(Revenue, na.rm=T)) %>% arrange(desc(totalRev)) %>% head(n=1)

sales %>% group_by(Sales_Rep) %>% summarise(salesCount =n(), qtySold = sum(Units_Sold, na.rm=T), totalRev = sum(Revenue, na.rm=T)) %>% slice_max(order_by = totalRev, n=2)

sales %>% group_by(Sales_Rep) %>% summarise(salesCount =n(), qtySold = sum(Units_Sold, na.rm=T), totalRev = sum(Revenue, na.rm=T)) %>% slice_min(order_by = totalRev, n=2)

sales %>% group_by(Product) %>% summarise(salesCount =n(), qtySold = sum(Units_Sold, na.rm=T), totalRev = sum(Revenue, na.rm=T)) %>% slice_max(order_by = qtySold, n=2)

sales %>% select(Product, Unit_Price) %>% arrange(Product)
sales %>% group_by(Product) %>% summarise(minPrice = min(Unit_Price, na.rm=T), maxPrice = max(Unit_Price, na.rm=T), avgPrice = mean(Unit_Price, na.rm=T)) 

#SQL-10   ; R-30   ; Py-30 ; TB-30

head(mtcars)

sales %>% group_by(year = year(Date)) %>% summarise(totalSales = sum(Revenue, na.rm=T))
sales %>% group_by(month = month(Date, label=T)) %>% summarise(totalSales = sum(Revenue, na.rm=T))

#different data types
#type-1
#qualitative - descriptive - feedback, gender
#quantitative - numerical - sales, date
#type-2-----
#discrete - countable - number of students(29)
#continuous - measurable - sales amount, time duration(152min)
#type-3-----
#nominal - category without order - region, gender,color
#ordinal - category with order - rating, satisfaction level
#-good - satisfactory ; good > satisfactory
#interval - numerical with order and no true zero - temperature
#ratio - numerical with order and true zero - sales amount, time duration


Sys.Date()
as.numeric(Sys.Date())
#filtering data-----

head(sales)
sales %>% filter(Region == 'East' , Sales_Rep == 'Burhan', Units_Sold > 1) 
sales %>% filter(month(Date)==7)

#graphs-----
library(ggplot2)
options(scipen=99)
sales %>% group_by(Region) %>% summarise(totalRev = sum(Revenue, na.rm=T)) %>% ggplot(., aes(x=Region, y=totalRev, fill=Region)) + geom_col() + geom_text(aes(label=totalRev)) + labs(title ='Region Wise Sales')

week(sales$Date)
wday(sales$Date)
?wday
sales %>% group_by(weekDay = wday(Date, label=T)) %>% summarise(totalRev = sum(Revenue, na.rm=T)) 
sales %>% filter(wday(Date)==7)
