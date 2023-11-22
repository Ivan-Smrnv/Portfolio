library(ggplot2)
library(graphics)
library(car)
library(stats)
library(nortest)

sizes <- c(80, 2500)
means <- c(-2, 0)
sds <- c(1, 3)

samples <- mapply(rnorm, n = sizes, mean = means, sd = sds)

#Эмпирические функции распределения
Fn <- ecdf(samples[[1]])
df <- data.frame(x = seq(from = -7, to = 3, by = 0.05),
                 prob = c(pnorm(seq(from = -7, to = 3, by = 0.05), mean = means[1], sd = sds[1]),
                          Fn(seq(from = -7, to = 3, by = 0.05))),
                 fun = rep(c("N(-2, 1)", "эмпир функ"), each = 201))
ggplot(df, aes(x, prob, col = fun)) + geom_line()

Fn <- ecdf(samples[[2]])
df <- data.frame(x = seq(from = -5, to = 5, by = 0.05),
                 prob = c(pnorm(seq(from = -5, to = 5, by = 0.05), mean = means[2], sd = sds[2]),
                          Fn(seq(from = -5, to = 5, by = 0.05))),
                 fun = rep(c("N(0, 3)", "эмпир функ"), each = 201))
ggplot(df, aes(x, prob, col = fun)) + geom_line()



#Критерий Колмогорова-Смирнова
mapply(ks.test, samples, rep("pnorm", 2), means, sds)

#критерий Шапиро-Уилка
mapply(shapiro.test, samples)

#Критерий Андерсона-Дарлинга
mapply(ad.test, samples)

#Критерий Крамера фон Мизеса
mapply(cvm.test, samples)

#Критерий Лиллиефорса
mapply(lillie.test, samples)

#Критерий Шапиро-Франсия
mapply(sf.test, samples)

rm(list = ls())
