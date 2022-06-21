# 단순선형회귀
# y는 1개
# x도 1개

# 다중선형회귀
# y는 1개 x는 여러개

# 행렬 state.x77
# 미국의 50개의 주 (row),
# 관련된 8개의 변수

str(state.x77)
states <- as.data.frame(state.x77)
str(states)
cor(states)

## 기본적으로 선형회귀식을 위한 lm 함수는
## df를 입력값으로 받는다...

## combine 함수를 기억해주시고
## 뒤에 오는 변수명이 새 변수명으로 지정됩니다.

library(reshape)
names(states)
states <- reshape::rename(states, c('Life Exp' = 'Life_Exp', 'HS Grad'='HS_Grad'))
states

head(states)

cor(states)

## 가시성과 시인성을 높이기 위해
## 패키지 GGally의 함수 ggcorr()을 사용해본다

# 상관계수는
# 스피어만 vs 피어슨 :: 비교하려고 하는 대상이 모두 연속형자료여야 한다.
# 대상이       
# 서열척도     

install.packages('GGally')
library(GGally)

# Murder를 가장 왼쪽의 컬럼으로 정렬하기 위해
# dplyr의 select를 활용한다.
states <- dplyr::select(states, Murder, everything())

ggcorr(states, label = TRUE, label_round = 2)  # pearson이 default // spearman이 기본이 아닙니다.

ggpairs(states)
ggpairs(states, lower=list(continuous = 'blank') , upper = list(continuous = wrap('smooth_loess', se=FALSE)))


### leaps라고 하는 패키지를 활용해본다.
install.packages('leaps')
library(leaps)
fits <- regsubsets(Murder~., states)
summary(fits)

### 위의 결과로는 적절한 x변수의 개수를
### 선정하기 어려우므로 plot을 그려서
### 적절한 X변수의 개수를 확인할 수 있는지
### 점검해본다.

plot(fits, scale = 'adjr2')

### 위의 결과로 보니 adjr2의 경우 
### 같은 값을 갖게 하는 변수들의 조합이 매우 많았다.

### 이에 따라 AIC와 BIC라고 하는 Error를 기준으로 한(즉, 값이 작을수록 좋은)
### 지표로 평가를 수행한다.

2 * 7  # states의 설명변수는 7

7 * log(50) # states의 설명 변수는 7, n= 전체 관측치의 수

### AIC를 적용하는 과정 -1) 전진선택법, 2) 후진소거법, 3) 단계적선택법
library(MASS)
fit_full <- lm(Murder ~., states)
fit_full
fit <- lm(Murder ~ 1, states)
fit

### AIC를 적용한다.
stepAIC(fit, scope = formula(fit_full))  ## 전진선택법
stepAIC(fit_full, trace=FALSE)  ## 후진선택법


### BIC를 적용한다.
stepAIC(fit, k=log(nrow(states)))  ## 전진선택법
stepAIC(fit_full, k=log(nrow(states)))  ## 후진선택법

### end of file

