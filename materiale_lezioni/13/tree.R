library(tree)
library(ISLR2)
library(dplyr)

Carseats %>% 
  select(High, Price, Advertising) %>% 
  View
Carseats <- Carseats %>%
  mutate(High = factor(ifelse(Sales <= 8, "No", "Yes")))

tree.carseats <- tree(High ~ Price+Advertising, Carseats)

plot(tree.carseats)
text(tree.carseats, pretty = 0)

tree.carseats

summary(tree.carseats)

tree.pred <- predict(tree.carseats, Carseats,
                     type = "class")
table(tree.pred, Carseats$High)
(170 + 125) / nrow(Carseats)


predict(tree.carseats, 
        data.frame(Price=98, Advertising=5))
predict(tree.carseats, 
        data.frame(Price=98, Advertising=5), type="class")

predict(tree.carseats, 
        data.frame(Price=98, Advertising=15))



# another example


tree.carseats <- tree(High ~ Price+Income+US, Carseats)

plot(tree.carseats)
text(tree.carseats, pretty = 0)

tree.carseats

summary(tree.carseats)

tree.pred <- predict(tree.carseats, Carseats,
                     type = "class")
table(tree.pred, Carseats$High)
(161 + 119) / nrow(Carseats)


predict(tree.carseats, 
        data.frame(Price=98, Income=62, US=factor("Yes", levels = levels(Carseats$US))))

# For class prediction
predict(tree.carseats, 
        data.frame(Price=98, Income=62, US=factor("Yes", levels = levels(Carseats$US))), type="class")

predict(tree.carseats, 
        data.frame(Price=98, Advertising=15))

