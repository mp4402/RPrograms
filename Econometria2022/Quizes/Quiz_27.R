#Mario Enrique Pisquiy Gómez
#20200399

library(readxl)
library(tidyr)
library(zoo)
library(quantmod)
library(dplyr)
library(pracma)
library(ggplot2)
#1) Explique que es un modelo ancova y un modelo mixto
#(con cualitativas y cuantitativas en las exogenas)
#Menciones las diferencias entre ambas. 
#Un modelo ancova es aquel que incluy variables dummies y de cambio junto a otras exógenas.
#Se diferencian en que un ancova lleva dummies con unas exógenas y de cambio en otras exógenas también, pero un mixto
#lleva ambas, dummies y de cambio en la misma exógena

#Corra la siguiente base de datos
M = USArrests
M
M$Dummy<- ifelse(M$UrbanPop >=70, "1", "0")
M$Dummy2 = ifelse(M$Murder >=10, "1", "0")
M = M[-1]  
M = M[-2]
M = M[-2]
#Dummy  representa una poblacion Urbana de mas de 70%
#Dummy2 representa una tasa de homicidios de 10 por cada 100000 habitantes 
#Sobre esto se pide lo siguiente:
#Haga una regresion con la media
#Haga una regrasion con las variable dummies
#Interprete los resultados
#Trate de graficar si puede (no se evalua)

modelo0 <- lm(M$Assault ~ 1, M)
summary(modelo0)
modelo1 <- lm(M$Assault ~ M$Dummy, M)
summary(modelo1)
modelo2 <- lm(M$Assault ~ M$Dummy2, M)
summary(modelo2)

#En promedio, se cometen más homicidos, 46.31, en aréa urbanas de más de 70%
#En promedio, se comenes más hominicios, 130.592, en tasa de 10 por cada 100000 habitantes