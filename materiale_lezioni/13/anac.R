## Esercitazione Anac
library(dplyr)
library(ggplot2)
province <- read.csv("data/anac_indicatori_province.csv")
soglia_di_rischio <- 0.75

province_indicatori <- province %>% 
  group_by(ind) %>% 
  mutate("soglia"= quantile(value, soglia_di_rischio, na.rm=T),
         flag = value>soglia) %>% 
  mutate(cod_provincia = as.factor(cod_provincia))

red_flags <- province_indicatori %>% 
  group_by(cod_provincia) %>% 
  summarise(indicatori_calcolabili = n(), 
            red_flags = sum(flag, na.rm=T), 
            rapporto = red_flags/indicatori_calcolabili)

ggplot(red_flags) +
  geom_col(aes(indicatori_calcolabili, cod_provincia))

ggplot(red_flags) +
  geom_col(aes(red_flags, cod_provincia))

ggplot(red_flags) +
  geom_col(aes(rapporto, cod_provincia))

