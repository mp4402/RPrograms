# Programa Generacion test F
# Daniel Fernandez Universidad Francisco Marroquin

rm(list = ls())

# Encuesta que le parece seleccion futbol (n=100). Grado 1 a 7
encuesta1 <- c(4,7,6,5,1,3,3,1,2,6,3,3,6,4,2,1,4,3,3,1,3,4,
               4,4,5,4,1,3,7,4,4,1,5,1,5,6,6,4,3,2,6,4,2,6,
               1,6,7,7,3,4,3,5,3,5,1,6,4,5,6,3,2,6,4,5,7,3,
               7,3,7,2,1,1,3,5,3,7,4,4,4,6,1,7,7,6,1,1,2,7,
               4,7,1,7,3,3,3,5,6,6,2,6)

# Tabla frecuencia absoluta y relativa
table(encuesta1)
prop.table(encuesta1)
prop.table(table(encuesta1))

# Media y desviacion tipica
(media_encuesta <- mean(encuesta1))
sd(encuesta1)

# ¿Y si les preguntamos de que equipo de futbol son?
Barcelona <- c(2,1,3,1,1,3,1,1,4,2,1,1,4,2,4,1,2,2,
               1,1,2,1,1,3,3,3,2,4,1,4,1,1,2)

Getafe <- c(4,3,3,5,4,4,4,3,3,3,4,4,6,4,5,5,3,5,3,
            6,4,6,3,3,3,3,5,6,3,3,3,3,6,4)

Real_Madrid <- c(4,7,6,6,5,6,7,5,7,7,6,7,7,7,6,7,
                 4,4,6,6,5,4,7,5,7,7,6,6,7,7,6,5,6)

length(encuesta1) == length(Barcelona) + length(Getafe) + 
  length(Real_Madrid)

# Media Madrid muy superior a media Barcelona
table(Barcelona)
prop.table(table(Barcelona))
(media_barcelona <- mean(Barcelona))
sd(Barcelona)

table(Getafe)
(media_getafe <- mean(Getafe))
sd(Getafe)

table(Real_Madrid)
(media_madrid <- mean(Real_Madrid))
sd(Real_Madrid)

# Formacion test F variacion entre grupos sobre variacion dentro grupos
# H0 = medias son iguales
# HA = medias son diferentes
# Esperamos que haya mas variacion entre grupos que dentro de ellos
# Calculamos desviaciones cuadraticas
cuadrados_totales <- sum((encuesta1 - mean(encuesta1))^2 )
cuadrados_totales

# Pequena comprobacion
cuadrados_totales / (100-1) == var(encuesta1)

cuadrados_barcelona <- sum((Barcelona - mean(Barcelona))^2 )
cuadrados_barcelona

cuadrados_getafe <- sum((Getafe - mean(Getafe))^2 )
cuadrados_getafe

cuadrados_madrid <- sum((Real_Madrid - mean(Real_Madrid))^2 )
cuadrados_madrid

cuadrados_dentro <- cuadrados_barcelona + cuadrados_getafe + 
                    cuadrados_madrid
cuadrados_dentro

# Tenemos que desviaciones totales son 378 y desviaciones dentro grupos es 114
# Desviaciones entre grupos es el residual
# Pero mejor calcular
# Desviaciones entre grupos es desviacion de la media 
# por grupos respecto a media total (ponderando numero datos)
cuadrados_entregrupos <- sum(
                         ((media_barcelona - media_encuesta)^2)*33 + 
                         ((media_getafe - media_encuesta)^2)*34 +
                         ((media_madrid - media_encuesta)^2)*33
                              )
cuadrados_entregrupos
cuadrados_entregrupos == cuadrados_totales - cuadrados_dentro

# Test F es un test de cuasivarianzas
# Calculo cuasivarianza. Utilizacion muestras. Grados de libertad
# Cuadrados totales = T-1
# Cuadrados dentro grupo = T-K
# Cuadrados entre grupos = K-1 (K observaciones = 3 medias)

Cuasivarianza_total <- cuadrados_totales / (100 - 1)
Cuasivarianza_dentro_grupo <- cuadrados_dentro / (100 - 3)
Cuasivarianza_entregrupos <- cuadrados_entregrupos / (3-1)

Test_F <- Cuasivarianza_entregrupos / Cuasivarianza_dentro_grupo
Test_F

# Comparar valor en tablas
# Tenemos F(2,97) = ~ 3,11

Test_F > 3.11

# Test F > Valor en tablas
# Se rechaza hipotesis nula
# Medias son diferentes
