# data access
# how to import data from Excel, GoogleSheets, HTML, 
# sql separate

#libraries----
pacman::p_load(openxl,readr, writexl, googlesheets4, rvest, DT, htmlwidgets )

mtcars %>% rownames_to_column() %>% write.csv(., file='./data/mtcars.csv', row.names = F,na='') ; dir('./data')

csvLink ='https://raw.githubusercontent.com/dupadhyaya/piit/refs/heads/main/data/mtcars.csv'


#CSV-----
#read-> read_csv; write -> write_csv
library(readr)
dcsv <- read_csv(csvLink)
dcsv


#Excel-----
#readxl_xlsx; write_xlsx
#if in web
xlLink = paste0("https://raw.githubusercontent.com/", "dupadhyaya/piit/main/data/ExcelEmpDept.xlsx")
xlLink
download.file(xlLink,destfile = "ExcelEmpDept.xlsx",  mode = "wb")
dexcelEMP = readxl::read_excel("ExcelEmpDept.xlsx", sheet=2)
dexcelEMP
#iflocallyStored
dexcelDEPT = readxl::read_excel("./data/ExcelEmpDept.xlsx", sheet=3)
dexcelDEPT

#GS-----
library(googlesheets4)
#sheet_read; sheet_write
#googlesheets4::gs4_deauth()
#googlesheets4::gs4_auth(email='dup1966@gmail.com')
gsLink ='https://docs.google.com/spreadsheets/d/19ReQlRfDQHcV1OFUnmVkiFY_1IrJeOR0g1RmrjfjMD4/edit?gid=940279727#gid=940279727'
dGS = googlesheets4::read_sheet(ss=gsLink, sheet='student1')
dGS


#html-----
library(rvest)
urlPage ='https://searchenginesmarketer.com/company/resources/university-college-list/'
page <- read_html(urlPage)
tables <- page |>   html_elements("table") |>  html_table()

first_table <- tables[[1]]
first_table
names(first_table) =c('School','URL','State')
first_table <- first_table |>  slice(-1)
first_table
