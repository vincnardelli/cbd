velocita <- 70
limite <- 80

differenza <- velocita - limite

if(differenza > 0 & differenza <= 10){
  multa <- 36
}else if(differenza > 10 & differenza <= 40){
  multa <- 148
}else if(differenza > 40 & differenza <= 60){
  multa <- 370
}else if(differenza > 60){
  multa <- 500
}else{
  multa <- 0
} 

multa