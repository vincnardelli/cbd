library(quantmod)

# Definire il periodo per il 2023
start_date <- as.Date("2023-01-01")
end_date <- as.Date("2023-12-31")  # Puoi aggiornare questa data se necessario

# Scaricare i dati per i ticker specificati
tickers <- c("RACE.MI", "ENEL.MI", "ISP.MI", "UCG.MI")
getSymbols(tickers, src = "yahoo", from = start_date, to = end_date)

# Estrazione dei prezzi di chiusura aggiustati e calcolo dei rendimenti
# Utilizzando i ticker come nomi delle variabili senza '.MI'
RACE <- RACE.MI[, "RACE.MI.Adjusted"]
ENEL <- ENEL.MI[, "ENEL.MI.Adjusted"]
ISP  <- ISP.MI[,  "ISP.MI.Adjusted"]
UCG  <- UCG.MI[,  "UCG.MI.Adjusted"]

# Calcolo dei rendimenti giornalieri aritmetici
RACE_ret <- dailyReturn(RACE, type = "arithmetic")
ENEL_ret <- dailyReturn(ENEL, type = "arithmetic")
ISP_ret  <- dailyReturn(ISP,  type = "arithmetic")
UCG_ret  <- dailyReturn(UCG,  type = "arithmetic")

# Unire i rendimenti in un unico data frame
returns <- na.omit(merge(RACE_ret, ENEL_ret, ISP_ret, UCG_ret))

# Rinominare le colonne in base ai ticker senza '.MI'
colnames(returns) <- c("Ferrari", "Enel", "Intesa", "Unicredit")

returns <- as.data.frame(returns)[2:nrow(returns),]
returns$day <- 1:nrow(returns)
writexl::write_xlsx(returns, "finanza_returns.xlsx")