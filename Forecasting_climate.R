rm(list = ls())
library(reader)
library(fpp2)
library(readr)
climate.db <- read_csv("Documents/rdata/climate_final.csv")

climate.ts <- ts(climate.db$Temp, start = c(1983,5), end = c(2008,12), frequency = 12)

plot(climate.ts, xlab = "months", ylab = "temperature", main = "climate Data")

nValid = 31
nTrain <- length(climate.ts) - nValid
nTrain
train.ts <- window(climate.ts, start = c(1983,5), end = c(2008, nTrain))
valid.ts <- window(climate.ts, start = c(1983, nTrain+1), end = c(2008, nTrain + nValid))

climate.lm <- tslm(train.ts ~ trend + I(trend^2))
climate.lms <- tslm(train.ts ~ trend + I(trend^2) + season)

climate.lm.pred <- forecast(climate.lm, h = nValid, level = 0)
climate.lms.pred <- forecast(climate.lms, h = nValid, level = 0)
climate.na.pred <- naive(climate.ts, h = nValid)

hgAI <- hist(climate.lms.pred$residuals, ylab = "Frequecy", xlab = "Forecast error", main = "Distribution of residuals(train set, seasonal model")

plot(climate.lms.pred, ylab = "Temperature", xlab = "time", xlim = c(1991, 2010), flty = 2)
lines(climate.lms$fitted.values, lwd = 2, col = "blue")
lines(valid.ts)
