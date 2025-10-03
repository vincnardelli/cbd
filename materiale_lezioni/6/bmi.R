altezza <- c(1.58, 1.73, 1.81, 1.47, 1.74)
peso <- c(62, 86, 85, 95, 75)

BMI <- peso/altezza^2

for(i in 1:5){
  if(BMI[i] <= 18.5){
    classificazione <- "Sottopeso"
  }else if(BMI[i] <= 25){
    classificazione <- "Normopeso"
  }else if(BMI[i] <= 30){
    classificazione <- "Sovrappeso"
  }else if(BMI[i] <= 35){
    classificazione <- "Obeso grado 1"
  }else if(BMI[i] < 40){
    classificazione <- "Obeso grado 2"
  }else{
    classificazione <- "Obeso grado 3"
  }
  print(classificazione)
}

















