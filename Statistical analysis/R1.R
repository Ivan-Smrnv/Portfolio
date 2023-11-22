getwd()
setwd('/home/ivan/Документы/CMC_MSU/3 курс/Практикум 5 сем')
#install.packages("lubridate")

library(ggplot2)
library(ks)
library(dplyr)
library(lubridate)

# импортируем данные
data <- read.csv("task1.csv")
head(data)
data$Datetime <- as.Date(data$Datetime)

ggplot(data = data, mapping = aes(x = Datetime, y = PowerConsumption_Zone1)) + geom_line()
dens <- kde(x = data$PowerConsumption_Zone1, h=400)
plot(dens)
