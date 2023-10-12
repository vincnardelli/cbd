velocita <- 180
limite <- 80
diff <- velocita - limite

if(diff <= 0){
  print("No multa")
}else if(diff > 0 & diff <= 10){
  print("Multa di 36€")
}else if(diff > 10 & diff <= 40){
  print("Multa di 148€")
}else if(diff > 40 & diff <= 60){
  print("Multa di 370€")
}else{
  print("Multa di 500€")
}


if(diff < 0){
  print("Limite rispettato.")
}else{
  if(diff <= 10){
    print("36")
  }else if(diff <= 40){
    print("148")
  }else if(diff <= 60){
    print("370")
  }else{
    print("500")
  }
}


if(diff > 60){
  print("Multa di 500€")
}else if(diff > 40){
  print("Multa di 370€")
}else if(diff > 10){
  print("Multa di 148€")
}else if(diff > 0){
  print("Multa di 36€")
}else{
  print("No multa")
}

