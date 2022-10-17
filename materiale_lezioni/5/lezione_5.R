vettore <- c(1, 2, 3, 4)
vettore2 <- 1:4

vettore3 <- c(23, 45, 65, 89)
vettore3[1]
vettore3[3]
vettore3[c(2, 3)]
vettore3[2:3]


for(i in 1:10){
  print(i)
}


for(i in 1:4){
  print(vettore3[i])
}

for(i in vettore3){
  print(i)
}

vettore4 <- c("mele", "banane", "cipolle")

for(i in 1:3){
  print(vettore4[i])
}


nomi <- c("Giorgio", "Rosa", "Michele", "Valeria")
eta <- c(12, 19, 20, 17)


for(i in 1:4){
  if(eta[i]<18){
    classe_eta <- "Minorenne"
  }else{
    classe_eta <- "Maggiorenne"
  }
  print(paste0(nomi[i], " è ", classe_eta))
}

