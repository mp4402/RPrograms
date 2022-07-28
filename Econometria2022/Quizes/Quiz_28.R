#Mario Enrique Pisquiy Gómez
#Carne 20200399

#Quiz 28
library(readxl)
library(tidyr)
library(zoo)
library(quantmod)
library(dplyr)
library(pracma)
library(ggplot2)
library(carData)
data("Salaries", package = "carData")
#La data = Salaries
#Dado el siguiente data set plantee los siguientes modelos
#1) Un modelo del salario vs un regresor "malo"
modelo0 <- lm(salary ~ sex, data = Salaries)
summary(modelo0)

modelo1 <- lm(salary ~ 1, data = Salaries)
summary(modelo1)

#2) Un modelo ANOVA que explique los salarios que 
#tenga como exogena rango

anova <- lm(salary ~ rank, data = Salaries)
summary(anova)

#3) Un modelo ANCOVA que explique los salarios 
# y tenga como exogenas anios de servicio

ancova <- lm(salary ~ yrs.service, data = Salaries)
summary(ancova)

#4)# Un Variables cualitativas con interacciones
#que explique los salarios sexo y anios de servicio 
#conjuntos y por separado.

modelo4 <- lm(salary ~ sex + yrs.service + sex*yrs.service, data = Salaries)
summary(modelo4)
