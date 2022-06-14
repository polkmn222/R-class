#1. scalar :: 스칼라
a <- 168
a <- c(168)
a

# 2. vector :: 벡터  = 스칼라 + 스칼라
big <- c(168, 178, 185)  # 1차원
big
big[1]  # indexing시 최소 필요첨자가 1개이면 족하기 때문입니다.

# 1차원
# ----------------------------------------------------------
# 2차원

# 3. matrix :: 매트릭스 = 벡터 + 벡터
big
adsp <- c(155, 149, 167)
adsp

c(big, adsp)

test_ma <- matrix(c(big, adsp), ncol = 2)
test_ma
test_ma[3, 2]  # 167
test_ma[2,]    # 178, 149
test_ma[,2]    # 못 가져옴... 155 149 167

# 자료구조 확인
str(test_ma)
length(test_ma)

char_1 <- c('a', 'b', 'c')
c(test_ma, char_1)

test_ma

# 4. array :: 배열  = 매트릭스 + 매트릭스
c(1, 2, 3); 1:24
test_array <- array(1:24 , c(3, 4, 2))
test_array

### 1번 방식
array_2d <- test_array[,,1]
array_2d[3, 4]

### 2번 방식
test_array[3, 4, 1]
str(test_array)
length(test_array)


# 5. data.frame :: 데이터 프레임
test_df <- as.data.frame(test_ma)
str(test_df)
length(test_df)

## 데이터 프레임 다운그레이드(저만의 용어)
test_df['V1']
str(test_df['V1'])
test_df[['V1']]
str(test_df[['V1']])  # data.frame -> vector

test_df[['V1']][2] <- 185  # 벡터화
test_df

read.csv()