library(dplyr)
library(readr)
library(ggplot2)
library(lubridate)
online_retail_rfm <- read_csv("online_retail_rfm.csv")

summary(online_retail_rfm)

online_retail_rfm$CustomerID <- as.factor(online_retail_rfm$CustomerID)


ggplot(data=online_retail_rfm) +
  geom_bar(aes(InvoiceDate))


acquisti_giornalieri <- online_retail_rfm %>% 
  group_by(InvoiceDate) %>% 
  summarise(n=n())

ggplot(data=acquisti_giornalieri) +
  geom_line(aes(x=InvoiceDate, y=n))

online_retail_rfm %>% 
  group_by(InvoiceDate) %>% 
  summarise(n=n()) %>% 
ggplot() +
  geom_line(aes(x=InvoiceDate, y=n))



online_retail_rfm %>% 
  mutate(mese = floor_date(InvoiceDate, "month")) %>% 
  group_by(mese) %>% 
  summarise(n=n(), fatturato = sum(Total)) %>% 
  ggplot() +
  geom_line(aes(x=mese, y=fatturato))


rfm <- online_retail_rfm %>% 
  group_by(CustomerID) %>%
  summarise(r = as.numeric(today()-max(InvoiceDate)), 
            f=n(), 
            m=sum(Total)) %>% 
  mutate(r_score = ntile(desc(r), 4), 
         f_score = ntile(f, 4), 
         m_score = ntile(m, 4)) %>% 
  mutate(cluster=ifelse(r_score == 4 & f_score == 4 & m_score == 4, 
                        "gold", "non gold"))


rfm %>% 
  group_by(cluster) %>% 
  summarise(n=n(), fatturato = sum(m))



