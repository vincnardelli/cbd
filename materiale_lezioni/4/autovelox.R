## Autovelox

limite <- 70
velocita <- 80

if(velocita < limite){
  sanzione <- 0
  print("Limite rispettato.")
}else{
  differenza <- velocita - limite
  if(differenza <= 10){
    sanzione <- 36
  }else if(differenza <= 40){
    sanzione <- 148
  }else if(differenza <= 60){
    sanzione <- 370
  }else{
    sanzione <- 500
  }
  print(paste0("Limite violato e la multa da pagare è di ", sanzione, " euro."))
}


