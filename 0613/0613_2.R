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

x <- c(17, 16, 20, 24, 22, 15, 21, 18)
length(x)
x[length(x)]

y <- c(10.4, 5.6, 3.1, 6.4, 9.6, 7.8, 12.1)
length(y)
y[length(y) / 2]
