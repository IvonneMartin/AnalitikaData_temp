## This script is intended to understand the behaviour of prediction accuracy.

rm(list=ls())

## 1. Supppose our true data is generated from a wiggly model as follows.

n <- 101
x <- seq(0, 1, length.out = n)

## wiggly function

fx <- sin(2 * pi * x)

# generate noisy data
set.seed(1)
y <- fx + rnorm(n, sd = 1.5)

# plot data and f(x)
plot(x, y)             # data
lines(x, fx, lwd = 2)  # f(x)
legend("topright", legend = "f(x)", lty = 1, lwd = 2, bty = "n")


## Fit the training data with a linear function

fit.lm <- lm(y~x)
yhat.lm <-predict(fit.lm)
lines(x,yhat.lm, col="red", lwd =2, lty=2)

## Fit the training data with a linear function

fit.poly <- lm(y ~ poly(x,3))
yhat.poly <- predict(fit.poly)
lines(x, yhat.poly, col = "blue", lwd=2,lty = 1)

## Fit the training data with a smooth curve

fit.lowess<- lowess(x,y,f = 0.1)
lines(x,fit.lowess$y,col = "brown",lwd= 2, lty=1)

