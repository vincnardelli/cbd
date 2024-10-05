vettore_altezza <- c(1.58, 1.73, 1.81, 1.47, 1.74)
vettore_peso <- c(62, 86, 85, 95, 75)


for(i in 1:5){
  print(i)
  altezza <- vettore_altezza[i]
  peso <- vettore_peso[i]
  BMI <- peso/altezza^2
  
  
  if(BMI < 16){
    classificazione <- "Grave magrezza"
  }else if(BMI < 18.5){
    classificazione <- "Sottopeso"
  }else if(BMI < 25){
    classificazione <- "Normopeso"
  }else if(BMI < 30){
    classificazione <- "Sovrappeso"
  }else if(BMI < 35){
    classificazione <- "Obeso classe 1"
  }else if(BMI < 40){
    classificazione <- "Obeso classe 2"
  }else{
    classificazione <- "Obeso classe 3"
  }
  
  print(classificazione)
  
}
