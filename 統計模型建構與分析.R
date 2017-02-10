#機率函數
#r-隨機變數、d-密度函數、p-累積機率密度函數、q-分位數函數
x <- rnorm(100,0,1)   #隨機變數，平均數為0，標準差為1
y <- abs(x)
hist(dnorm(y))
hist(pnorm(y))