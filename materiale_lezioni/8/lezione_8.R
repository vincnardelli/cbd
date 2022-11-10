# install.packages("tidyverse")
library(tidyverse)

titanic <- read.csv("data/titanic.csv")
summary(titanic)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Embarked <- as.factor(titanic$Embarked)
summary(titanic)


titanic[, c("PassengerId", "Age")]
head(titanic[, c("PassengerId", "Age")])

titanic[titanic$Age < 18, ]

titanic[titanic$Age < 18, c("PassengerId", "Age")]

titanic[titanic$Age < 18 & titanic$Pclass == 1, c("PassengerId", "Pclass", "Age")]

titanic[!is.na(titanic$Age) & titanic$Age < 18 & titanic$Pclass == 1, c("PassengerId", "Pclass", "Age")]

select(titanic, PassengerId, Age)
filter(titanic, Age < 18)

filter(select(titanic, PassengerId, Age), Age <18)


titanic %>% 
  select(PassengerId, Age) %>% 
  filter(Age < 18)


titanic %>% 
  select(PassengerId, Age) %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age < 18, 'Minor','Major'))


titanic %>% 
  select(PassengerId, Age) %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age < 18, 'Minor','Major')) %>% 
  arrange(Age)





titanic %>% 
  select(PassengerId, Survived, Sex) %>% 
  group_by(Sex) %>% 
  summarise(survived = n())


titanic %>% 
  select(PassengerId, Survived, Sex) %>% 
  group_by(Sex) %>% 
  summarise(survived_perc = mean(Survived))


titanic %>% 
  select(PassengerId, Survived, Age) %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age < 18, 'Minor','Major')) %>% 
  group_by(gruppo_eta) %>% 
  summarise(survived_perc = mean(Survived))


titanic %>% 
  select(PassengerId, Survived, Age, Sex) %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age < 18, 'Minor','Major')) %>% 
  group_by(gruppo_eta, Sex) %>% 
  summarise(survived_perc = mean(Survived))