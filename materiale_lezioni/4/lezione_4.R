vettore <- c(1, 2, 3, 4)
vettore <- 1:4

vettore2 <- c(23, 46, 78, 98)
vettore2[1]
vettore2[c(TRUE, FALSE, FALSE, FALSE)]
vettore2 < 50
vettore2[vettore2 < 50]

for(i in 1:10){
  print(i)
}

print(1:10)


for(i in c("Alberto", "Beatrice", "Ciarli")){
  print(i)
}


for(nome in c("Alberto", "Beatrice", "Ciarli")){
  print(nome)
}


nomi <- c("Alberto", "Beatrice", "Ciarli")

for(i in 1:3){
  print(nomi[i])
}

print(nomi[1])
print(nomi[2])
print(nomi[3])

nomi <- c("Alberto", "Beatrice", "Ciarli")
eta <- c(12, 19, 23)

for(i in 1:3){
  if(eta[i] < 18){
    classe_eta <- "minorenne"
  }else{
    classe_eta <- "maggiorenne"
  }
  print(paste0(nomi[i], " è ", classe_eta))
}
  


for(i in 1:3){
  if(eta[i] < 18){
    print(paste0(nomi[i], " è minorenne"))
  }else{
    print(paste0(nomi[i], " è minorenne"))
  }
}
  
  
if(eta_alberto < 18){
  print("Alberto è minorenne")
}else{
  print("Alberto è maggiorenne")
}
