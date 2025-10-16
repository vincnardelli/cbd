tariffa_min <- 28/60
tariffa_km <- 1.14
distanza <- c(1, 0.3, 0.5, 0.8, 0.2)
costo <- 0
giorno <- "D"
ora <- 12


velocita <- distanza*60
for(i in 1:5){
  
  if(velocita[i] < 20){
    costo <- costo+tariffa_min
  }else{
    costo <- costo+tariffa_km*distanza[i]
  }
  print(costo)
}
costo














# Alternativa 2
costo <- 0
velocita <- distanza*60
for(i in 1:5){
  if(velocita[i] < 20){
    costo <- costo+tariffa_min
  }else{
    costo <- costo+tariffa_km*distanza[i]
  }
}
costo

