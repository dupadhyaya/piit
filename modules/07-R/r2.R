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

#filter----
mtcars[1:4, c('mpg','gear')]
sapply(mtcars[, c('mpg','gear')], max)
mtcars[3:6, 1:5]
mtcars[c(1,5,8), c(3,8,9)]
head(mtcars)
#summary----
library(dplyr)

mtcars %>% summary()
mtcars %>% mutate(newMPG = mpg * 1.5)
mtcars %>% select(mpg, wt) %>% head(6)

df = mtcars
df
df <- df %>% mutate(newMPG = mpg * 1.5)
df
df %>% group_by(gear) %>% summarise( n = n())
df %>% group_by(gear, cyl) %>% summarise( n = n())

#functions-----
t(df)

df = mtcars
head(df)
#suroor---
df %>% group_by(am) %>% summarise( meanMPG = mean(mpg, na.rm=T))

#nayeema----
#double the mpg for am=0
df %>% mutate(mpg2 = if_else(am==0, mpg *2, mpg)) %>% select(am, mpg, mpg2)

#jugurtha-----
df %>% group_by(gear) %>% summarise(meanMPG = mean(mpg, na.rm=T)) 
?barplot
library(ggplot2)
df %>% group_by(gear) %>% summarise(meanMPG = round(mean(mpg, na.rm=T))) %>% mutate(gear = factor(gear)) %>% ggplot(., aes(x=gear, y= meanMPG)) + geom_col(aes(fill=gear)) + geom_text(aes(label=meanMPG)) + labs(title ='Mean mpg of each Gear Type')

#DJ----

?t.test()
?duplicated
unique(df$cyl)

#huma---
round(cor(df),2)
cor(df[,c('mpg','wt')])

#muhammad----
df %>% group_by(gear) %>% summarise( countCars = n())
df %>% group_by(gear) %>% tally()

#ratiba----
df
df %>% arrange(gear, desc(mpg) )%>% select(gear, mpg)

#sharmin----
plot(df$mpg, df$hp)

df %>% mutate(am = factor(am), gear = factor(gear)) %>% ggplot(., aes(x=mpg, y=hp)) + geom_point(aes(size=am, color= gear))

mean(df$mpg, na.rm=T)
str(df)
as.integer(100.10)
as.numeric(100.10201)

#bijata----
df %>% group_by(gear, am) %>% summarise(meanMPG= mean(mpg, na.rm=T), meanHP = mean(hp, na.rm=T))
?pivot_longer
df %>% group_by(gear, am) %>% summarise(meanMPG= mean(mpg, na.rm=T), meanHP = mean(hp, na.rm=T)) %>% pivot_longer(cols=c(meanMPG, meanHP), names_to = 'aggType')

#DJ---
df2 = read.csv(file.choose())
df2

df2 = read.csv('/Users/du/dup/analytics/projects/piit/data/student160825.csv')
head(df2)

write.csv(mtcars, '/Users/du/dup/analytics/projects/piit/data/mtcars.csv', col.names = F, na='')
