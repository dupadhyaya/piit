#window1

mtcars # shift/ control + enter
iris
x = c(1,2,4)
x

x <- c(0:10, 50)
x

xm <- mean(x)
xm

mtcars %>% write.csv(file='./r/jugurt.csv', row.names = F)

df <- read.csv(file='./r/jugurt.csv')
head(df)
