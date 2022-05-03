#Mario Enrique Pisquiy Gómez
#Carné 20200399

Corra 
USArrests
#Ejercicio 1
#Realize las siguientes matrizes indicadas
#1) Una matriz de 50 filas con el numero uno. Nombrela A
#2) Una matriz de 50 filas y una de 80 filas de la segunda columna
#de la funcion pre programada de USArrests. Nombrela B a la de 50 filas.
#3)Cree una matriz que combine A y B. Nombrela C.
#Ejercicio # 2 Preguntas directas
#4)Indique cual es la funcion que se utiliza para la creacion de un modelo
#lineal. 
#5)Dado el dataset visto en clase del PIB, cual es la variable 
#dependiente Y, de las siguientes variables 
#FBC_7014;PIBcap1970;PIBcap2014;PIBcap1470;?
library(datasets)
#1
A <- matrix(1, nrow = 50, ncol = 1)
#2
B <- matrix(data =USArrests[,2],nrow = 50, ncol = 1)
B1 <- matrix(data =USArrests[,2],nrow = 80, ncol = 1) #<- este genera un error porque se piden crear más filas de las que hay en USArrests
#3
C <- cbind(A, B)

#4
#lm

#5
#La variable dependiente es FBC_7014
