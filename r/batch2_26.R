#PIIT Batch No2 : 15 Mar 2026

mtcars

head(mtcars)

mean(mtcars$mpg)

library(dplyr)

mtcars %>% group_by(gear) %>% summarise(meanMPG = mean(mpg, na.rm=T), meanWt = mean(wt, na.rm=T))

library(ggplot2)

mtcars %>% group_by(gear) %>% summarise(meanMPG = mean(mpg, na.rm=T), meanWt = mean(wt, na.rm=T)) %>% ggplot(., aes(x=gear, y=meanMPG)) + geom_col(aes(fill=factor(gear))) + geom_text(aes(label=round(meanMPG)))

hist(mtcars$mpg)
?boxplot()
boxplot(formula =  mpg ~ gear, data=mtcars)
colMeans(mtcars)
min(mtcars)
