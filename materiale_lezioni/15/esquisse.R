library(esquisse)
titanic <- read.csv("data/titanic.csv")
summary(titanic)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Embarked <- as.factor(titanic$Embarked)


esquisser()