anno <- 2006

# Opzione 1
if(anno > 1964){
  status <- "Non Boomer"
}else if(anno < 1946){
  status <- "Non Boomer"
}else{
  status <- "Boomer"
}
status

# Opzione 2
if(anno < 1964 & anno > 1946){
  status <- "Boomer"
}else{
  status <- "Non Boomer"
}

# Opzione 3
if(anno %in% 1946:1964){
  status <- "Boomer"
}else{
  status <- "Non Boomer"
}