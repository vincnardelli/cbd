prezzo <- 55
costo <- 37
investimento_pubblicitario <- 100000
cpa <- 1.43
cr <- 7


prodotti_venduti <- round(investimento_pubblicitario / cpa * cr / 100, 0)
prodotti_venduti

ricavi <- prezzo * prodotti_venduti
ricavi

costi_totali <- prodotti_venduti * costo + investimento_pubblicitario
costi_totali

utile <- ricavi - costi_totali
utile
