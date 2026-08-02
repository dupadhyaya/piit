# comment
#https://www.dataquest.io/cheat-sheet/r-programming-cheat-sheet/

mtcars
head(mtcars)

#DataStructures-----
# vector, list, matrix, 
# dataframe

#EDA----
#str, head, tail, summary...
summary(mtcars)
#colMeans, rowMeans 

#statistics------
#https://dmirman.github.io/RCheatSheet.pdf

#summary----
#library-dplyr, tidyr

#installPackages
#library
library(dplyr)
#https://nyu-cdsc.github.io/learningr/assets/data-transformation.pdf
mtcars %>% mutate(newMPG = 1.5 * mpg)
?slice_max
mtcars %>% slice_max(., order_by=mpg, n=5)
mtcars %>% arrange(desc(mpg))
table(mtcars$gear)
mtcars %>% group_by(gear) %>% slice_max(order_by = mpg, n=2)

#graphs----
hist(mtcars$mpg)
#https://publish.illinois.edu/johnrgallagher/files/2015/10/BaseGraphicsCheatsheet.pdf

#ggplot-----

mtcars %>% group_by(gear) %>% summarise(n=n()) %>% ggplot(., aes(x=gear, y=n, fill=factor(gear))) + geom_col() + geom_text(aes(label=n)) + labs(title='Count of Cars: Gear Type', x='Gear',y='Count of Cars', fill='Gear')
table(mtcars$cyl)
mtcars %>% group_by(gear, cyl) %>% summarise(n=n()) %>% ggplot(., aes(x=gear, y=n, fill=factor(cyl))) + geom_col(position='stack', col='black') + geom_text(aes(label=n), position = position_stack(.8)) + labs(title='Count of Cars: Gear - Cylinder Type', x='Gear',y='Count of Cars', fill='Cylinder')
library(tidytext)
mtcars %>% group_by(gear, cyl) %>% summarise(n=n()) %>% ggplot(., aes(x=reorder_within(cyl,n,gear), y=n, fill=factor(cyl))) + geom_col(position='dodge', col='black') + geom_text(aes(label=n), position = position_dodge2(.8)) + labs(title='Count of Cars: Gear - Cylinder Type', x='Gear',y='Count of Cars', fill='Cylinder') + facet_wrap(gear ~. , labeller= label_both, scales='free') + scale_x_reordered() + theme(strip.text= element_text(size=15), axis.text = element_text(size=20), plot.title = element_text(size=15))


plot(mtcars$wt, mtcars$mpg)
mtcars %>% ggplot(., aes(x=wt, y=mpg)) + geom_point(aes(size=hp, color=factor(gear), shape=factor(am))) + geom_text(aes(label=paste(wt, '/', mpg)))
#thub.io/cheatsheets/html/data-visualization.html
