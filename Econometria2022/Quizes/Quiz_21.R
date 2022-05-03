#Mario Enrique Pisquiy Gómez
#2200399

#Corra las siguientes Librerias
library(readxl)
library(tidyr)
library(zoo)
library(quantmod)
library(dplyr)
library(pracma)
#Preguntas Teoricas
#1) En el ejercicio del petroleo, ¿cual era la razon por la cual se debe 
#hacer un ajuste con lag (estancamiento) al modelo?
#Porque el efecto de la inflación no es inmediato, por lo que se debe hacer un lag para poder hacer un mejor modelo 

#2) ¿Porque al momento de definir la correcion temporal,es normal que se 
#observen bases de datos ordenadas mensualmente o trimestralmente?
#Para que las diferentes variables, las que llevan lag y las que no, estén fechadas y sean acorde a estas, es decir
#que su orden tenga coherencia

#Ejercicios en R. 
# Corra el documento enviado a su correo, se hace con
#read.csv desde su directorio de descargas en sessions. 
Suecia = read.csv("Suecia.csv")
colnames(Suecia) = c("Year","PriceP","GrowthP","Inflacion")
Suecia = Suecia[-23,]
#Corra la funcion LM dos veces, una con el precio como variable 
#x, la otra con el crecimiento interanual y aplique summary.
#Interprete los datos e indique que modelo es mas explicativo.
#Es este un modelo necesita de mas alimentacion de datos?
#data = Suecia
modelo1 <- lm(data = Suecia, Inflacion ~ PriceP)
summary(modelo1)  
modelo2 <- lm(data = Suecia, Inflacion ~ GrowthP)
summary(modelo2)
#El modelo más explcativo es el modelo 2, en el que se utiliza el crecimiento interanual
#Sí, necesita de más data, pues, aún no es confiable del todo (sus t value, en 1, en GrowthP no supero el 2) y su r^2
#aun puede ser mejorado