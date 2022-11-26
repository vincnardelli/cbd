## Esercitazione Anac
library(dplyr)
library(ggplot2)

# province <- province %>% 
#   pivot_longer(ind1:ind8, names_to = "ind")
# 
# to_remove <- province %>% 
#   group_by(cod_provincia) %>% 
#   summarise(n = n()) %>% 
#   filter(n > 8) %>% 
#   pull(cod_provincia)
# 
# province <- province %>% 
#   filter(!(cod_provincia %in% to_remove)) 
# 
# write.csv(province, "anac_indicatori_province.csv", row.names = F)

province <- read.csv("~/Desktop/anac_indicatori_province.csv")
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

