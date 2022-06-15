rep(1:3, each=3)
rep(1:3, each=3, times=2)

length(c('young', 'sik', 'park'))
nchar(c('young', 'sik', 'park'))

a <- c('young', 'sik', 'park')
substr(a, 1, 3)
substr(a, 1, 2)
toupper(a)
tolower(a)

a <- c('young, sik, park')
strsplit(a, ',')
strsplit(a, ',')[[1]]

### 실습시간 3주차 -2page 자료
ggplot2::mpg
library(ggplot2)
mpg
mpg_df <- as.data.frame(mpg)
mpg_df
mpg_df['trans']
str(mpg_df['trans'])
str(mpg['trans'])
table(mpg_df['trans'])

x <- mpg_df[['trans']]  # 벡터화 하자자
x <- mpg_df$trans

table(x)  # R에서는 count 대신 table을 씁니다. 개수를 셀 때에...

substr(x, 1, nchar(x))
substr(x, 1, nchar(x)-1)
substr(x, 1, nchar(x)-2)
table(substr(x, 1, nchar(x)-4))

### strsplit(): 문자열 처리
x <- c("New York, NY", "Ann Arbor, MI", "Chicago, IL")
y <- strsplit(x, ',')
unlist(y)  # 리스트 구조를 해제하여 벡터화

y[[2]][2]

unlist(strsplit("PARK", split = ''))
unlist(strsplit("P.A.R.K", split = '.'))  # 일번 .은 정규표현식(Reqular Expression)으로 표현됨
unlist(strsplit("P.A.R.K", split = '[.]'))
unlist(strsplit("P.A.R.K", split = '\\.'))

###  sub함수 :: lm함수와 함계 유이하게 함수 시작에서 X라는 데이터 변수가 오지 않는다.
x <- "Park hates stats, He hates math, too"
sub('hates', "loves", x)
gsub('hates', "loves", x)

### 예제1. 
y <- paste0('tomato', 1:3)
y

sub('t', "T", y)
gsub('t', "T", y)
gsub('t', "", y)
gsub('t', " ", y)

# 풀이 -1번
library(rvest)
URL <- "https://en.wikipedia.org/wiki/World_population"
web_1 <- read_html(URL)
node_1 <- html_nodes(web_1, "table")
tbl_1 <- html_table(node_1[6])
top <- tbl_1[[1]]
names(top) <- c("rank","country","pop","area","density")
str(top)

pop <- top$pop
mean(pop)

pop <- gsub(",","",pop)
mean(as.numeric(pop))

# 풀이 -2번 pipe(파이프) 기능을 활용 dpylr(즉, tidyverse 패키지 하에...)
library(tidybayes)
gsub(',',"", top$pop) -> as.nummeric() -> mean()
gsub(',',"", top$pop) %>% as.numeric() %>% mean()


### factor 및 z-score 예제...
x <- c(80,88,90,93,95,94,99,78,101)
x
x [x >= mean(x)]

### formula z
z <- (x-mean(x))/sd(x)
z
abs(z) <= 1
mean(x)

## 1표준편차 내에 존재하는 데이터
x[abs(z) <= 1]

## 2표준편차 내에 존재하는 데이터
x[abs(z) > 1 & abs(z) <= 2]

x[abs(z) > 2]


### 두번째 예제-점수를 A, B, C로 매겨보자.
## 90점 이상 -A
## 80점 이상 90점 미만 -B
## 80점 미만 -C

x <- c (80, 88, 90, 93, 95, 94, 100, 78, 65)

# 이상을 기준-1
x_1 <- (x>=0) + (x>=80) + (x>=90)
x_1
cat.x <- factor(x_1, labels = c('C', 'B', 'A'))
cat.x

# 미만을 기준-2
x_2 <- (100>=x) + (90>x) + (80>x)
x_2
cat.x2 <- factor(x_2, labels = c('A', 'B', 'C'))
cat.x2

# 이상과 미만을 기준-3
x_3 <- 1*(x>=0 & x<80) + 2*(x>=80 & x<90) + 3*(x>=90)
x_3
cat.x3 <- factor(x_3, labels = c('C', 'B', 'A'))
cat.x3

# cut함수
cat_cut <- cut(x, breaks=c(0, 80, 90, 100), include.lowest = TRUE, right = FALSE, labels=c('C', 'B', 'A'))
cat_cut

### MASS :: Cars93 데이터
# 변수 MPG.city가 30보다 큰 값을 갖는 Model은 무엇인가? 

library(MASS)
Cars93[Cars93$MPG.city>30, c('Model', 'Manufacturer')]

# 변수 Cylinders가 4이고 (1)
# Manufacturer가 Hyundai인 자동차의 Model과 (2)
# Min.Price, Max.Price의 값을 출력하라.  정의할 열

Cars93[(Cars93$Cylinders==4)&(Cars93$Manufacturer=='Hyundai'),c('Model', 'Min.Price', 'Max.Price')]

