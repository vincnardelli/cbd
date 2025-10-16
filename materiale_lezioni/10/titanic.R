# install.packages("tidyverse")
library(tidyverse)

titanic <- read.csv("titanic.csv")
summary(titanic)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Embarked <- as.factor(titanic$Embarked)
summary(titanic)


titanic %>% 
  select(PassengerId, Sex, Age) %>% 
  filter(!is.na(Age), Age > 50) %>% 
  group_by(Sex) %>% 
  summarise(conteggio=n())



# 1
titanic %>% 
  select(PassengerId, Age, Sex) %>% 
  filter(Age > 50) %>% 
  group_by(Sex) %>% 
  summarise(n=n()) %>% 
  mutate(perc=n/sum(n))




titanic %>% 
  select(Age, Sex) %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age < 50, "under", "over")) %>% 
  group_by(Sex, gruppo_eta) %>% 
  summarise(n=n())
  



# 2
titanic %>% 
  filter(Age > 50) %>% 
  group_by(Sex) %>% 
  summarise(n=n())



titanic %>% 
  select(PassengerId, Age, Sex) %>% 
  filter(Age > 50) %>%
  group_by(Sex) %>% 
  summarise(n=n()) %>% 
  mutate(perc=n/sum(n))


titanic %>% 
  select(PassengerId, Age, Sex) %>% 
  filter(Age > 50) %>%
  group_by(Sex) %>% 
  summarise(n=n(), 
            total = nrow(.), 
            perc=n/total)





# 3
titanic %>% 
  select(Age, Sex) %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age <= 50, 'under','over')) %>%
  group_by(Sex, gruppo_eta) %>% 
  summarise(n=n())






titanic %>% 
  select(Pclass, Survived) %>% 
  group_by(Pclass) %>% 
  summarise(p=mean(Survived))



titanic %>% 
  select(Sex, Pclass, Fare) %>% 
  group_by(Pclass, Sex) %>% 
  summarise(min=min(Fare), media=mean(Fare), max=max(Fare))

# 4
titanic %>% 
  select(Age, Sex, Pclass, Survived) %>% 
  group_by(Pclass) %>% 
  summarise(survived_perc = mean(Survived))


# 5
titanic %>% 
  select(Pclass, Sex, Fare) %>% 
  group_by(Pclass, Sex) %>% 
  summarise(Biglietto_minimo = min(Fare),
            Biglietto_medio = mean(Fare), 
            Biglietto_max = max(Fare))


summary(titanic)

# 6
titanic %>% 
  select(Survived, Fare) %>% 
  group_by(Survived) %>% 
  summarise(Biglietto_medio = mean(Fare))







# 7
titanic %>% 
  group_by(SibSp) %>% 
  summarise(survived_perc = mean(Survived))

# 8
titanic %>% 
  group_by(Embarked) %>% 
  summarise(survived_perc = mean(Survived))

# 9
titanic %>% 
  arrange(desc(Fare)) %>% 
  head(10)

# 10
titanic %>% 
  group_by(Ticket) %>% 
  summarise(n=n()) %>% 
  filter(n > 1) %>% 
  arrange(desc(n))
