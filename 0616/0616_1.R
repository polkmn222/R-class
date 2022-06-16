# 아래의 데이터는 실행이 안되지만,
# 아래처럼 사용하고 싶다...
z.Temp <- (Temp-mean(Temp))/sd(Temp)

z.temp <- (airquality$Temp - mean(airquality$Temp)) /sd(airquality$Temp)
# $ 변수 :: 해당 변수의 데이터를 vectorization(벡터화화)

z.temp_1 <- with(airquality, (Temp-mean(Temp))/sd(Temp))
z.temp_1

# attach()의 사용법
attach(airquality)

Temp
mean(Temp); mean(Wind)
detach(airquality)
Temp

attach(airquality)
cor(Temp, Wind)

temp <- c(1, 2, 3, 4)
temp
detach(airquality)

Temp
Wind
Solar.R

x <- c(19,35,32,27,26)
y <- c("M","M","F","F","F")
z <- c(2000,3100,3800,3600,3400)
df1 <- data.frame(age=x, gender=y, income=z)
df1

attach(df1)
income
df1$income <- c(2500, 3600, 4100, 3000, 6000)
df1

income
detach(df1)
attach(df1)
income

# 1) 변수 MPG.city가 30보다 큰 값을 갖는 Model은 무엇인가 (with를 활용!)?
library(MASS)
Cars93

# 1번 방법
with(Cars93, Cars93[MPG.city>30, 'Model'])

# 2번 방법
Cars93[Cars93$MPG.city>30, 'Model']

# 2) 변수 Cylinders가 4이고 
# Manufacturer가 Hyundai인 자동차의 Model과 
# Min.Price, Max.Price의 값을 출력하라. (attach를 활용)

# 1번 방법 - 인덱싱
Cars93[(Cars93$Cylinders==4)&(Cars93$Manufacturer=='Hyundai'), c('Model', 'Min.Price', 'Max.Price')]

# 2번 방법 - attach
attach(Cars93)
my_vars <- c('Model', 'Min.Price', 'Max.Price')
my_case <- Cylinders==4 & Manufacturer == 'Hyundai'

Cars93[my_case, my_vars]

# 3번 방법 - subset
# 1)번 문제풀이
subset(Cars93, select = Model, subset = (MPG.city>30))

# 2)번 문제풀이
subset(Cars93, select = c(Model, Min.Price, Max.Price), subset = (Cylinders==4&Manufacturer=='Hyundai'))

# 참고(슬라이싱)
subset(Cars93, select = Model:MPG.city, subset = (Cylinders==4&Manufacturer=='Hyundai'))

# 참고(제외)
subset(Cars93, select = -(Model:Origin), subset = (Cylinders==4&Manufacturer=='Hyundai'))

