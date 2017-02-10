#if else if 語法#
score <- 80
if(score >= 70 & score <= 90){
print("good")
}else if(score>90){
print("excellent")
"excellent"
}

#累加迴圈#
#1
N=100
sum=0
for(i in 1:N){
  sum <- sum+i 
}
print(sum)
#2
for(i in 1:5){assign(paste("a",i,sep=".",i),i)}

#sample 
sample(10000,10,FALSE,prob=NULL)

#round-四捨五入(數字,小數位數)
round(4.589183,3)

#signif-顯示有效位數(含整數)

#trunc-只取整數
trunc(4.789789324)

#floor-小於等於的最大整數

#ceiling-大於等於的最小整數

#factorial-階層

#function、積分-從0積到10
f <- function(x){(x+1)^3}
integrate(x,0,10)

#seq(lower,upper,by=,length.out=)

#names-定義向量名稱
x <- c(1:3)
names(x) <- c('a','b','c')

#x[-i]-去除掉向量中第i個值
x <- (5:100)
x[-16]

#cumsum-費氏數列(向量加總)、prod-向量乘積、cumprod向量累計乘積
x <- c(1:10)
cumsum(x)
prod(x)
cumprod(x)

#pmax-向量各分量的最大值(pmin)
 x <- matrix(sample(1:10),5,2)
 pmax(x[1,],x[2,],x[3,],x[4,],x[5,])
 
#陣列與矩陣
array(1:20,dim=c(2,5,2))   #2＊5共兩個
x <- matrix(1:20,4,5,byrow=FALSE)
rownames(x) <- rownames(x,do.NULL=FALSE,prefix="r")
colnames(x) <- colnames(x,do.NULL=FALSE,prefix="c")

#dimnames-命名
dimnames(x) <- list(c("a","b","c","d","e"),c("f","g","h","i"))

#兩向量外積
outer(1:5,6:10,FUN='paste')

#diag-對角矩陣

#rbind、cbindx、t(x)-轉置、%*%-矩陣相乘(只有＊表示兩兩相乘，兩矩陣必須同大小)

#solve(x)-解反矩陣、solve(x,b)-解線性方程式、det-行列式值
x <- matrix(1:4,2,2)
solve(x)
x%*%solve(x)
b=c(4,5)
solve(x,b)

#eigen(x)、svd(x)、chol(x)-正定矩陣上三角分解

#ls()、rm()、attr(x,"型態")、class(x)-類別、str-查看內容物、abbrevaite
x <- 1:10
attr(x,"dim") <- c(2,5)
print(x)

class(x)
str(x)

#as.Date(x,%d/%m/%y)、as.Date(1:10,origin='2017/01/01')
#as.character、as.array

#read.table('path',header= TRUE)
#read.csv('path',header= TRUE)-以逗號分隔（read.csv2-以分號分隔）
read.csv('/Users/Dan/Desktop/R/test2.csv',header = TRUE)
x <- matrix(1:10,2,5)
write.csv(x,'/Users/Dan/Desktop/R/test2.csv')
x <- 1:10
write(x,'/Users/Dan/Desktop/R/test.xlxs')
scan('/Users/Dan/Desktop/R/test.xlxs')

#sort-依大小排列、rank(x)-回傳排序等級、rev(x)-倒過來排、
x <- sample(100,10)
sort(x)
rank(x)
rev(x)
split(x,1:5)    #切割，且須為長度的因數
subset(airquality,Temp<60,select=c(Ozone,Solar.R))   #給定條件找出指定資料

#union(x)-找出聯集
x <- seq(1,10,by=3)
y <- 1:10
union(x,y)

#gl(x,y,label=c('a','b','c'))-產生規律字串
gl(3,2)
gl(3,2,label=c('a','b','c','d'))

#rep(x,time,length)-重複字串、head()-顯示前面內容、tail()
x <-rep(1,10,15)
print(x)
y <- sample(100,10)
head(y,2)
tail(y,2)

#sprintf()-%d number %s character %f numeric
sprinf("%d %s",10,'apple')

#grep()-找尋字串
x <- c('asfjahsfkj','sakjfashkj','eiqrqwjknaf','sajfkla','asjfknc','asnfjka')
grep('n',x)
grepl('n',x)
regexpr('n',x)
gregexpr('n',x)
regexec('n',x)

#substr('',start,stop)-擷取部分字串、strtrim('',width)、strsplit('',split=)-分割字串
substr('anv,maknfi',1,5)
strtrim('samnala',4)
date()
strtrim(date(),7)
strsplit(date(),split=" ")

#sub()-更換物件
x <- 'banana is great'
sub('banana','apple',x)
x <- c('asfjahsfkj','sakjfashkj','eiqrqwjknaf','sajfkla','asjfknc','asnfjka')
sub("^sa","", x)

#paste,paste0-paste0中間不空格
paste("i am", "5","years old")
paste("i am", "5","years old",sep="_")

#na.fail-檢測是否有NA、na.omit(x)、na.exclude(x)、is.na
x <- c(1324,24,124,1,23,12,21,NA)
na.fail(x)
na.omit(x)
is.na(x)
paste0("i am", "5","years old")