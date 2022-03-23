library(dplyr)
library(ggplot2)
library(readxl)

library(readxl)
report1234 <- read_excel("R/report1234.xlsx")
View(report1234)

data <- report1234

head(data$senior,10)

new_data1 <- data%>%
  filter(년도=="2019년")%>%
  group_by(자치구)%>%
  arrange(desc(senior))%>%
  head(5)

new_data1

new_data2 <- data%>%
  filter(년도=="2020년")%>%
  group_by(자치구)%>%
  arrange(desc(senior))%>%
  head(5)

new_data2

new_data3 <- data%>%
  filter(년도=="2021년")%>%
  group_by(자치구)%>%
  arrange(desc(senior))%>%
  head(5)

new_data3

bind_rows(new_data1,new_data2,new_data3)

newdata4 <- bind_rows(new_data1,new_data2,new_data3)



ggplot(data = newdata4, aes(x=자치구, y=senior, fill=년도))+
  geom_col(position = "dodge")+
  ggtitle("만 65세이상 인구 수")+
  xlab("자치구")+
  ylab("인구 수")


ggplot(data = newdata4, aes(x=reorder(자치구,-senior),y=senior, fill=년도))+
  geom_col(position = "dodge")+
  scale_fill_brewer( palette = "Set2")+
  ggtitle("만 65세이상 인구 수")+
  xlab("자치구")+
  ylab("인구 수")+
  coord_cartesian(ylim = c(70000,NA))





