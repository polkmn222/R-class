library(tidyverse)
library(ggplot2)
mpg
table(mpg$drv)
table(mpg$fl)

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy))

ggplot(data=mpg) + geom_bar(mapping = aes(x=drv))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, color = class))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, shape = drv))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, size = cyl))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, color = class, shape = drv, size = cyl))


## facet_wrap()에 의한 faceting

ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy)) + facet_wrap(~class)

### 패널 배치 조절
## 2 X 3 -> 3 X 2

pp <- mpg%>%filter(class != '2seater')%>%ggplot()+geom_point(mapping = aes(x=displ, y=hwy))
pp + facet_wrap(~class, ncol=2)
pp + facet_wrap(~class, ncol=2, dir='v')

## facet_grid()에 의한 faceting
my_plot <- mpg%>%filter(cyl!=5, drv!='r')%>% ggplot()+geom_point(aes(x=displ, y=hwy))

my_plot + facet_wrap(drv~.)
my_plot + facet_grid(drv~.)
my_plot + facet_grid(.~cyl)

# drv~cyl을 결합해본다.

my_plot + facet_grid(drv~cyl)

## 회귀분석 시각화
ggplot(data=mpg) + geom_smooth(aes(x=displ, y=hwy)) +geom_point(aes(x=displ, y=hwy))

## 회귀분석 시각화 -1 글로벌
ggplot(data=mpg, mapping = aes(x=displ, y=hwy))  + geom_point(aes(color=drv)) + geom_smooth()

## 회귀분석 시각화 -2 로컬
ggplot(data=mpg, mapping = aes(x=displ, y=hwy, color = drv))  + geom_point() + geom_smooth(se=FALSE)
