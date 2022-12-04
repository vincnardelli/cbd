# install.packages("tidyverse")
library(tidyverse)
titanic <- read.csv("data/titanic.csv")
titanic$Sex <- as.factor(titanic$Sex)
titanic$Pclass <- as.factor(titanic$Pclass)


# Filtri
Pclass_subset <- as.factor(c("1", "2", "3"))
Age_min <- 0
Age_max <- 100


# Grafico
titanic %>% 
  filter(!is.na(Age), Pclass %in% Pclass_subset, 
         Age > Age_min, Age < Age_max)  %>% 
  group_by(Pclass, Sex) %>% 
  summarise(survived_perc = mean(Survived)) %>% 
  ggplot() +
  geom_col(aes(Pclass, survived_perc, fill=Sex), position="dodge")


# Tabella
titanic %>% 
  filter(!is.na(Age), Pclass %in% Pclass_subset, 
         Age > Age_min, Age < Age_max) %>% 
  select(Pclass, Sex, Fare) %>% 
  group_by(Pclass, Sex) %>% 
  summarise(n = n(),
            Biglietto_minimo = min(Fare),
            Biglietto_medio = mean(Fare), 
            Biglietto_max = max(Fare))
