# Bind in R

library(dplyr)

#rbind----
#no and name of cols to be same
(df1 = data.frame(rollno = 1:5, name = paste('Student',1:5)))
(df2 = data.frame(rollno = 11:15, name = paste('Student',11:15)))

df12 = rbind(df1, df2)
df12

#cbind-----
#no of rows to be same, names of cols can be same of different
(df3 = data.frame(rollno = 1:5, name = paste('Student',1:5)))
(df4 = data.frame(rollno = 1:5, gender = c('M','F','M','F','M')))
(df5 = data.frame(city=paste('C',1:5)))

(df34 = cbind(df3, df4))
(df345 = cbind(df3, df4,df5))


df34

#join-----
#https://statisticsglobe.com/r-dplyr-join-inner-left-right-full-semi-anti
df34B = merge(df3, df4, by='rollno', all.x=T, all.y=F)
df34B

?inner_join

?merge
?join_by()

inner_join(df3, df4, by='rollno')

gender = sample(x=c('M','F'), size=11, replace=T)
