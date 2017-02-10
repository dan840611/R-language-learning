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


#B-S model(p.260~)

