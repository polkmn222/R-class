library(tidyverse)
women

ggplot(women, aes(x=height, y=weight)) + geom_point()

plot(women)

## 단순선형회귀식
# X값이 1개
# y값이 1개

fit <- lm(weight~height, data = women)

abc <- c('1,234,567', '8,910,112', '3,456,789')
gsub(',', '', abc)

# weight = 3.45 * height -87.52
fit$residuals

# 선정독등비
# 선형성가정 - 상관관계
# 정규성가정 - qq플롯
# 독립성가정 - 오차항 독립성가정
# 등분산성가정 - 잔차 등분산성
# 다중공선성
# multicolinearity, multi-colinearity

states <- as.data.frame(state.x77)
states

df1_test <- data.frame(x1=c(1, 2, 3), y1=c('a', 'b', 'c'))
names(df1_test) <- c('A')  # 의도치 않게 결측치를 만듬
df1_test

### rename을 쓰기위한 library 호출
install.packages('reshape')
library(reshape)
names(states)

states <- rename(states, c('Life Exp' = 'Life_Exp', 'HS Grad' = 'HS_Grad'))
names(states)

## rename 참고
#Cars93_subset <- rename(Cars93_subset, 
#                        c(V1 = "V1_Manufacturer", 
#                          V2 = "V2_Model",
#                          V3 = "V3_Type", 
#                          V4 = "V4_Min.Price", 
#                          V5 = "V5_Price"))



cor(states)

