library(dplyr)
data <- read.csv("ecommerce.csv")

summary(data)

data$Gender <- as.factor(data$Gender)
data$ProductCategory <- as.factor(data$ProductCategory)

summary(data)

data2 <- data[,c("CustomerID", "Age")]
data3 <- data[data$Age < 35 & !is.na(data$Age),]
data4 <- data[data$Age < 35 & !is.na(data$Age),c("CustomerID", "Age")]


data5 <- select(data, CustomerID, Age)
filter(data5, Age < 35)
filter(select(data, CustomerID, Age), Age < 35)


data %>% 
  select(CustomerID, Age) %>% 
  filter(Age<35)


filter(select(data, CustomerID, Age), Age < 35)


data %>% 
  select(CustomerID, Age) %>% 
  mutate(gruppo_eta = ifelse(Age < 35, "Giovane", "Adulto")) %>% 
  filter(!is.na(Age))


data %>% 
  select(CustomerID, Age) %>% 
  mutate(gruppo_eta = ifelse(Age < 35, "Giovane", "Adulto")) %>% 
  filter(!is.na(Age)) %>% 
  summarise(n=n())


data_summary <- data %>% 
  select(CustomerID, Age) %>% 
  mutate(gruppo_eta = ifelse(Age < 35, "Giovane", "Adulto")) %>% 
  filter(!is.na(Age)) %>% 
  group_by(gruppo_eta) %>% 
  summarise(n=n())





