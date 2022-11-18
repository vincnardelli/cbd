#install.packages("ggplot2")
library(ggplot2)

library(tidyverse)

titanic <- read.csv("data/titanic.csv")
summary(titanic)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Embarked <- as.factor(titanic$Embarked)
summary(titanic)


ggplot(titanic, aes(x=Pclass, fill=Survived)) + 
  geom_bar() 


ggplot(titanic, aes(x=Pclass, fill=Survived)) + 
  geom_bar() +
  labs( y="Number of Passengers", x="Passenger Class", title="Titanic Survival Rate by Passenger Class")


titanic <- mutate(titanic, Survived = as.factor(Survived))
ggplot(titanic, aes(x=Pclass, fill=Survived)) + 
  geom_bar() +
  labs( y="Number of Passengers", x="Ticket Class", title="Titanic Survival Rate by Passenger Class")


ggplot(titanic, aes(x=Sex, fill=Survived)) +
  geom_bar() +
  labs( y="Number of Passengers", title="Titanic Survival Rate by Gender by Passenger Class")+ 
  facet_wrap(~Pclass)


ggplot(titanic, aes(x=Age, fill=Survived))+
  geom_histogram(bins=20) +
  labs(title="Survival Rate by Gender", y="Number of passengers", subtitle = "Distribution by age")


ggplot(titanic, aes(x=Age, fill=Survived))+
  geom_histogram(bins=20) +
  labs(title="Survival Rate by Gender", y="Number of passengers", subtitle = "Distribution by age, gender and ticket class")+
  facet_grid(Sex~Pclass, scales="free")


ggplot(data = titanic, aes(x=Pclass, y=Age)) +
  geom_boxplot(alpha=0.7)