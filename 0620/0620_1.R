 # tidyverse 패키지...
library(tidyverse)
ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y = hwy))

### setting 및 mapping
ggplot(mpg) + geom_point(mapping = aes(x=displ, y = hwy), color = 'blue')

##mapping
ggplot(mpg) + geom_point(mapping = aes(x=displ, y = hwy, color = 'blue'))


### Facet_wrap :: 한 변수에 의한 facet
ggplot(mpg) + geom_point(aes(x=displ, y=hwy)) + facet_wrap(~class)

## 2seater를 제외하고 다시금 facet_wrap
ggplot(filter(mpg, class != '2seater')) + geom_point(aes(x=displ, y=hwy)) + facet_wrap(~class)


mpg%>%filter(class != '2seater') %>%ggplot() + geom_point(aes(x=displ, y=hwy)) + facet_wrap(~class)


# 패널 배치 조절
pp <- mpg%>%filter(class != '2seater') %>%ggplot() + geom_point(aes(x=displ, y=hwy)) + facet_wrap(~class)

pp + facet_wrap(~class, ncol=2)
# 그래프 배치 순서를 열 단위로 수정 dir='v'
pp + facet_wrap(~class, ncol=2, dir='v')

### Facet_grid :: 한 변수 또는 두 변수에 의한 facet

# cylinder 5가 많이 존재하지 않음
mpg$cyl%>%table()

# drv r이 많이 존재하지 않음
mpg$drv%>%table()

my_plot <- mpg%>%filter(cyl != 5, drv != 'r')%>%ggplot() + geom_point(aes(x= displ, y = hwy))

# drv를 row
my_plot + facet_grid(drv~.)

# cyl를 col
my_plot + facet_grid(.~cyl)

## drv와 cyl를 결합해서 사용하면
my_plot + facet_grid(drv~cyl)






