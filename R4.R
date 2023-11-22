library(lattice)
library(caret)
library(RANN)
library(MLmetrics)

# импортируем данные, уже содержащие пропуски
data1 <- read.csv('task4.csv') # полная 
data2 <- read.csv('task4.csv') # с пропусками

#Создание пропусков в данных
set.seed(30)
indx1 <- rbinom(364, 1, prob = 0.1) == 1
data2$PowerConsumption_Zone1[indx1] <- NA

set.seed(30)
indx2 <- rbinom(364, 1, prob = 0.1) == 1
data2$Temperature[indx2] <- NA

head(data2)

#Заполнение пропусков Средним значением 
model <- preProcess(data2, method = c("center", "scale"))
data2 <- predict(model, data2)
res <- data.frame(row.names = 1)
res$meanPC <- R2_Score(data2$PowerConsumption_Zone1[indx1], data1$PowerConsumption_Zone1[indx1])
res$meanTemp <- R2_Score(data2$Temperature[indx2], data1$Temperature[indx2])
res
rm(list = ls())

#Заполнение пропусков выборочной медианой
model <- preProcess(data2, method = "medianImpute")
data2 <- predict(model, data2)
res <- data.frame(row.names = 1)
res$meanPC <- R2_Score(data2$PowerConsumption_Zone1[indx1], data1$PowerConsumption_Zone1[indx1])
res$meanTemp <- R2_Score(data2$Temperature[indx2], data1$Temperature[indx2])
res
rm(list = ls())

