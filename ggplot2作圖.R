#ggplot2

#qplot
diamonds.subset <- diamonds[sample(nrow(diamonds),100),]
qplot(diamonds.subset$carat,diamonds.subset$price)
qplot(carat,price,data=diamonds.subset)              #與上列等價（用data)
qplot(carat,price,data=diamonds.subset,color=color)  #資料點顏色
qplot(carat,price,data=diamonds.subset,shape=cut)    #資料點形狀

x <- factor(rep(letters[1:3],each=10))
y <- rnorm(30)
df <- data.frame(x,y)
ggplot(df,aes(x=x,y=y))+geom_point(color="blue",size=5,alpha=0.5)       #散布圖，alpha代表透明度
ggplot(df,aes(x=x,y=y))+geom_boxplot()                                  #盒鬚圖
ggplot(df,aes(x=x,y=y))+geom_dotplot()       


#facet-子圖
df$z <- df$y+rnorm(30)
ggplot(df, aes(x=z,y=y)) +geom_point() + facet_grid(x~.)
ggplot(df, aes(x=z,y=y)) +geom_point() + facet_grid(.~x)
ggplot(df,aes(x=z,y=y))  +geom_line()  + facet_grid(x~.)      #線圖
ggplot(df,aes(x=z,y=y,color=x))  +geom_line()                 #上色

#geom_smooth()  加趨勢線
df$z <- df$y+rnorm(30)
ggplot(df, aes(x=z,y=y)) +geom_point() + facet_grid(x~.) + geom_smooth()

#pie chart
x <- c(1,3,5,7,9)
pie(x,main="test",labels=c('a','b','c','d','e'),col=rainbow(length(x)))

x <- 1:5
y <- sample(100,5)
df <- data.frame(x,y)
pie(df$y,main="sample",col=rainbow(length(df$y)),labels=df$x)    #lables圖示

#histrogram 直方圖（y軸為frequency)
x <- sample(100,100000,replace=TRUE)
hist(x,main="sample",col="blue")

#bar plot 長條圖
x <- matrix(sample(1:10),nrow=2,ncol=5)
barplot(x,beside=TRUE,names.arg = c('L1','L2','L3','L4','L5'),main="sample")  #beside可決定是否為堆疊

#text 輔助文字
x <- 1:26
y <- sample(100,26)
z <- letters
plot(x,y)
text(x,y,z,pos=4,cex=1,col="purple")   #pos文字位置、cex文字大小、font字型、col顏色