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
# 역행렬이란 원본행렬과 곱을 했을


library(tidyverse)
library(ggplot2)
mpg
table(mpg$drv)
table(mpg$fl)

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy))

ggplot(data=mpg) + geom_bar(mapping = aes(x=drv))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, color = class))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, shape = drv))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, size = cyl))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, color = class, shape = drv, size = cyl))


## facet_wrap()에 의한 faceting

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy)) + facet_wrap(~class)

### 패널 배치 조절
## 2 X 3 -> 3 X 2

pp <- mpg%>%filter(class != '2seater')%>%ggplot()+geom_point(mapping = aes(x=displ, y=hwy))
pp + facet_wrap(~class, ncol=2)
pp + facet_wrap(~class, ncol=2, dir='v')

## facet_grid()에 의한 faceting
my_plot <- mpg%>%filter(cyl!=5, drv!='r')%>% ggplot()+geom_point(aes(x=displ, y=hwy))

my_plot + facet_wrap(drv~.)
my_plot + facet_grid(drv~.)
my_plot + facet_grid(.~cyl)

# drv~cyl을 결합해본다.

my_plot + facet_grid(drv~cyl)

## 회귀분석 시각화
ggplot(data=mpg) + geom_smooth(aes(x=displ, y=hwy)) +geom_point(aes(x=displ, y=hwy))

## 회귀분석 시각화 -1 글로벌
ggplot(data=mpg, mapping = aes(x=displ, y=hwy))  + geom_point(aes(color=drv)) + geom_smooth()

## 회귀분석 시각화 -2 로컬
ggplot(data=mpg, mapping = aes(x=displ, y=hwy, color = drv))  + geom_point() + geom_smooth(se=FALSE)
