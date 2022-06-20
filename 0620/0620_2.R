### EDA - 일변량 탐색 (y값이 하나)

str(state.region) # Factor 순서가 존재하는 문자데이터


ggplot(data.frame(state.region)) + geom_bar(aes(x=state.region)) + labs(x='region_0620') + coord_flip()
# coord_flip을 사용하면 가로맥다

### 도수분포표인 데이터
cnts <- table(state.region)
cnts

df_1 <- as.data.frame(cnts)
df_1

ggplot(df_1, aes(x=state.region, y=Freq)) + geom_col(fill='darkgreen') + coord_flip() 

library(UsingR)
alltime.movies

# 글로벌 매핑
bp <- ggplot(alltime.movies, aes(x="", y=Gross)) + geom_boxplot()

my_out <- ggplot_build(bp)$data[[1]]$outliers[[1]]
my_out

alltime.movies%>%rownames_to_column()%>%head()

as_tibble(alltime.movies)

alltime_title <- rownames_to_column(alltime.movies, var='movie_title')%>%as_tibble()
top_movies <- alltime_title%>%filter(Gross %in% my_out)

top_movies

## cfb 데이터를 통해 치우친 그래프 모양
## 정규화 시도 (log_scaling)

ggplot(cfb, aes(x=INCOME, y= stat(density))) + geom_histogram(bins=35, fill='blue') + geom_density(color = 'red')

### 그냥 log를 하면 최소값이 무한대가 나옴
## 1을 더해주는 log를 취함

log_INCOME_1p <- log(cfb$INCOME+1)
log_INCOME_1p

ggplot(data.frame(log_INCOME_1p), aes(x=log_INCOME_1p, y= stat(density))) + geom_histogram(bins=35, fill='blue') + geom_density(color = 'red')


##      - 다변량 탐색 (y값이 2개 이상)
mpg%>%group_by(cyl)%>%summarise(n=n())  # groupby를 활용하여 데이터 조회
                                        # 5기통 데이터를 제거할 계획

mpg_1 <- mpg%>%filter(cyl!=5)

ggplot(mpg_1, aes(x=hwy, fill = factor(cyl))) + geom_histogram(binwidth = 5, alpha = 0.4)

ggplot(mpg_1, aes(x=hwy)) + geom_histogram(binwidth = 5) + facet_wrap(~cyl)

ggplot(mpg_1, aes(x=factor(cyl), y=hwy)) + geom_boxplot()

# geom_jitter
ChickWeight
p1 <- ggplot(ChickWeight, aes(x=Time, y=weight))
p1 + geom_point() + geom_jitter(width = 0.4)

p1 + geom_boxplot(aes(group=Time))

# 상자그림과 jitter를 같이 활용
p1 + geom_jitter(width = 0.1, fill='red', shape=21) + geom_boxplot(aes(group=Time), outlier.shape = NA ,fill=NA, color='blue')

