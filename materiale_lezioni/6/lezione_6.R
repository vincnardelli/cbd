vettore <- c(23, 57, 14, 8)
vettore[1]
vettore[c(1, 2)]
1:2
vettore[1:2]
vettore[c(TRUE, TRUE, FALSE, FALSE)]

vettore<50

vettore[vettore<50]


nomi <- c("Raffaele", "Giovanni", "Carmela", "Giole")
eta <- c(89, 6, 45, 102)

eta[eta>67]
nomi[eta>67]

eta[1]

if(eta[2]>67){
  print("Pens")
}else{
  print("No Pens")
}



for(i in 1:4){
  if(eta[i]>67){
    print(paste0(nomi[i], " è pens"))
  }else{
    print(paste0(nomi[i], " non è pens"))
  }
}


