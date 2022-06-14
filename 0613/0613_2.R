# 벡터(Vector) :: 특성 - 자료형이 다 같다

x <- c(FALSE, TRUE, FALSE)
x

y1 <- c(2L, 4L, 8L)
y1

y2 <- c(2.2, 3.3, 4.4)

z <- c('a', 'b', 'c')

typeof(x);typeof(y1);typeof(y2);typeof(z)

# 데이터의 길이 :: python :: len
#                  R에서는 length

length(y1)


## 실습 1.
z1 <- c(TRUE, 2L, 1.1, 4.5)
z1

## 실습 2.
z2 <- c(3, TRUE, FALSE)
z2

## 실습 3.
z3 <- c(3, TRUE, FALSE, 'T')
z3

# 벡터의 구성요소에 이름 붙이기
test <- c(seoul = 9930, busan = 3497, inchon = 2944, suwon = 1194)

### 참고 df vs 벡터
typeof(test)
str(test)

str(as.data.frame(test))  # 벡터의 이름이 컬럼이 되는 하나의 열이 됩니다.

# 데이터를 먼저 assign(할당)한 후 이름 붙이기
pop <- c(9930, 3497, 2944, 1194)
names(pop) <- c('seo', 'b', 'i', 'su')
pop

## 벡터의 인덱싱(Indexing)
y <- c(2, 4, 6, 8, 10)
y[3]  # 1차원데이터
y[c(3, 3, 3)]  # 6을 3번 뽑고 싶을 때때

y[c(1, 3, 5)]  # 2, 6, 10만 뽑힌다 -1
y[c(-2, -4)]   # 인덱싱에서 2번째와 4번째 값을 제외

y[100]

# 논리형 벡터의 인덱싱
y
y[c(FALSE, TRUE, FALSE, TRUE, FALSE)]

y > 5
y[y > 5]

## 
## 1번 문제

x <- c(17, 16, 20, 24, 22, 15, 21, 18)
length(x)
x[length(x)]

## 2번문제
y <- c(10.4, 5.6, 3.1, 6.4, 9.6, 7.8, 12.1)
length(y)
y[length(y) - 2]
tail(y, 3)

## 1부터 100까지의 데이터가 존재한다.
## 나는 50보다 큰 값을 구하고 싶다
## 3775가 나와야 한다
c(1, 2, 3, 4, 5); 1:5

# hint는 인덱싱 후
# why 그냥 sum을 하면 50이라는 숫자가 출력되었을까?
x <- 1:100
sum(x[x > 50])

# step 1 - 50보다 크다라는 조건을 생성
x>50

# step 2 - 위의 조건에 해당하는 값을 indexing한다
cond1 <- x[x > 50]

# step 3 - sum함수를 통해 더한다
sum(cond1)


## matrix vs data.frame
ma_a <- matrix(1:12, c(3, 4))

df_a <- as.data.frame(matrix(1:12, c(3, 4)))

length(ma_a); length(df_a)
# 이유가 뭘까요???