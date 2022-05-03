#Mario Enrique Pisquiy Gómez
#Carné 20200399

#Descargue el archivo que se le ha enviado a su correo
#Dirijase a sessions, dirijase a set working directionary.
#Ahi seleccione descargas (o downloads en ingles)
#Borre todo del Enviroment para hacer el ejercicio
#Corra lo siguiente
Datos = read.csv ("ProduccionH.csv", TRUE)
library(Matrix)
library(GGally)
library(ggplot2)

Datos <- Datos[,-1]

#Inciso 1
ggpairs(Datos, columns = 1:2, cardinality_threshold=50)
ggpairs(Datos, columns = 3:4, cardinality_threshold=50)
#Cuan mayor es el precio del huevo, menor será la producción, aunque hay casos atípicos en los que aunque el 
#precio sea bajo, la producción también es baja, tiene una correlación baja y negativa, por lo que son inversamente
#proporcionales y como tal no es una relación 100% perfecta, lo sería si su correlación fuera -1 o 1

#Inciso 2
colMeans(Datos)

#Inciso 3, modelo realizado para el año 1990
x1 <- matrix(1, nrow = 50, ncol = 1)
x2 <- Datos[,1]
x <- cbind(x1, x2)
y <- matrix(Datos[,2], nrow = 50, ncol=1)
Betas <- solve(t(x)%*%(x)) %*% t(x) %*% y
Betas

#Inciso 4, realizado también para el año 1990
modelo <- lm(Produccion.1990 ~ Precio.x.docena.1990, data = Datos)
summary(modelo)
#El R^2 del modelo es 0.08348,y el R^2 ajustado es 0.0643, los betas son iguales a los obtenidos de forma matricial