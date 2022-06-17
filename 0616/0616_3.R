# R언어는 S언어와 유사하며 C언어와도 유사
# vector

x <- c(1, 10, 24 ,40)
y <- c('사과','바나나','오렌지')
z <- c(TRUE,FALSE,TRUE)

# vector의 결합
xy <- c(x,y)
xy

# mx의 사례
mx <- matrix(1:6, ncol = 2)
mx

# rbind와 cbind의 활용
r1 <- c(10,10)
c1 <- c(20,20,20)

rbind(mx,r1);cbind(mx,c1)

# data_frame 살펴보기
income <- c(100,200,150,300,900)
car <- c('kia','hyundai','kia','toyota','lexus')
marriage <- c(FALSE, FALSE, FALSE, TRUE, TRUE)
my_df <- data.frame(income, car, marriage)
my_df

# excel_file 불러오기
install.packages('RODBC')
library(readxl)
library(RODBC)

### R의 기초 함수
## 수열 생성하기
# rep 함수
rep(1,3) # 첫번째 인수를 2번째 인수의 횟수만큼 반복

# seq 함수
seq(1,3) # 1~3까지의 숫자 호출
seq(1,11, by=2) # 1~11까지 step을 2단계로 호출하는 방법
seq(1,11, length=6) # 1~11까지를 length를 활용하여 호출

# rep 함수의 응용
rep(2:5,3) # 2~5까지를 3번씩 반복

### 기초적인 수치 연산
## 사칙연산
a<-1:10
a
a+a
a-a
a*a
a/a

## 행렬 곱 확인
a <- c(2,7,3)
t(a)

# 행렬곱을 통한 A함수 생성
A = a%*%t(a)
A
# A에 대한 *을 통해 연산을 실시하면,
# 단순 스칼라 곱을 얻을 수 있음

mx <-matrix(c(23,41,12,35,67,1,24,7,53),nrow=3)
mx*5

# solve() 함수를 통한 역행렬 계산
# 역행렬이란 원본행렬과 곱을 했을 때 단위행렬이 되는 행렬
# 단위행렬 또는 항등행렬 주 대각선이 1이며 나머지가 모두 0인 정방행렬
solve(mx)

## 기술 통계량 계산
a<-1:10
a

# mean, var, sd 함수는 각각 입력한
# 벡터의 평균, 분산, 표준편차 계산
mean(a);var(a);sd(a)

# sum, median, log 함수의 활용
sum(a);median(a);log(a)

# 서로 다른 두 벡터에 대해서 cov, cor 함수를 활용한
# 공분산 및 상관계수 구하기
b <- log(a)
cov(a,b)
cor(a,b)

# summary 함수를 활용한 벡터 정보
summary(a)

### 반복구문
## for 반복 구문
a<-c() # 빈 벡터 선언
for (i in 1:9){
  a[i] = i*i
}
a

## 1~100 까지의 합을 위한 for 문
isum = 0
for (i in 1:100){
  isum=isum+i
}
cat("1부터 100까지의 합:",isum,'이다')

## while 반복 구문
x=0
while(x<5){
  x=x+1
  print(x)
}

## if~else 구문
StatScore<-c(88,70,84,76,68,50,48,33,70,48,66,88,96,79,65,27,88,96,33,45,
             64,48,77,18,26,44,48,68,77,64,88,95,79,88,49,30,29,10,49,88)

Over70 = rep(0,40) # step1: 0을 40개 생성
for (i in 1:40){
  if(StatScore[i]>=70) Over70[i]=1 # step2
  else Over70[i]=0
}
Over70
sum(Over70)

## 사용자정의함수
add_to = function(a){
  result = 0
  for (i in 1:a){
    result = result + i
  }
}
height  <-c(165,168,174,175,188,165,165,190,173,168,159,170,184,155,165)
weight <- c(68,65,74,77,92,63,67,95,72,69,60,69,73,56,55)

length(height);length(weight)

plot(height,weight)

# scatter_matrix
pairs(iris[1:4], main='ysp`s iris',
      pch=21,
      bg=c('red','green','blue')[unclass(iris$Species)])

# histogram & boxplot
StatScore<-c(88,70,84,76,68,50,48,33,70,48,66,88,96,79,65,27,88,96,33,45,
             64,48,77,18,26,44,48,68,77,64,88,95,79,88,49,30,29,10,49,88)
hist(StatScore, prob=T)
boxplot(StatScore)
