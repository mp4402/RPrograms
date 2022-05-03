#Mario Enrique Pisquiy Gómez
#carné 20200399

#Preguntas Directas
#1) ?Para que sirve la funcion Tidy R?
#Sirve para reorganizar data, además, nos permite específicar la forma en que la queremos

#2) ?Cual es la razon por la cual se tiene
#que identificar como vector una matriz con datos para
#realizar una ecuacion lineal en R?
#Por que el método de mínimos cuadrados así nos lo pide. Aunque obtengamos las Y's como una matriz, por las dimensiones
#requeridas para hacerlo, debemos volver dicha matriz en un vector

#3) ?Que diferencia la funcion unite y Gather?
#Gater es para reorganizar la data, mientras unite es para unificar los valores entre columnas

#4) ?Que funcion se utiliza para indicar que se quiere 
#aplicar una fecha?
#as.Date

#Pregunta ejercicio
#Corra USArrests como U de esta manera. 
U = USArrests
#Puede asignarle otro nombre si lo desea
#Con la funcion Unite, junte cada columna en una sola. 
#Utilice los nombres de las columnas. 
library(tidyr)
U1 <- unite(U,"Murder-Assault-UrbanPop-Rape",1:4,sep="-")
U1 <- na.omit(U1)
U1
