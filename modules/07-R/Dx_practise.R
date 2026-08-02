#practise
pacman::p_load(tidyverse, googlesheets4, googledrive)
gsid ='1NTNtEhHe4JShDhZ_DmX_k2u93V_bmVz1t8j9DliCg1A'
sheet_names(gsid)

sales <- read_sheet(gsid, sheet = "sales1")

head(sales)