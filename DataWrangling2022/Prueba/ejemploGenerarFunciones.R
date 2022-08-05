generate_dff <- function(x,size){ return(
  data.frame( a = sample(letters, size = size, replace = TRUE),
              b = sample(1:10, size = size, replace = TRUE)
  ))
}

lista <- lapply(1:4, generate_dff, size = 4)

x<-2
if (x>5){
  print("Verdadero")
}else{
  print("Falso")
}
