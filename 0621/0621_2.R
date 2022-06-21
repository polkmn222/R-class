### 1.Data Mart
## data reshape
install.packages('reshape2')
library(reshape)
library(reshape2)
library(tidyverse)

airquality%>%head()
names(airquality) <- airquality%>%names()%>%tolower()
names(airquality)

## melt 함수를 통한 데이터 열 해제
aqm <- melt(airquality, id=c('month', 'day'), na.rm=TRUE)
aqm%>%head()

## cast 함수를 통해 데이터를 다시 구성
a <- cast(aqm, day~month~variable) # variable의 각 값을 기준으로 하여 데이터를 재구성 하고 싶을때
                                   # 3차원 데이터
a

cast(aqm, day~month)
airquality%>%head()

b <- cast(aqm, month~variable, mean)
b

# variable 구분자를 안넣는다면? -1
C1 <- cast(aqm, month~., mean)
C1

## 2. sqldf 맛보기
install.packages('sqldf')
library(sqldf)
sqldf("select * from iris")  # sql문을 직접 호출

# Oracle의 numrows처럼 limit을 정의 및 행의 개수를 호출
sqldf("select * from iris limit 10")

# like 문장을 사용해보자.
sqldf("select count(*) from iris where Species like 'se%'")
sqldf("select * from iris where Species like 'se%'")
