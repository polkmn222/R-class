### 1.Data Mart
## data reshape
install.packages('reshape2')
library(reshape)
library(reshape2)
library(tidyverse)
airquality%>%head()
names(airquality)<-airquality%>%names()%>%tolower()
names(airquality)

## melt함수를 통한
aqm <- melt(airquality, id=c('month','day'), na.rm = TRUE)
aqm

a<-cast(aqm,day~month~variable) # variable의 각 값을 기준으로 하여
a                               # 데이터를 재구성하고 싶을때

b<-cast(aqm, month~variable, mean)
b

# variable 구분자를 넣지 않은 경우 -1
c1<-cast(aqm, month~.,mean)
c1

# variable 구분자를 넣지 않은 경우 -2
c2<-cast(aqm, month~.|variable,mean)
c2

# margins과 행과 열에 대한 소계를 산출
d<-cast(aqm, month~variable, mean, margins = c('grand_row','grand_col'))
d

# 모든 데이터를 처리하지 않고 특정 변수만 처리하고자 하는 경우
e<-cast(aqm, day~month, mean, subset=variable=='ozone')
e

# min과 max를 동시에 표시해주는 range는 min은 "_X1"이라는 변수명으로,
# max는 "_X2"라는 suffix를 붙여줌
f<-cast(aqm, month~variable, range)
f

### 2. sqldf를 활용한 df분석
install.packages('sqldf')
library(sqldf)
sqldf("select * from iris") # sql문을 직접 호출

# Oracle의 numrows처럼 limit을 정의 및 행의 개수 호출
sqldf("select * from iris limit 10") # head와 같은 기능

# like 문장을 사용할때에는 ' '를 활용
sqldf("select count(*) from iris where SPecies like 'se%'")

### 3. plyr
## plyr은 데이터를 분리하고 처리한 후 다시 재결합하는 등 가장 필수적인
## 데이터 처리 기능을 제공한다
## seed를 설정하여 난수를 생성할 준비를 한다

set.seed(1)

# runif 함수
# runif(생성할 난수의 개수, 최소값, 최대값)
d<- data.frame(year=rep(2020:2022, each=6), count = round(runif(9,0,20)))
d

# 만약 CV변동계수를 구하는 함수를 만들어 한다면.
# cf) 즉, 변동계수는 표준편차를 산술평균으로 나눈 것
# 표본사이의 표준편차를 비교하고자 할때 평균의 영향을 없애기 위하여 사용

library(plyr)
library(tidyverse)
plyr::ddply(d, 'year', function(x){
    mean.count = mean(x$count)
    sd.count = sd(x$count)
    cv = sd.count/mean.count
    data.frame(cv.count = cv)
    })

## 만약 다른 예제로 transform 및 summarise를 동시에 사용하게 된다면?
plyr::ddply(d,'year',summarise, mean.count = mean(count))
plyr::ddply(d,'year',transform, total.count = sum(count))


### 4. data.table
### 데이터 테이블은 df와 유사하지만 보다 빠른 그룹화(grouping)와 순서화(ordering), 짦은 문장 지원 측면에서
### df보다 더 매력적이다. 하지만 무조건 빠른 것이 아니므로 특성에 맞게 사용해야 한다. 특히 64비트 환경에서 RAM이
### 충분히 많을 때는 효율적이다.

install.packages('data.table')
library(data.table)

# rnorm은 5개의 난수를 생성해줌줌
dt <- data.table(x=c('b','b','b','a','a'), v = rnorm(5))
dt

### data.table도 data.frame과 같은 방법으로 생성됨
### df와의 차이점 :: data.table의 경우 행 번호가 콜론(:)으로 프린트 되어 있어
###                  시인성과 가독성이 조금 더 좋다


data(cars)
head(cars,5)
### cars라는 df를 data.table로 변경
cars_dt<-data.table(cars)
tables()
sapply(cars_dt,class)
dt
dt[2,]
dt[dt$x=='b',]

### 데이터 테이블에 key를 지정해 해당 값으로 표시
setkey(dt,x)
dt
tables()
