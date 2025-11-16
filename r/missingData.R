# Missing Data

library(VIM)

x = c(10, 20, 30, 50)
x
is.na(x)
length(x)

x2 = c(10, NA, 20, 30, 50, NA)
x2
is.na(x2)
length(x2)
sum(is.na(x2))

sum(!is.na(x2))

#imputation------
(mv2 = mean(x2, na.rm=T))
x2[is.na(x2)] = mv2
x2

#DF-----
library(VIM)
(rollNo = paste('PIIT', 101:120))
length(rollNo)
(gender = sample(c('M','F'), size=20, replace=T))
(age = round(rnorm(n=20, mean=30, sd=3),0))

(students = data.frame(rollNo, gender, age) )
head(students)
str(students)
students[ c(3,6,7,18), 'age'] = NA
students[ c(7,9,11), 'gender'] = NA
students

str(students)
summary(students)
colSums(is.na(students))
complete.cases(students)
students

students %>% filter(is.na(age))
students %>% filter(!is.na(age))

#imputation-----
students$age[ is.na(students$age)]
which(is.na(students$age))
(mv3 = mean(students$age, na.rm=T))
students$age[ is.na(students$age)] = round(mv3)
students
colSums(is.na(students))
students %>% filter(is.na(gender))

sleep #VIM library
colSums(is.na(sleep))
df = sleep
df
str(df)
summary(df)
colSums(is.na(df))
rowSums(is.na(df))
df %>% summarise(across(everything(), ~sum(is.na(.))))
df %>% filter(if_any(everything(), is.na))
df[complete.cases(df), ]        

library(caret)
