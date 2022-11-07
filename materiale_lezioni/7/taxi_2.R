giorno <- "L"
ora <- 23
if(ora >= 6 & ora <= 22){
  if(giorno == "D"){
    costo <- 5
  }else{
    costo <- 3
  }
}else{
  costo <- 7
}

tariffa_min <- 28/60
tariffa_km <- 1.14
distanza <- c(1, 0.3, 0.5, 0.8, 0.2)

costo_uber <- 9


for(i in 1:5){
  velocita <- distanza[i]*60
  
  if(velocita < 20){
    costo <- costo + tariffa_min
  }else{
    costo <- costo + tariffa_km*distanza[i]
  }
}


if(costo_uber < costo){
  print("Uber")
}else{
  print("Taxi")
}


