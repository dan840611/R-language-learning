#read.csv-讀取檔案(透過逗號分隔)
read.csv("/Users/Dan/Desktop/R/test2.csv") -> stock
stock
read.csv('/Users/Dan/Desktop/R/test2.csv',sep = ";") -> stock
stock
read.csv('/Users/Dan/Desktop/R/test2.csv',sep=" ") -> stock
stock

#定義函數
BMI <-function(X,Y){
     X/((Y/100)^2)
 }
BMI(49,164)

fun2 <- function(x,y){
  sum <-0
  for(i in x:y) {
    sum <- sum+i
  }
return(sum)
}

#邏輯判斷式
x <-10
x >= 11
x < 18
! x < 10   #!-非
#||-或，｜-或(可判斷多個)
1:3<5|1:3>5
1:3<5||1:3>5

#if else-條件判斷式
x <-10
if(x<20){
  x <- x*10
}else{
  x <- x/10
}
print(x)

ifelse(x<10,'lower','upper')

#for(迴圈變數 in 向量或列表)
for(i in 1:10){print(i)}

for(i in 1:40){
  if(i <= 10){
    print("1 to 10")
  }else{
    print("11 to 40")
  }
}

for(i in 1:40){
  if(i <= 10){
    print("hello")
  }else{
    break
  }
}

#while(判斷式){運算式}
x <- 10
while(x <20){
  print(x)
  x<-x+1
}

x <-1
while(x <= 10){
  x <- x+1
  if(x==5){
    print("stop")
  }
  print(x)
}

x <-1
y <-0
repeat{
  if(x > 10) break
  y <- x+y
  print(y)
  x <- x+1
  print(x)
}

#break-跳出迴圈
for( i in x){
  if(i ==50){
    print("bingo")
    break
  }
  print(i)
}

#next-跳過此迴圈
x <- sample(40)
for(i in x){
  if (i >10){
    print("this number is larger than 10")
    next
  }
  print(i)
}