
library(PolynomF)
x = polynom()
f =3*x^2+4*x-5
g =x^3+3*x^2-5*x+1
coef(f)                            #顯示係數(升冪)
curve(f,-10,20,ylab = "f(x")       #畫圖，從-10至20
df <- deriv(f,"x")                 #對x微分
ans <- solve(f)                    #方程式解(法一)
poly.calc(zeros)                   #可找回原本的方程式
polyroot(c(coef(f)))               #方程式解(法二),可只輸入係數

#矩陣運算
x <- matrix(1:9,nrow=3,ncol=3)
y <- matrix(sample(1:9),nrow=3,ncol=3)
x%*%y       #矩陣相乘
x%o%y       #矩陣外積
x*y         #個別元素兩兩相乘
t(x)        #轉置
det(x)
eigen(x)    #特徵值、特徵向量
cbind(x,y)
rbind(x,y)
solve(x)    #求反矩陣

#p196矩陣分解
