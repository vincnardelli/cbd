library(dplyr)
library(lubridate)

data <- read.csv("data/online_retail_rfm.csv")
data <- data %>% 
  mutate(InvoiceDate = as_date(InvoiceDate))
summary(data)

rfm <- data %>% 
  mutate(Recency = as.numeric(today()- InvoiceDate)) %>% 
  group_by(CustomerID) %>% 
  summarise(Monetary = sum(Total), 
            Frequency = n(),
            Recency = min(Recency)) %>% 
  mutate(M_score = ntile(Monetary, 4), 
         F_score = ntile(Frequency, 4),
         R_score = ntile(desc(Recency), 4)) %>% 
  mutate(classificazione = case_when(R_score == 4 & F_score == 4 & M_score == 4 ~ "Gold", 
                                     R_score == 1 & F_score == 1 & M_score == 1 ~ "Lost", 
                                     F_score == 4  ~ "Loyal", 
                                     R_score == 4 ~ "Attivi",
                                     M_score == 4 ~ "High spending"))


rfm %>% 
  group_by(classificazione) %>% 
  summarise(n=n(), fatturato=sum(Monetary))
