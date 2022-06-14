abc <- array(1:24, c(3, 4, 2))
abc <- abc[,,1]
str(abc[, 3])
str(c(7, 8, 9))

abc[,2:3]

### 문제 1. 다음의 행렬을 생성하라.
q1_data <- c(12, 17, 19, 21, 22, 25, 32, 34, 35)
dim(q1_data) <- c(3, 3)
q1_data

q1_matrix <- matrix(q1_data, ncol=3)  # ncol = 3 대신에 c(3, 3)
                                      # R은 forgiven language

rownames(q1_matrix) <- c('case#1', 'case#2', 'case#3')
colnames(q1_matrix) <- c('var1', 'var2', 'var3')
q1_matrix
q1_matrix[,'var2']
# str(as.data.frame(q1_matrix))

q1_df <- as.data.frame(q1_matrix)
q1_df['var2']

### data.frame의 자료구조
q1_df <- as.data.frame(q1_matrix)
q1_df $ var1; q1_df[['var1']]; q1_df[[1]]; q1_df[,1]; q1_df[,'var1']


q1_df[c(1, 2), 1]
q1_df[c(1, 2), 'var1']  # 조건은 행, 열의 자리는 컬럼명 혹은 컬럼의 위치


### 문제 다음의 데이터프레임 생성
### 18page

### 1번
q1_df  ### 행렬의 데이터를 as.data.frame을 통해서 가져오실 수 있다.
q1_df[3]; q1_df['var3']

### 2번
q1_df[[3]]; q1_df[['var3']]; q1_df[, 3]; q1_df[, 'var3']; q1_df$var3

### 19page -7번
str(iris)
names(iris)
head(iris, 3)


### 19page -8번
str(trees)
names(trees)
tail(trees, 3)

### list의 자료구조
list(-1, 2)
list('a', 'b')
list(A='a', B='b')

x <- list(a=c("one","two","three"), b=1:3, c=list(-1,-5), 
          d=data.frame(x1=c("s1","s2"),x2=1:2))
x
x$c[[2]]  # -5
x_df <- x$d
x_df[1, 'x1'] # s1
x$d[1, 'x1']  # s1

str(q1_df)
