rm(list = ls())

# Programa distribuciones probabilidad Daniel Fernandez Universidad Francisco Marroquin

# Lanzar una moneda (1 cara, 0 cruz)
rbinom(1, 1, 0.5)
# Lanzar una moneda 10 veces
rbinom(10, 1, 0.5)
# Lanzar una moneda 10 veces (solo nos dice el numero de caras)
rbinom(1, 10, 0.5)
# Lanzar una moneda 100 veces y que nos diga el numero de caras cada 10 veces
# 10 rondas de 10 lanzamientos de monedas
rbinom(10, 10, 0.5)
# Lanzamiento de monedas trucadas
# Lanzar una moneda trucada 100 veces (90% de que salga cara)
rbinom(10, 10, 0.9)
# Lanzar una moneda trucada 100 veces (10% de que salga cara)
rbinom(10, 10, 0.1)
# Todos ejemplos siguen distribución binomial (dos posibles resultados)

# Calculando funcion probabilidad en un punto
# Simulacion 10 veces 10 tiradas, ¿cuantas son igual a 7?
mean(rbinom(10, 10, 0.5) == 7)
# Simulacion 10000 veces 10 tiradas, ¿cuantas tiradas son igual a 7?
mean(rbinom(10000, 10, 0.5) == 7)
# Probabilidad de que salgan 7 caras tirando una moneda 10 veces (probabilidad exacta)
dbinom(7, 10, 0.5)
# Probabilidad de que salgan 70 caras tirando una moneda 100 veces
dbinom(70, 100, 0.5)
# ¿Por que es mucho menor? ¿Por acercamiento a media? Hacer con 5 (media)
dbinom(5, 10, 0.5)
dbinom(50, 100, 0.5)
dbinom(500, 1000, 0.5)
# ¿Por que cae probabilidad? Cada vez se parece mas a una variable continua

# Calculando funcion probabilidad acumulada
# Simulacion 10000 veces 10 tiradas, ¿cuantas tiradas son al menos 6?
mean(rbinom(10000, 10, .5) <= 6)
# Probabilidad exacta de que salgan al menos 6 caras tirando una moneda 10 veces
pbinom(6, 10, 0.5)

# Histograma
x <- rbinom(10000, 10, .5)
hist(x)
# Histograma con funcion densidad
hist(x, probability = TRUE)
lines(density(x), lty="dotted", lwd=2, col="red")
# ¿Problema? No es variable continua

# Con suficiente numero de tiradas distribucion binomial 
# se aproxima a distribucion normal
hist(rbinom(10, 10, .5))
hist(rbinom(100, 10, .5))
hist(rbinom(1000, 10, .5))
hist(rbinom(10000, 10, .5))
hist(rbinom(100000, 10, .5))

# Estadistica descriptiva variable aleatoria
# Media o valor esperado (centro distribucion)
# Simulacion
moneda_aire <- rbinom(10000, 10, .5)
mean(moneda_aire)
# Media con formula (sumatorio xi * pxi). Experimento se repite 10 veces
media <- 10*0.5
media
# Varianza (distancia al cuadrado promedio de cada observacion con su media)
# Simulacion
var(moneda_aire)
# Varianza con formula (Media(x-ux)2)
mean((moneda_aire - media)^2)
# Varianza con formula alternativa n * p * (1-p)
10*0.5*(1-0.5)
# ¿Pasa lo mismo que en anterior punto? (caida probabilidad cuando aumenta n)
pbinom(5, 10, 0.5)
pbinom(50, 100, 0.5)
pbinom(500, 1000, 0.5)
pbinom(5000, 10000, 0.5)
# Cae mucho menos y se acerca asintoticamente a 0.5
pbinom(4, 10, 0.5)
pbinom(4999, 10000, 0.5)

# Jugar a la ruleta 36 números (ir subiendo cantidad de veces que se juega)
# Multinomial (varios posibles resultados discretos)
y=runif(10,0,36) 
Y=round(y)  # sin decimales (no puede salir en la ruleta)
# Media
mean(Y)

# ¿Cuanto dinero ganamos en la ruleta?
# Apostamos un dolar  al 18
premio=ifelse(Y==18, 36, -1)
sum(premio)

# Histograma ruleta
z=runif(100000,0,36) 
hist(z, probability = TRUE)
lines(density(z), lty="dotted", lwd=2, col="red")

# Ejemplo con base datos real
library(datasets)
data(mtcars)
View(mtcars)
colMeans(mtcars)

# Matriz varianzas y covarianzas

var(mtcars)
# Varianza solo de disp
var(mtcars$disp)
var(mtcars[, 1:4])
var(mtcars[, c(1,2,4)])
round(var(mtcars[, c(1,2,4)]),1)

# Matriz correlaciones
cor(mtcars[, c(1,2,4)])
x <- cor(mtcars[, c(1,2,4)])
# Visualizacion correlaciones
library(corrplot)
corrplot(cor(mtcars[, c(1,2,4)]))
corrplot(x)
corrplot(cor(mtcars[, c(1,2,4)]), method= "number")
corrplot(cor(mtcars[, c(1,2,4)]), method= "square")
corrplot(cor(mtcars[, c(1,2,4)]), method= "ellipse")

# Visualizacion
library(ggplot2)
library(GGally)
ggpairs(mtcars, columns = c(1,2,4))




pbinom(8,10,0.5) - pbinom(4,10,0.5)
