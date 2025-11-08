# file- r8nov25

mtcars #run the line with control + enter
#describe----
str(mtcars)
?str
summary(mtcars)
names(mtcars)
dim(mtcars)
head(mtcars)
tail(mtcars)
head(mtcars, 10)
sum(is.na(mtcars))
#clean----

#analysis----
head(mtcars,2)
sapply(mtcars, mean)
sapply(mtcars, max)
sapply(mtcars, fivenum)
mean(mtcars$mpg)
min(mtcars$mpg)
max(mtcars$mpg)
range(mtcars$mpg)
sd(mtcars$mpg)
quantile(mtcars$mpg)
summary(mtcars)

#summary----
