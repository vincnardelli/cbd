library(dplyr)
library(ggplot2)
library(lubridate)
retail_rfm <- read.csv("retail_rfm.csv")
retail_rfm$InvoiceDate <- as_date(retail_rfm$InvoiceDate)

retail_rfm %>% 
  group_by(InvoiceDate) %>% 
  summarise(n=n(), fatturato = sum(Total))


retail_rfm %>% 
  mutate(mese = floor_date(InvoiceDate, "month")) %>% 
  group_by(mese) %>% 
  summarise(n=n(), fatturato = sum(Total))

rfm <- retail_rfm %>% 
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


rfm <- retail_rfm %>% 
  group_by(CustomerID) %>%
  summarise(r = as.numeric(today()-max(InvoiceDate)), 
            f=n(), 
            m=sum(Total)) %>% 
  mutate(r_score = ntile(desc(r), 4), 
         f_score = ntile(f, 4), 
         m_score = ntile(m, 4)) %>% 
  mutate(cluster=ifelse(r_score == 4 & f_score == 4 & m_score == 4, 
                        "gold", "non gold")) %>% 
  mutate(cluster = case_when(r_score == 4 & f_score == 4 & m_score == 4 ~ "Gold", 
                                     r_score == 1 & f_score == 1 & m_score == 1 ~ "Lost", 
                                     f_score == 4  ~ "Loyal", 
                                     r_score == 4 ~ "Attivi",
                                     m_score == 4 ~ "High spending"))

rfm %>% 
  group_by(cluster) %>% 
  summarise(n=n(), fatturato = sum(m))
