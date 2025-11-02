library(readxl)
library(ggplot2)
library(corrplot)
library(GGally)
library(dplyr)
returns <- read_excel("finanza_returns.xlsx")

# Rendimento annuale
prod(1 + returns$Ferrari) - 1
prod(1 + returns$Enel) - 1
prod(1 + returns$Intesa) - 1
prod(1 + returns$Unicredit) - 1

summary(returns)
mean(returns$Ferrari)

returns %>%
  mutate(Ferrari = cut(Ferrari, breaks = c(-Inf, 0, Inf))) %>%
  count(Ferrari) %>%
  mutate(freq_rel = n / sum(n))


returns %>%
  mutate(Ferrari = cut(Ferrari, breaks = c(-Inf, -0.005, 0, 0.005, Inf))) %>%
  count(Ferrari) %>%
  mutate(freq_rel = n / sum(n))


ggplot(returns, aes(x = day)) +
  geom_line(aes(y = Ferrari, color = "Ferrari")) +
  scale_color_manual(
    values = c("Ferrari" = "red")
  ) +
  ylab("Rendimento giornaliero")+
  theme_minimal()

ggplot() +
  geom_histogram(data=returns, aes(x=Ferrari), fill="red")+
  theme_minimal() +
  xlab("Rendimento giornaliero")


summary(returns$Ferrari)

ggplot() +
  geom_histogram(data=returns, aes(x=Ferrari), fill="red") +
  geom_vline(xintercept = quantile(returns$Ferrari, 0.25)) +
  geom_vline(xintercept = median(returns$Ferrari)) +
  geom_vline(xintercept = quantile(returns$Ferrari, 0.75)) +
  theme_minimal() +
  xlab("Rendimento giornaliero")


ggplot() +
  geom_boxplot(data = returns, aes(x = Ferrari), fill = "red") +
  theme_minimal()  +
  xlab("Rendimento giornaliero")

Q1 <- quantile(returns$Ferrari, 0.25)
Q3 <- quantile(returns$Ferrari, 0.75)
IQR_value <- IQR(returns$Ferrari)

lower_whisker_limit <- Q1 - 1.5 * IQR_value
upper_whisker_limit <- Q3 + 1.5 * IQR_value

ggplot() +
  geom_histogram(data=returns, aes(x=Ferrari), fill="red") +
  geom_vline(xintercept = 0.001038) +
  geom_vline(xintercept = -0.005166) +
  geom_vline(xintercept = 0.008665) +
  geom_vline(xintercept = lower_whisker_limit) +
  geom_vline(xintercept = upper_whisker_limit) +
  theme_minimal() +
  xlab("Rendimento giornaliero")



sd(returns$Ferrari)
var(returns$Ferrari)



ggplot(returns, aes(x = day)) +
  geom_line(aes(y = Ferrari, color = "Ferrari")) +
  scale_color_manual(
    values = c("Ferrari" = "red")
  ) +
  ylab("Rendimento giornaliero")+
  theme_minimal() +
  geom_hline(yintercept=mean(returns$Ferrari))

ggplot() +
  geom_histogram(data=returns, aes(x=Ferrari), fill="red") +
  geom_vline(xintercept =mean(returns$Ferrari)) +
  theme_minimal() +
  xlab("Rendimento giornaliero")



sd(returns$Ferrari)
sd(returns$Enel)
sd(returns$Intesa)
sd(returns$Unicredit)

ggplot(returns, aes(x = day)) +
  geom_line(aes(y = Ferrari, color = "Ferrari")) +
  geom_line(aes(y = Unicredit, color = "Unicredit")) +
  scale_color_manual(
    values = c("Ferrari" = "red", "Unicredit" = "orange")
  ) +
  ylab("Rendimento giornaliero")+
  theme_minimal()


mean(returns$Ferrari)
sd(returns$Ferrari)
summary(returns$Ferrari)

ggplot() +
  geom_histogram(data=returns, aes(x=Ferrari), fill="red", alpha=0.7)+
  theme_minimal() +
  xlab("Rendimento giornaliero") +
  xlim(c(-0.10, 0.15)) +
  ylim(c(0, 100))


mean(returns$Unicredit)
sd(returns$Unicredit)
summary(returns$Unicredit)

ggplot() +
  geom_histogram(data=returns, aes(x=Unicredit), fill="orange", alpha=0.7)+
  theme_minimal() +
  xlab("Rendimento giornaliero") +
  xlim(c(-0.10, 0.15)) +
  ylim(c(0, 100))


ggplot(returns, aes(x = day)) +
  geom_line(aes(y = Ferrari, color = "Ferrari")) +
  geom_line(aes(y = Enel, color = "Enel")) +
  geom_line(aes(y = Intesa, color = "Intesa")) +
  geom_line(aes(y = Unicredit, color = "Unicredit")) +
  scale_color_manual(
    values = c("Ferrari" = "red", "Enel" = "blue", "Intesa" = "green", "Unicredit" = "orange")
  ) +
  ylab("Rendimento giornaliero")+
  theme_minimal()



ggplot() +
  geom_histogram(data=returns, aes(x=Ferrari), fill="red", alpha=0.5)+
  geom_histogram(data=returns, aes(x=Enel), fill="blue", alpha=0.5)+
  theme_minimal() +
  xlab("Rendimento giornaliero")


ggplot() +
  geom_boxplot(data = returns, aes(x = "1 - Ferrari", y = Ferrari), fill = "red", alpha = 0.5) +
  geom_boxplot(data = returns, aes(x = "2 - Enel", y = Enel), fill = "blue", alpha = 0.5) +
  geom_boxplot(data = returns, aes(x = "3 - Intesa", y = Intesa), fill = "green", alpha = 0.5) +
  geom_boxplot(data = returns, aes(x = "4 - Unicredit", y = Unicredit), fill = "orange", alpha = 0.5) +
  labs(title = "Confronto dei Boxplot", x = "Azienda", y = "Rendimenti") +
  theme_minimal()


summary(returns$Ferrari)*100
summary(returns$Enel)*100
summary(returns$Intesa)*100
summary(returns$Unicredit)*100


sd(returns$Ferrari)*100
sd(returns$Enel)*100
sd(returns$Intesa)*100
sd(returns$Unicredit)*100

library(moments)
skewness(returns[,1:4])


ggplot() +
  geom_histogram(data=returns, aes(x=Ferrari), fill="red", alpha=0.7)+
  geom_histogram(data=returns, aes(x=Intesa), fill="green", alpha=0.7)+
  theme_minimal() +
  xlab("Rendimento giornaliero")

ggplot() +
  geom_boxplot(data = returns, aes(y = "1 - Ferrari", x = Ferrari), fill = "red", alpha = 0.5) +
  geom_boxplot(data = returns, aes(y = "3 - Intesa", x = Intesa), fill = "green", alpha = 0.5) +
  labs(y = "Azienda", x = "Rendimenti") +
  theme_minimal()

ggplot() +
  geom_point(data=returns, aes(x=Ferrari, y=Intesa)) +
  theme_minimal()

ggplot() +
  geom_point(data=returns, aes(x=Unicredit, y=Intesa)) +
  theme_minimal()


ggpairs(returns[,1:4], upper = "blank")
ggpairs(returns[,1:4])

cov(returns$Ferrari, returns$Intesa)
cov_matrix <- cov(returns[,1:4])
round(cov_matrix, 5)

cor_matrix <- cor(returns[,1:4])
cor_matrix
round(cor_matrix, 2)

corrplot(cor_matrix, method = 'number')
corrplot(cor_matrix)
