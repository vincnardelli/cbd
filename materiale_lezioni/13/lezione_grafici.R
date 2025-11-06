library(dplyr)
library(ggplot2)
library(forcats)
data <- read.csv("business_intelligence.csv")

# =====================================
# UNA VARIABILE CONTINUA
# =====================================

# Distribuzione del fatturato
ggplot(data, aes(x=fatturato)) +
  geom_histogram()

ggplot(data) +
  geom_histogram(aes(x=fatturato))

# Filtro per categoria specifica
data %>% 
  filter(valutazione_clienti > 4) %>% 
  ggplot() +
  geom_histogram(aes(x=fatturato), bins=10)

# Istogramma con categorie colorate
summary(data$fatturato)
ggplot(data, aes(fatturato, fill=categoria)) +
  geom_histogram()


ggplot(data) +
  geom_density(aes(x=fatturato))


# =====================================
# UNA VARIABILE DISCRETA
# =====================================

# Distribuzione per fascia qualità
table(data$fascia_qualita)
ggplot(data, aes(fascia_qualita)) +
  geom_bar()

ggplot(data, aes(categoria)) +
  geom_bar()

ggplot(data, aes(categoria, fill=fascia_qualita)) +
  geom_bar()

ggplot(data, aes(categoria)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))

ggplot(data, aes(categoria)) +
  geom_bar() +
  coord_flip()


# Ordinamento per frequenza
ggplot(data, aes(fct_infreq(categoria))) +
  geom_bar() +
  coord_flip()

ggplot(data, aes(fct_rev(fct_infreq(categoria)))) +
  geom_bar() +
  coord_flip()

# =====================================
# DUE VARIABILI CONTINUE
# =====================================

# Relazione prezzo vs unità vendute
ggplot(data, aes(prezzo, unita_vendute)) +
  geom_point()

ggplot(data, aes(prezzo, unita_vendute, color=categoria)) +
  geom_point()


ggplot(data, aes(prezzo, unita_vendute, size = tasso_reso, color=categoria, alpha=tasso_reso)) +
  geom_point()

ggplot(data, aes(prezzo, unita_vendute, shape = disponibilita)) +
  geom_point()

ggplot(data, aes(prezzo, fatturato)) +
  geom_point()

ggplot(data, aes(prezzo, fatturato)) +
  geom_point() +
  geom_smooth(method="lm")

ggplot(data, aes(prezzo, fatturato)) +
  geom_point() +
  geom_smooth()


# =====================================
# DUE VARIABILI: DISCRETA vs CONTINUA
# =====================================

# Fatturato medio per categoria
df_medie <- data %>%
  group_by(categoria) %>%
  summarize(fatturato_medio = mean(fatturato))

ggplot(df_medie, aes(x = categoria, y = fatturato_medio)) +
  geom_col()

ggplot(df_medie, aes(x = fct_reorder(categoria, fatturato_medio), y = fatturato_medio)) +
  geom_col()

# Boxplot fatturato per categoria
ggplot(data, aes(categoria, fatturato)) +
  geom_boxplot()

ggplot(data, aes(fct_reorder(categoria, fatturato, median), fatturato)) +
  geom_boxplot()


# Fatturato medio per categoria
df_medie_qualita <- data %>%
  group_by(categoria, fascia_qualita) %>%
  summarize(fatturato_medio = mean(fatturato)) %>% 
  mutate(fascia_qualita = factor(fascia_qualita, levels=c("Economico", "Standard", "Premium")))

ggplot(df_medie_qualita, aes(x = categoria, y = fatturato_medio)) +
  geom_col() +
  facet_grid(cols=vars(fascia_qualita)) +
  theme(axis.text.x = element_text(angle = 90))



ggplot(data, aes(categoria, fatturato)) +
  geom_boxplot()+ 
  facet_grid(cols=vars(fascia_qualita)) +
  theme(axis.text.x = element_text(angle = 90))


# =====================================
# TEMI GRAFICI
# =====================================

ggplot(data, aes(fatturato)) +
  geom_histogram() +
  theme_minimal()

ggplot(data, aes(fatturato)) +
  geom_histogram() +
  theme_bw()

ggplot(data, aes(fatturato)) +
  geom_histogram() +
  theme_classic()

# =====================================
# ETICHETTE (LABS)
# =====================================

ggplot(data, aes(fatturato)) +
  geom_histogram() +
  theme_minimal() +
  labs(title = "Distribuzione del Fatturato per Prodotto",
       subtitle = "Analisi su 80 prodotti del catalogo aziendale",
       caption = "Fonte: Database vendite aziendali",
       x = "Fatturato (€)",
       y = "Frequenza")

# =====================================
# COLORI
# =====================================

ggplot(data, aes(fatturato)) +
  geom_histogram(fill = "darkblue")

ggplot(data, aes(fatturato)) +
  geom_histogram(aes(fill = categoria))

ggplot(data, aes(prezzo, unita_vendute)) +
  geom_point(color = "red")

ggplot(data, aes(prezzo, unita_vendute)) +
  geom_point(aes(color = categoria))

# Colori personalizzati per fascia qualità
ggplot(data, aes(prezzo, unita_vendute)) +
  geom_point(aes(color = fascia_qualita)) +
  scale_color_manual(values = c("#FF6B6B", "#4ECDC4", "#45B7D1"))

ggplot(data, aes(fatturato)) +
  geom_histogram(aes(fill = fascia_qualita)) +
  scale_fill_manual(values = c("#FF6B6B", "#4ECDC4", "#45B7D1"))

# Colore gradiente per variabile continua
ggplot(data, aes(prezzo, unita_vendute)) +
  geom_point(aes(color = valutazione_clienti))

ggplot(data, aes(prezzo, unita_vendute)) +
  geom_point(aes(color = margine_profitto)) +
  scale_color_continuous(low = "yellow", high = "darkgreen")

# =====================================
# EXTRA - MATRICE DI CORRELAZIONE
# =====================================
library(corrplot)
# Selezioniamo solo le variabili numeriche
vendite_numeriche <- data %>%
  select(prezzo, unita_vendute, fatturato, valutazione_clienti,
         numero_recensioni, tasso_reso, margine_profitto, giorni_giacenza)

vcor <- cor(vendite_numeriche)
# Stampa correlazioni arrotondate a 2 cifre
round(vcor, digits = 2)

# Visualizzazione matrice di correlazione
corrplot(vcor)
corrplot(vcor, method = "square")
corrplot(vcor, method = "square", order = "AOE")

# =====================================
# GRAFICI AGGIUNTIVI BUSINESS
# =====================================

# 1. Grafico a torta per distribuzione categorie
data %>%
  group_by(categoria) %>%
  summarise(fatturato_totale = sum(fatturato)) %>%
  ggplot(aes(x = "", y = fatturato_totale, fill = categoria)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  labs(title = "Distribuzione Fatturato per Categoria",
       fill = "Categoria") +
  scale_fill_brewer(palette = "Set2")

# 2. Scatter con dimensione bolla
ggplot(data, aes(x = valutazione_clienti, y = tasso_reso)) +
  geom_point(aes(size = fatturato, color = categoria), alpha = 0.6) +
  scale_size_continuous(range = c(2, 15), 
                        labels = function(x) paste0(round(x/1000), "K€")) +
  labs(title = "Relazione tra Valutazione Clienti e Tasso di Reso",
       subtitle = "Dimensione bolla = Fatturato",
       x = "Valutazione Clienti (1-5)",
       y = "Tasso di Reso (%)",
       size = "Fatturato",
       color = "Categoria") +
  theme_minimal() +
  scale_color_brewer(palette = "Set1")

# 3. Heatmap performance per marca e categoria
data %>%
  group_by(marca, categoria) %>%
  summarise(margine_medio = mean(margine_profitto), .groups = 'drop') %>%
  ggplot(aes(x = marca, y = categoria, fill = margine_medio)) +
  geom_tile() +
  geom_text(aes(label = round(margine_medio, 1)), color = "white", size = 3) +
  scale_fill_gradient(low = "#E74C3C", high = "#27AE60") +
  labs(title = "Margine di Profitto Medio per Marca e Categoria",
       x = "Marca",
       y = "Categoria",
       fill = "Margine %") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 4. Analisi performance prodotti
data %>%
  mutate(performance = case_when(
    fatturato > quantile(fatturato, 0.75) & valutazione_clienti > 4 ~ "Top Performer",
    fatturato < quantile(fatturato, 0.25) & valutazione_clienti < 3.5 ~ "Da Migliorare",
    TRUE ~ "Standard"
  )) %>%
  ggplot(aes(x = fatturato, y = valutazione_clienti, color = performance)) +
  geom_point(size = 3, alpha = 0.7) +
  scale_x_continuous(labels = function(x) paste0(round(x/1000), "K€")) +
  scale_color_manual(values = c("Top Performer" = "#27AE60", 
                                "Standard" = "#3498DB", 
                                "Da Migliorare" = "#E74C3C")) +
  labs(title = "Matrice Performance Prodotti",
       x = "Fatturato (€)",
       y = "Valutazione Clienti",
       color = "Performance") +
  theme_minimal()

