altezza <- 1.80
peso <- 69


velocita <- peso/altezza^2
BMI

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

