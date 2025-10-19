library(dplyr)
titanic <- read.csv("titanic.csv")
titanic$Sex      <- as.factor(titanic$Sex)
titanic$Pclass   <- as.factor(titanic$Pclass)
titanic$Embarked <- as.factor(titanic$Embarked)

summary(titanic)


# Quante persone oltre i 50 anni erano sul Titanic?
titanic %>% 
  filter(!is.na(Age), Age > 50) %>% 
  summarise(n = n())



# Quale era la percentuale di uomini e donne tra gli over 50?
titanic %>% 
  filter(!is.na(Age), Age > 50) %>% 
  group_by(Sex) %>% 
  summarise(n = n()) %>% 
  mutate(perc = n / sum(n))



# In valore assoluto ci sono più uomini tra gli over 50 o tra gli under 50? 
#    Quante donne sono under 50?
titanic %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age <= 50, "under", "over")) %>% 
  group_by(Sex, gruppo_eta) %>% 
  summarise(n = n())



# In percentuale sono sopravvissuti più passeggeri in prima o terza classe?
titanic %>% 
  group_by(Pclass) %>% 
  summarise(survived_perc = mean(Survived))



# Quale è stato il costo del biglietto minimo, medio e massimo,
#    per ogni classe e per ogni sesso?
titanic %>% 
  group_by(Pclass, Sex) %>% 
  summarise(
    Biglietto_minimo = min(Fare),
    Biglietto_medio  = mean(Fare),
    Biglietto_max    = max(Fare)
  )



# I sopravvissuti hanno pagato di più il viaggio?
titanic %>% 
  group_by(Survived) %>% 
  summarise(Biglietto_medio = mean(Fare))



# Le famiglie più numerose hanno avuto una percentuale più alta di sopravvivenza?
titanic %>% 
  group_by(SibSp) %>% 
  summarise(survived_perc = mean(Survived))



# C’è differenza nelle percentuali di sopravvivenza rispetto al porto d’imbarco?
titanic %>% 
  group_by(Embarked) %>% 
  summarise(survived_perc = mean(Survived))



# Chi ha pagato i 10 biglietti più costosi?
titanic %>% 
  arrange(desc(Fare)) %>% 
  head(10)



# Quali sono i biglietti associati a più passeggeri?
titanic %>% 
  group_by(Ticket) %>% 
  summarise(n = n()) %>% 
  filter(n > 1) %>% 
  arrange(desc(n))
