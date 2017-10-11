#設定日期輸入格式(p.239~252)
as.Date('19950608',format='%Y%m%d')
class(as.Date('1995-06-08'))

#回報率
library(xts)
r <- 0.03
n <- c(1:10)
capital <- 1000
return <- (1+r)^n
FV <- capital*return
xts(FV,timeBasedSeq('2018/2026'))      #cbind(n,return,FV)

#債券收益率(Yield)
facevalue <- 1000
couponrate <- 0.05
n <- c(1:5)
marketrate <- 0.08
interest_PV <- facevalue*couponrate/(1+marketrate)^n
principal_PV <- facevalue/(1+marketrate)^5
bond_PV <- sum(interest_PV,principal_PV)

#投資組合理論
r1 <- 0.04
sigma1 <- 0.12
r2 <- 0.07
sigma2 <- 0.18

rho <- 0.15
wieght1 <- c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
wieght2 <- 1-wieght1
var_portforlio <- wieght1^2*sigma1^2+wieght2^2*sigma2^2+2*wieght1*wieght2*sigma1*sigma2*rho
sigma_portforlio <- var_portforlio^0.5
Rp <- wieght1*r1+wieght2*r2
investment_frontier <- data.frame(cbind(wieght1,wieght2,Rp,sigma_portforlio))
plot(sigma_portforlio,Rp,type='o')

#Modern Portfolio Theory : MVT('^AAPL', 'TWII')
library(quantmod)
library(dplyr)
library(ggplot2)
library(ggthemes)

MPT <- function(code1, code2){
  x <- getSymbols(code1)
  y <- getSymbols(code2)
  code1 <- eval(parse(text = x))
  code2 <- eval(parse(text = y))
  
  code1 <- na.omit(code1) %>% as.data.frame(.)
  code2 <- na.omit(code2) %>% as.data.frame(.)
  
  n <- ifelse( dim(code1)[1] < dim(code2)[1], dim(code1)[1], dim(code2)[1])
  row1 <- index(code1) %>% tail(., n - 1)
  row2 <- index(code2) %>% tail(., n - 1)
  
  code1 <- mutate(code1, change = ROC(code1[, 6], type = 'discrete')) %>% tail(., n - 1)
  code2 <- mutate(code2, change = ROC(code2[, 6], type = 'discrete')) %>% tail(., n - 1)
  rownames(code1) <- row1
  rownames(code2) <- row2
  
  expectation <- matrix(c(mean(code1[['change']], na.rm = T), mean(code2[['change']], na.rm = T)), nrow = 2, ncol = 1)
  
  r1 <- code1['change'] %>% as.matrix(.)
  r2 <- code2['change'] %>% as.matrix(.)
  R <- cbind(r1, r2)
  colnames(R) <- c('Asset1', 'Asset2')
  
  
  w1 <- as.matrix(runif(100))
  w2 <- 1-w1
  content <- matrix(0, nrow = dim(w1)[1], ncol = 3)
  data <- cbind(w1, w2, content)
  colnames(data) <- c('weight1', 'weight2', 'ERp', 'Varp', 'Std')
  
  
  for(i in 1:dim(w1)[1]){
    data[i, 'ERp'] <- data[i, 1:2] %*% expectation
    data[i, 'Varp'] <- t(as.matrix(data[i, 1:2])) %*% cov(R) %*% as.matrix(data[i, 1:2])
    data[i, 'Std'] <- data[i, 'Varp']^(1/2)
  }
  data <- as.data.frame(data)
  ggplot(data, aes( x = data[,5], y = data[,3])) + geom_point() +
    xlab('std') + ylab('ERp') + ggtitle('Investment Frontier') +
    theme_economist()
}



#B-S model(p.260~)



