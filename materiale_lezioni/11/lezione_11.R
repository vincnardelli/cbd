library(dplyr)
library(lubridate)
library(ggplot2)
online_retail <- read.csv("data/online_retail_rfm.csv")

summary(online_retail)

online_retail <- online_retail %>% 
  mutate(InvoiceDate = as_date(InvoiceDate))

ggplot(online_retail) +
  geom_bar(aes(InvoiceDate))

online_retail %>% 
  group_by(InvoiceDate) %>% 
  summarise(n=n()) %>% 
  ggplot() +
  geom_line(aes(InvoiceDate, n))

online_retail %>% 
  mutate(month = floor_date(InvoiceDate, 'month')) %>% 
  group_by(month) %>% 
  summarise(n=n()) %>% 
  ggplot() +
  geom_line(aes(month, n))

online_retail %>% 
  mutate(month = floor_date(InvoiceDate, 'month')) %>% 
  group_by(month) %>% 
  summarise(n=n()) %>% 
  ggplot() +
  geom_col(aes(month, n))


rfm <- online_retail %>% 
  group_by(CustomerID) %>% 
  summarise(Recency = as.numeric(today()- max(InvoiceDate)), 
            Frequency = n(), 
            Monetary = sum(Total)) %>% 
  mutate(R_score = ntile(desc(Recency), 4), 
         F_score = ntile(Frequency, 4),
         M_score = ntile(Monetary, 4), 
         RFM_score = R_score + F_score + M_score) %>% 
  mutate(classificazione = case_when(R_score == 4 & F_score == 4 & M_score == 4 ~ "Gold", 
                                     R_score == 1 & F_score == 1 & M_score == 1 ~ "Lost", 
                                     R_score == 4 ~ "High Spending", 
                                     F_score == 4 ~ "Loyal"))


ggplot(rfm) +
  geom_histogram(aes(Recency, fill=factor(R_score))) +
  labs(title="Recency and R score")

ggplot(rfm) +
  geom_histogram(aes(Frequency, fill=factor(F_score))) +
  labs(title="Frequency and F score")

ggplot(rfm) +
  geom_histogram(aes(Monetary, fill=factor(M_score))) +
  labs(title="Monetary and M score")

summary(rfm)

ggplot(rfm) +
  geom_bar(aes(classificazione, fill=classificazione))


rfm %>% 
  filter(!is.na(classificazione)) %>% 
  ggplot() +
  geom_bar(aes(classificazione, fill=classificazione))

rfm %>% 
  filter(!is.na(classificazione)) %>% 
  group_by(classificazione) %>% 
  summarise(Fatturato = sum(Monetary)) %>% 
  ggplot() +
  geom_col(aes(classificazione, Fatturato, fill=classificazione))

rfm %>% 
  filter(!is.na(classificazione)) %>% 
  group_by(classificazione) %>% 
  summarise(Fatturato = sum(Monetary)) %>% 
  ggplot() +
  geom_col(aes(classificazione, Fatturato, fill=classificazione)) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))
