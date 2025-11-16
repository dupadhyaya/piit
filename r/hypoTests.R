# Statistics and Hypothesis Tests
options(scipen = 99)
#stats------
#cor, cov, sd, skewness, kurtosis

head(mtcars)
round(cov(mtcars),2)


round(cor(mtcars),2)
library(corrplot)
#https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html

M = cor(mtcars)
corrplot(M) 
corrplot(M, method='number')
corrplot(M, method = 'color', order = 'alphabet')
corrplot(M, method = 'square', order = 'FPC', type = 'lower', diag = FALSE)
corrplot.mixed(M, order = 'AOE')
corrplot(M, order = 'hclust', addrect = 2)


#skewness
library(e1071)
#https://www.datacamp.com/tutorial/understanding-skewness-and-kurtosis
hist(mtcars$mpg)
skewness(mtcars$mpg)
kurtosis(mtcars$mpg)


#outlier-----
#https://statsandr.com/blog/outliers-detection-in-r/
data <- rnorm(500)
data[1:10] <- c(46,9,15,-90, 42,50,-82,74,61,-32) 
data
boxplot(data)
hist(data)
newdata <- data[!data %in% boxplot.stats(data)$out] #removeoutliers
boxplot(newdata)

#hypothesis------
#https://statsandr.com/blog/anova-in-r/

#ztest-----
#https://www.geeksforgeeks.org/r-language/z-test-in-r/
library(BSDA)
#Z-1sample
sample_data <- c(26, 25, 10, 34, 30, 23, 28, 29, 25, 27)
z_test <- z.test(sample_data, mu = 24,sigma.x=10)
z_test
#p-value = 0.5909: The p-value is much higher than 0.05, meaning the difference is not statistically significant. : Do not Reject Ho; 

#Z-2sample
data1 <- c(27, 24, 18, 29, 30,27)
data2 <- c(23, 28, 20, 19, 35,23)

z_test_result <- z.test(data1, data2, mu=26, sigma.x=10, sigma.y=15)
z_test_result
#p-value = 0.0007403: The p-value is very small (< 0.05), indicating the difference is statistically significant.: Reject Ho, Go for Ha


#ttest------
#t-1S-----
scores <- c(75, 82, 68, 90, 79, 85, 71, 88, 77, 80)
result <- t.test(scores, mu = 70)
result
# p <- 0.05; Reject Ho; Go for Ha

#t-2S-indep-----
group1 <- c(75, 82, 68, 90, 79)
group2 <- c(85, 71, 88, 77, 80)
result <- t.test(group1, group2)
result
# p > .05; Do not reject Ho
#t-2S-paired------
before_trg <- c(75, 82, 68, 90, 79)
after_trg <- c(85, 71, 88, 77, 80)
result <- t.test(before_trg, after_trg, paired = TRUE)
result
# p > .05 : Do not reject Ho

#anova-------
#anova-1W----
#examine if the mean displacement (disp) differs across gear levels (gear).
mtcars_aov <- aov(mtcars$disp ~ factor(mtcars$gear))
summary(mtcars_aov)


#anova-2W-----
# analyze the influence of both gear and am (transmission) on disp
mtcars_aov2 <- aov(mtcars$disp ~ factor(mtcars$gear) * factor(mtcars$am))
summary(mtcars_aov2)


#chisquare-----
library(MASS)
head(survey)
stu_data = table(survey$Smoke,survey$Exer) 
stu_data
chisq.test(stu_data)
# This test evaluates whether there is a significant association between the Smoke and Exer variables in the dataset.
#As the p-value 0.4828 is greater than the .05, we conclude that the smoking habit is independent of the exercise level of the student and hence there is a weak or no correlation between the two variables.


#regressionAnalysis----
pairs(mpg ~ ., data = mtcars) #mpg in y axis
t.test(mtcars$mpg ~ mtcars$am)
ggplot(mtcars, aes(x=factor(am), y=mpg)) + geom_boxplot()
#Boxplot suggests that manual transmission is better than automatic transmission for miles per Gallon

model1 <-lm(mpg~ wt + hp ,data=mtcars)
model1
summary(model1)
