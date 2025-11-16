# R mysql mac

library(RMySQL)

co <- dbConnect(MySQL(), user='root', password = 'Mysql@123', dbname='piit', host='localhost')
co

df = dbGetQuery(co, 'select * from mtcars')
df
df2
df2 = dbGetQuery(co, 'select * from employees')
df2
df3 = dbGetQuery(co, 'select * from sales')
df3

dbDisconnect(co)
