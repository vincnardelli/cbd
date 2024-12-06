# Librerie necessarie
library(tree)
library(ISLR2)
library(dplyr)
library(randomForest)

# Preparazione dei dati
Carseats <- Carseats %>%
  mutate(High = factor(ifelse(Sales <= 8, "No", "Yes")))

# Decision Tree
tree.carseats <- tree(High ~ Price + Advertising + Income + US, Carseats)

# Visualizzazione e riepilogo del Decision Tree
plot(tree.carseats)
text(tree.carseats, pretty = 0)
summary(tree.carseats)

# Predizioni e accuratezza del Decision Tree
tree.pred <- predict(tree.carseats, Carseats, type = "class")
table(tree.pred, Carseats$High)
(191 + 113) / nrow(Carseats)


# Random Forest
set.seed(123) # Per risultati riproducibili
rf.carseats <- randomForest(High ~ Price + Advertising + Income + US,
                            data = Carseats, importance = TRUE)

# Riepilogo della Random Forest
print(rf.carseats)

# Importanza delle variabili
importance(rf.carseats)
varImpPlot(rf.carseats)

# Predizioni e accuratezza della Random Forest
rf.pred <- predict(rf.carseats, Carseats)
table(rf.pred, Carseats$High)
(236 + 162)/nrow(Carseats)

# Predizioni su nuovi dati con la Random Forest
new_data <- data.frame(Price = 98, Advertising = 15, Income = 62, US = factor("Yes", levels = levels(Carseats$US)))
predict(rf.carseats, new_data, type = "class")
predict(rf.carseats, new_data, type = "prob")

predict(tree.carseats, new_data, type = "class")
predict(tree.carseats, new_data, type = "vector")
