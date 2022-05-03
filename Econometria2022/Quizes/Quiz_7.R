#Mario Enrique Pisquiy Gómez
#Carné 20200399

#Problema 1
#Cree un vector de 5 elementos, que empiece en 10 y tenga
#secuencia de 6. 

#Problema 2
#Cree las siguientes matrices
#Una matriz A que contenga solo numeros 1 con dimension 3*3
#Una matriz B que contenga estos numeros, en este orden,
#ordenado por columnas. (1,4,7,2,5,8,3,6,9)

#Problema 3
#Sume y multipliquelas matrices A y B

#problema 1
x <- c(seq(10,34, by = 6))
x

#problema 2
a <- matrix(c(z <- rep(1,9)), nrow = 3, ncol = 3, byrow = FALSE)
a
b <- matrix(c(1,4,7,2,5,8,3,6,9), nrow=3,ncol=3, byrow=FALSE)
b

#problema 3
c = a + b
c
d = a %*% b
d
