### 시작 때 마다 만약
### 경로설정을 원하신다면 다시 하셔야 함을 주의

getwd()
setwd("C:/Users/user/Documents/Test_folder")


# 시작을 위해서는
# ctrl + enter :: line 마다
# 전체실행을 원하시면 :: ctrl + alt + R

a <- 168
# b = [168, 185]
b <- c(168, 185, 171) 
# combine이라고 하는 small c가 필요 :: Numeric
# 주의하자, 소문자 c입니다.

a
b[2] # R은 1부터 센다...


##### speed, dist 입력값 예시
speed <- c(4, 5, 6, 7, 8, 10, 11, 12, 13, 14)
dist <- c(2, 4, 8, 16, 10, 18, 24, 34, 17, 26)

summary(dist); mean(speed)
sd(speed)

plot(speed, dist)
cor(speed, dist)  # 상관계수

#### 경로설정
### 현재경로는?
# python 참고
# import os
# os.getcwd()

getwd()
setwd("C:/Users/user/Documents/Test_folder")

# ctrl + shift + n  :: 생성
# ctrl + w         :: 삭제

#### Package 설치
# Packages -> install -> tidyverse
install.packages('tidyverse')
install.packages('MASS')

#### Package 호출
library(MASS)
library(tidyverse)

### tidyverse를 호출하면서
### filter 함수가 충돌되었는데
### 그러므로 stats 패키지의
### 함수는 아래와 같이 써야한다
?stats::filter()

### R의 데이터 구조
### Scalar -> Vector // Factor
### Matrix -> Array

# 위의 데이터 구조는 서로 자료형이 같습니다...

### data.frame <-- 열 내의 자료형은 같고, 열 간의
###                자료형은 다릅니다.


