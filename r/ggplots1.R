#graphs in R


#base-----
hist(mtcars$mpg)
barplot(height = table(mtcars$gear), col=c('red','green','blue'))

#ggplot-----
library(ggplot2)

mtcars

mtcars %>% group_by(gear) %>% summarise(n=n())

#bar-----
g1 <- mtcars %>% group_by(gear) %>% summarise(n=n()) %>% ggplot(., aes(x=gear, y=n)) + geom_col(aes(fill=factor(gear))) + geom_text(aes(label=n)) + labs(title='Count of Cars by Gear', x='Gear Type', y='Count of Cars') + theme(plot.title = element_text(hjust=.5))
g1

#box-----
mtcars %>% ggplot(., aes(y=mpg)) + geom_boxplot()

#scatter----
mtcars %>% ggplot(., aes(x=wt, y=mpg)) + geom_point(aes(size=hp, color=factor(gear), shape=factor(cyl))) + facet_wrap(am ~ carb )
#line---
df1 = data.frame(year = 2021:2025, salesP1=round(rnorm(5, mean=1000, sd=50)), salesP2=round(rnorm(5, mean=750, sd=20)))
df1
?pivot_longer
df1 %>% ggplot(., aes(x=year, y=salesP1)) + geom_point(color='green', size=5) + geom_line() + geom_text(aes(label=salesP1)) + labs(title='Sales of L5y') + theme(plot.title = element_text(hjust=.5))

df1 %>% pivot_longer(cols=salesP1:salesP2, names_to = 'product', values_to = 'sales') %>% ggplot(., aes(x=year, y=sales)) + geom_point(color='green', size=5) + geom_line(aes(group=product, color=product)) + geom_text(aes(label=sales)) + labs(title='Sales of L5y : P1 & P2') + theme(plot.title = element_text(hjust=.5))
