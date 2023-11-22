library(graphics)
library(stringr)
library(dplyr)

# импортируем данные
data <- read.csv("task2_cdplot.csv")
data$Datetime <- as.Date(data$Datetime)
data$Indicator  <- as.factor(data$Indicator) 
head(data)

# cdplot
cdplot(Indicator ~ PowerConsumption_Zone1,
       yaxlabels = c("temp >= 20", "	temp < 20"),
       data = data)

# dotchart
dotchart(data$Temperature,
         ylab = "Date", xlab="temperature", cex = 0.7)

rm(list=ls())

#boxplot
data <- read.csv("task2_boxplot.csv")
data$Datetime <- as.Date(data$Datetime)
data$Indicator  <- as.factor(data$Indicator) 
data$quarter <- as.factor(data$quarter)
boxplot(PowerConsumption_Zone1 ~ quarter,
        xlab = "Квартал",
        ylab = "Потребление энергии",
        col = "skyblue", data = data)
rm(list=ls())

#stripchart
data <- read.csv("task2_stripchart.csv")
data$Datetime <- as.Date(data$Datetime)
data$Month <- as.factor(data$Month, levels = month.name)
head(data)
stripchart(Temperature ~ Month,
           data = data,
           xlab = "Месяц",
           ylab = "Температура",
           col = "blue",
           vertical = TRUE,
           cex = 0.8, pch = 20)
rm(list=ls())
