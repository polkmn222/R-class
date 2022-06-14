URL <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'

iris_data <- read.csv(URL, header=FALSE)

names(iris_data) <- c('s.len', 's.wid', 'p.len', 'p.wid', 'species')
iris_data


### 웹의 데이터 호출
install.packages('rvest')

library(rvest)

## URL 가져오기
wiki_url <- "https://en.wikipedia.org/wiki/World_population"

# html 코드 분석
web <- read_html (wiki_url)
tbl <- html_nodes(web, "table")

## 결과 table 생성 - 노드를 아는 경우...
result1 <- html_table(tbl[6])
result1  # tibble
result1 <- result1[[1]]
names(result1) <- c('rank', 'country', 'pop', 'area', 'density')

result1
result_df <- as.data.frame(result1)
result_df

mean(as.numeric(gsub(',', "",result_df$pop)))
library(dplyr)

### 만약 원하는 노드를 모른다면?
### Xpath를 활용해본다

## URL 가져오기
wiki_url <- "https://en.wikipedia.org/wiki/World_population"

# html 코드 분석
web_2 <- read_html (wiki_url)
tbl_2<-html_nodes(web_2,xpath='//*[@id="mw-content-text"]/div[1]/table[5]')
tbl_2_res <- html_table(tbl_2)

### 이하 코드는 위의 방법 이후에 1번째 방식과
### 돌일하게 적용하주시면 됩니다.
tbl_2_res
result2 <- tbl_2_res[[1]]
result2_df <- as.data.frame(result2)
