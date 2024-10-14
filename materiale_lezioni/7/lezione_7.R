# Carica le librerie necessarie
library(dplyr)
library(readr)

# Legge il dataset Titanic da un file CSV
titanic <- read.csv("titanic.csv")

# Mostra un riassunto del dataset, con statistiche base per ogni colonna
summary(titanic)

# Converte alcune colonne in fattori per indicare variabili categoriche
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

# Mostra nuovamente un riassunto per vedere le modifiche
summary(titanic)

# Seleziona solo le colonne PassengerId e Age e crea un nuovo dataset
titanic2 <- titanic[, c("PassengerId", "Age")]

# Filtra il dataset per i passeggeri minorenni (sotto i 18 anni) e senza valori mancanti in Age
titanic3 <- titanic[titanic$Age < 18 & !is.na(titanic$Age),]

# Filtra solo i minorenni e seleziona le colonne PassengerId e Age
titanic4 <- titanic[titanic$Age < 18 & !is.na(titanic$Age), c("PassengerId", "Age")]

# Filtra per i minorenni di prima classe e seleziona le colonne PassengerId, Age e Pclass
titanic5 <- titanic[titanic$Age < 18 & !is.na(titanic$Age) & titanic$Pclass == "1", c("PassengerId", "Age", "Pclass")]

# Seleziona le colonne PassengerId e Age usando la funzione select
select(titanic, PassengerId, Age)

# Filtra il dataset per i minorenni usando la funzione filter
filter(titanic, Age < 18)

# Combina select e filter per ottenere solo PassengerId e Age dei minorenni
filter(select(titanic, PassengerId, Age), Age < 18)

# Usa la pipe (%>%) per selezionare PassengerId e Age e filtrare per minorenni
titanic %>% 
  select(PassengerId, Age) %>% 
  filter(Age < 18)

# Usa mutate per creare una nuova colonna gruppo_eta che distingue tra minorenni e maggiorenni
titanic %>% 
  select(PassengerId, Age) %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age < 18, "Minorenne", "Maggiorenne"))

# Conta il numero di minorenni e maggiorenni
titanic %>% 
  select(PassengerId, Age) %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age < 18, "Minorenne", "Maggiorenne")) %>% 
  count(gruppo_eta)

# Raggruppa per gruppo_eta e calcola il totale per ogni gruppo
titanic %>% 
  select(PassengerId, Age) %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age < 18, "Minorenne", "Maggiorenne")) %>% 
  group_by(gruppo_eta) %>% 
  summarise(n=n())

# Calcola la media del prezzo del biglietto (Fare)
mean(titanic$Fare)

# Raggruppa per gruppo_eta e Pclass e calcola la media, il minimo e il massimo del prezzo del biglietto
titanic %>% 
  select(PassengerId, Pclass, Age, Fare) %>% 
  filter(!is.na(Age)) %>% 
  mutate(gruppo_eta = ifelse(Age < 18, "Minorenne", "Maggiorenne")) %>% 
  group_by(gruppo_eta, Pclass) %>% 
  summarise(media_biglietto = mean(Fare), minimo = min(Fare), massimo = max(Fare))