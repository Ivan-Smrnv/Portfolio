library(ggplot2)
library(graphics)
library(car)
library(stats)
library(nortest)

# выборка малого размера
data <- read.csv("task6_1.csv")
head(data)
data$x <- 1:60
ggplot(data=data, aes(x=x, y=X0)) + geom_line()

#критерий Шапиро-Уилка
shapiro.test(data$X0)
#Критерий Андерсона-Дарлинга
ad.test(data$X0)
#Критерий Крамера фон Мизеса
cvm.test(data$X0)
#Критерий Лиллиефорса
lillie.test(data$X0)
#Критерий Шапиро-Франсия
sf.test(data$X0)
rm(list = ls())

#Умеренная выборка
data <- read.csv("task6_2.csv")
head(data)

#критерий Шапиро-Уилка
shapiro.test(data$X0)
#Критерий Андерсона-Дарлинга
ad.test(data$X0)
#Критерий Крамера фон Мизеса
cvm.test(data$X0)
#Критерий Лиллиефорса
lillie.test(data$X0)
#Критерий Шапиро-Франсия
sf.test(data$X0)
rm(list = ls())
