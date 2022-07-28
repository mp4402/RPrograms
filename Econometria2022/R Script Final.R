#Mario Enrique Pisquiy Gómez
#20200399

#Corra las siguientes Librerias
library(readxl)
library(tidyr)
library(zoo)
library(quantmod)
library(dplyr)
library(pracma)
library(ggplot2)
library(GGally)
#Dirigirse a sessions, Downloads y Corra lo siguiente
#Porfavor correrlo tal y como esta. 
Final = read.csv("Autos.csv")
Final
rownames(Final) <- Final[,1]
Final = Final[,-1]
Final = Final[,-2]

#1)
modelo1 <- lm(Costo ~ Cilindros + Caballos + Millaje + Peso, data = Final)
summary(modelo1)

ggpairs(Final)

#Al hacer un análisis inicial de las variables y su comportamiento, se puede ver que tienene correlaciones tanto 
#positias como negativas bastante altas, lo cual puede ser un poco peligroso para el modelo, pues puede que sean 
#variables que expliquen lo mismo o que tengan una fuerte dependencia lineal

#Para el modelo general, el R^2 es de 0.75, lo que nos indica que el modelo logra explicar en un 75% a la variable 
#endógena, mientras que el R^2 ajustado es de 0.74, lo cual es bueno, porque aún la ser penalizado el número de 
#variables, esta sigue explicando casi el 75% de causalidad.

#Para la variable Cilindros, este tiene una alta probabilidad de error, de casi del 50%, lo cual no es bueno, ya que 
#es muy probable que no explique nada y tienda al error
#Para la variable Caballos, tiene una baja probabilidad de error, de 2*10^-16, similar a la variable de millaje, la cual
#tiene una probaiblidad de error de 8.65*10^-5, y parecida a Peso, la cual tiene una probabilidad de error de 
#1.72*10^-5. Todo esto nos indica que son confiables, eplicativas y de utilidad para el modelo general

resumen <- summary(modelo1)
desviaciones <- resumen$coefficients[,2]
betas <- resumen$coefficients[,1]

#2)
x1 <- matrix(1, nrow = 234, ncol = 1)
x2 <- Final[,2]
x3 <- Final[,3]
x4 <- Final[,4]
x5 <- Final[,5]
x <- cbind(x1, x2, x3, x4, x5)
y <- matrix(Final[,1], nrow = 234, ncol=1)
Betas <- solve(t(x)%*%(x)) %*% t(x) %*% y
Betas

#3) Test T 

TestTB0 <- betas[1]/desviaciones[1]
TestTB0
TestTB1 <- betas[2]/desviaciones[2]
TestTB1
TestTB2 <- betas[3]/desviaciones[3]
TestTB2
TestTB3 <- betas[4]/desviaciones[4]
TestTB3
TestTB4 <- betas[5]/desviaciones[5]
TestTB4

#4) Test F

modelo0 <- lm(data = Final, Costo ~ 1)

SRR <- sum(modelo0$residuals^2)
SRS <- sum(modelo1$residuals^2)

Numerador_F <- (SRR-SRS) / (5-1)
Denominador_F <- SRS / (234 - 5)
Test_F <- Numerador_F / Denominador_F
Test_F

#5) El costo de no producir es de -52,320, es decir no se pierde, si no lo contrario, el costo de cada vehículo aumenta
#en 365 por cada cilindro, 160 por cada caballo de fuerza del motor, 566 por cada milla del millaje y 8 por cada 
#kilogramo de peso. Todas las variables son significantes, a excepción de Cilindros, la cual tiene una probabilidad
#de error del 58%, lo cual la hace una pésima variable. El R^2 del modelo es de 75%, su R^2 ajustado es del 74%, lo 
#cual es bueno, porque así se sabe que las variables explican al modelo aún con la penalización de variables.
#El valor p del test F es de 2.2*10^-16, lo cual es bueno, porque quiere decir que desestimamos H0, que nuestras Betas
#sean 0, por lo que nuestro modelo si explica causalidad entre las exógenas y la endógena
#Finalmente, considero que Cilindros es una variable que puede ser eliminada del modelo, pues posee un error alto