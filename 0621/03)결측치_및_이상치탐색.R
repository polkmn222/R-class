##### 제 3절 결측값 처리와 이상치 탑색
#### 데이터 기초통계

data("iris")
head(iris)
str(iris)
summary(iris)
cov(iris[,1:4]) # 공분산
cor(iris[,1:4]) # 상관계수

### 결측치 제거시 활용하는 amelia
install.packages("Amelia")
library(Amelia)
head(freetrade)
str(freetrade)

### amelia 적용
### 각 파라미터 설명
## m은 몇 개의 데이터 세트를 만들지 결정
## ts는 시계열 관련정보
## cs는 cross-sectional분석에 포함될 정보

a.out <- amelia(freetrade, m=5, ts='year', cs = 'country')
hist(a.out$imputations[[3]]$tariff, col = 'grey', border = 'white')
save(a.out, file = 'imputations.RData')
write.amelia(obj=a.out, file.stem = 'outdata')

###결측값을 처리하기 전의 그래프
missmap(a.out)

###결측값을 처리 후의 그래프
freetrade$tariff <- a.out$imputations[[5]]$tariff
missmap(freetrade)

### 이상치 검색
library(ggplot2)

x <- rnorm(100)
x_df <-data.frame(x)

# 정상적인 boxplot이 출력됨
ggplot(x_df) + geom_boxplot(mapping = aes(x='',y=x))

### 고의적으로 포함된 이상치를 통해
### 값을 확인해보자.

x1 <- c(x, 19,28,30) # 19,28,30은 이상치
x1_df <- as.data.frame(x1)
bx_x1<-ggplot(x1_df) + geom_boxplot(mapping = aes(x='',y=x1))

# ggplot_build를 통한 이상치 탐지
ggplot_build(bx_x1)$data[[1]]$outliers[[1]]

## outliers 패키지를 활용한 이상치 탐지
install.packages('outliers')
library(outliers)
set.seed(1234)
y <- rnorm(100)
outlier(y)
## 반대방향으로 가장 많이 차이가 나는 값을 출력
outlier(y, opposite = TRUE)

### 20 X 5 로 변경 후의 이상치 탐지지
y<-matrix(y,c(20,5))# 행 20, 열 5의 행렬을 생성
outlier(y) ;outlier(y,opposite = TRUE)

y<-as.data.frame(y)
boxplot(y)

