# Carica le librerie necessarie
library(tidyverse)
data = readxl::read_xlsx("churn.xlsx")

# Calcola il numero di clienti churn
num_churn_clients <- sum(data$Churn == 1)
print(paste("Numero di clienti churn:", num_churn_clients))

# Calcola il numero di clienti per Importo Addebitato e riepiloga il Valore Cliente
data %>% 
  group_by(Importo_Addebitato) %>% 
  summarise(n = n(), 
            cv = sum(Valore_Cliente), 
            cv_mean = mean(Valore_Cliente))

# Calcola l'80° percentile per Fallimenti Chiamate
threshold_call_failure <- quantile(data$Fallimenti_Chiamate, 0.80, na.rm = TRUE)

# Crea colonne di segmentazione
data <- data %>%
  mutate(
    Segmento = case_when(
      Fallimenti_Chiamate > threshold_call_failure & Reclami == 0 ~ "High Issues, No Complaints",
      Fallimenti_Chiamate > threshold_call_failure & Reclami == 1 ~ "High Issues, Complains",
      TRUE ~ "Other"
    )
  )

data %>% 
  mutate(u_score = ntile(Secondi_Utilizzo, 4)) %>% 
  select(Secondi_Utilizzo, u_score, Gruppo_Eta) %>% 
  group_by(Gruppo_Eta, u_score) %>% 
  summarise(n=n())





data %>% 
  mutate(Churn = as.numeric(Churn)) %>% 
  group_by(Segmento) %>% 
  summarise(n = n(), 
            perc = mean(Churn))

# Grafico 1: Distribuzione dei segmenti
ggplot(data, aes(x = Segmento, fill = Segmento)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Distribuzione dei Segmenti dei Clienti",
       x = "Segmento",
       y = "Numero di Clienti")


# Grafico 2: Distribuzione del tempo di chiamata per segmento
ggplot(data, aes(x = Segmento, y = Secondi_Utilizzo, fill = Segmento)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuzione del Tempo di Chiamata per Segmento",
       x = "Segmento",
       y = "Secondi di Utilizzo")

# Grafico 3: Distribuzione della frequenza di SMS per segmento
ggplot(data, aes(x = Segmento, y = Frequenza_SMS, fill = Segmento)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuzione della Frequenza di SMS per Segmento",
       x = "Segmento",
       y = "Frequenza di SMS")

# Grafico 4: Fallimenti delle chiamate per segmento
ggplot(data, aes(x = Segmento, y = Fallimenti_Chiamate, fill = Segmento)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Fallimenti delle Chiamate per Segmento",
       x = "Segmento",
       y = "Fallimenti di Chiamate")

# Tabella di riepilogo della Customer Lifetime per segmento
customer_lifetime_summary <- data %>%
  group_by(Segmento) %>%
  summarize(
    AvgCustomerLifetime = mean(Durata_Abbonamento, na.rm = TRUE),
    MedianCustomerLifetime = median(Durata_Abbonamento, na.rm = TRUE),
    MaxCustomerLifetime = max(Durata_Abbonamento, na.rm = TRUE)
  )
print(customer_lifetime_summary)

# Grafico 5: Distribuzione della Customer Lifetime per segmento
ggplot(data, aes(x = Segmento, y = Durata_Abbonamento, fill = Segmento)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuzione della Customer Lifetime per Segmento",
       x = "Segmento",
       y = "Durata Abbonamento")

# Grafico 6: Istogramma della Customer Lifetime
ggplot(data, aes(x = Durata_Abbonamento)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(title = "Istogramma della Customer Lifetime",
       x = "Durata Abbonamento",
       y = "Numero di Clienti")


# Grafico 8: Istogramma del Valore Cliente per Segmento
ggplot(data, aes(x = Valore_Cliente, fill = Segmento)) +
  geom_histogram(binwidth = 100, alpha = 0.6, color = "black") +
  theme_minimal() +
  labs(title = "Distribuzione del Valore Cliente per Segmento",
       x = "Valore Cliente",
       y = "Numero di Clienti")

# Grafico 9: Distribuzione del valore del cliente tra churn e non churn
ggplot(data, aes(x = Churn, y = Valore_Cliente, fill = Churn)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuzione del Valore Cliente tra Churn e Non Churn",
       x = "Churn",
       y = "Valore Cliente")

# Grafico 10: Distribuzione delle chiamate uniche per gruppo di età
ggplot(data, aes(x = Gruppo_Eta, y = Numero_Chiamate_Distinte, fill = factor(Gruppo_Eta))) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuzione delle Chiamate Uniche per Gruppo di Età",
       x = "Gruppo di Età",
       y = "Numero di Chiamate Distinte")

# Grafico 11: Distribuzione della durata delle chiamate per churn e non churn
ggplot(data, aes(x = Churn, y = Secondi_Utilizzo, fill = Churn)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribuzione della Durata delle Chiamate per Churn e Non Churn",
       x = "Churn",
       y = "Durata delle Chiamate (secondi)")


library(tree)
data$Churn <- factor(data$Churn)
tree.churn <- tree(Churn ~ Stato+Reclami, data)
summary(tree.churn)

plot(tree.churn)
text(tree.churn, pretty = 0)
tree.pred <- predict(tree.churn, data,
                     type = "class")
table(tree.pred, data$Churn)
(2637 + 200) / 3150
