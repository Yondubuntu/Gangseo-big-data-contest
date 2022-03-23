Report2019 <- library(readxl)
Report2019 <- read_excel("C:/Users/woochul/Downloads/2019 Report .xlsx")
View(Report2019)

Report2019 <- Report2019 %>%slice(4,22,38,55,73,89,104,121,
                                  142,156,171,191,208,
                                  223,240,259,280,296,307,326,342,364,
                                  383,406,434)


Report2019$합계...4 <- as.numeric(Report2019$합계...4)
Report2019 <- Report2019 %>% arrange(합계...4)
View(Report2019)

ggplot(data=Report2019, aes(x=자치구, y=합계...4))+
  geom_col()+
  coord_flip()+
  ggtitle("2019년 서울특별시 독거노인 현황")+
  xlab("인구 수")+
  ylab("자치구")


plus <- bind_rows(Report2019,Report2)

ggplot(data = plus, aes(x=reorder(자치구, 합계...4), y=합계...4, fill=년도))+
  geom_col(position = "dodge")+
  scale_fill_brewer( palette = "Pastel1")+
  ggtitle("2019 ~ 2020 서울특별시 독거노인 현황")+
  xlab("자치구")+
  ylab("인구 수")+
  coord_flip()