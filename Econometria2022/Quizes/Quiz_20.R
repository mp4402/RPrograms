#Mario Enrique Pisquiy Gómez
#20200399

#Corra las siguientes Librerias
library(readxl)
library(tidyr)
library(zoo)
library(quantmod)
library(dplyr)
library(pracma)
#Preguntas de Teoria
#1) Defina el concepto de Heterocedasticidad. ?Que indica esto
#sobre la varianza de los errores?
#Es que los errores no son constantes a la recta, nos indica que la varianza es distinta entre los errores.

#2) ?Para que sirven y como se interpretan las funciones mutate y movavg? 
#Mutate se utiliza para aplicar algo a toda una columna, por ejemplo puede ser sumarle o restarle un número o
#multiplicarla y dividirla

#3) Explique es y como funciona una media movil.
#Es la mediana de una serie de n valores consecutivos, la utilizamos para que no afecte tanto los puntos o momentos
#volatiles en las muestras, que pueden afectar a nuestro modelo

#4) En R, ?Para que utilizamos geom_Smooth? ?Para que utilizamos geom_Point?
#Geom_Smooth lo utilizamos para definir que tipo de gráfico será, mientras que geom_point es para indicarle que 
#vamos a mostrar también una nube de puntos y cuales son esos puntos.

#Ejercicios Practicos
#Problemas practicos
#Corra lo siguiente
lynx
A = lynx
Linces = data.frame(as.matrix(A), date=time(A))
colnames(Linces) <- c("Especies","Periodo")
cambioLinces <- Linces
cambioLinces$cambioEspecies <- Delt(cambioLinces$Especies, k = 0)
#Utilice la funcion movavg para calcular la media movil del cambio anual de las especies
#Utilice n = 2 y utilice print para imprimir la variable. 
cambioLinces$Especiesmm <- movavg(cambioLinces$Especies, n = 12, type= "s")
cambioLinces$Especiesmm1 <- movavg(cambioLinces$Especies, n = 2, type= "s")
print.data.frame(cambioLinces)
