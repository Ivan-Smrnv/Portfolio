library(ggplot2)
library(outliers)
library(stats)
library(nortest)
library(lubridate)

data <- read.csv('task3.csv')
head(data)

#Тест Граббса
grubbs.test(data$PowerConsumption_Zone1, type = 10)
which.min(data$PowerConsumption_Zone1)

#Тест Диксона
dixon.test(data$PowerConsumption_Zone1, type = 0)
which.min(data$PowerConsumption_Zone1)


#plot
idx <- which.min(data$PowerConsumption_Zone1)
colours <- rep("black", 30)
colours[idx] <- "red"
  sizes <- rep(2, 30)
  sizes[idx] <- 3
  ggplot(data=data, aes(x=day(Datetime), y=PowerConsumption_Zone1)) + geom_line() + geom_point(colour = colours, size = sizes)
  rm(idx, colours, sizes)
rm(data)
  