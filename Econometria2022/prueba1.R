#Programa distribuciones probabilidad 

#Lanzar una moneda (1 cara, 0 cruz)
rbinon(1, 1, 0.5)
#Lanzar una moneda 10 veces
rbinom(10, 1, 0.5)
#Lanzar una moneda 10 veces (solo nos dice el numero de caras)
rbinom(1, 10, 0.5)

#Lanzar una moneda 100 veces y que nos diga el número de caras cada 10 veces
#10 rondas de 10 lanzamientos de monedas
rbinom(10, 10, 0.5)
#Lanzamiento de monedas trucadas
#Lanzar una moneda trucada 100 veces (90% de que salga cara)
rbinom(10, 10, 0.9)
#Lanzar una moneda trucada 100 veces (10% de que salga cara)
rbinom(10, 10, 0.1)

#Calculando función probabilidad en un punto
#Simulación 10 veces 10 tiradas, ¿Cuántas son igual a 7?
mean(rbinom(10, 10, 0.5) == 7)
#probabilidad de que salgan 7 caras tirando una moneda 10 veces
dbinom(7, 10, 0.5)
#probabilidad de que salgan 70 caras tirando una moneda 100 veces
dbinom(70, 100, 0.5)

#Probabilidad exacta de que salgan al menos 6 caras tirando una moneda
pbinom(6, 10, 0.5)

#Hisograma 
x <- rbinom(1000, 10, 0.5)
hist(x)
#Histograma con funcion densidad
hist(x, probability = TRUE)

#Estadistica descriptiva variable aleatoria
#Media o valor esperado (Centro distribución)
#Simulación
moneda_aire <- rbinom(10000, 10, 0.5)
mean(moneda_aire)

media <- 10*0.5
media

var(moneda_aire)

#Varianza con formula 
mean((moneda_aire - media) ^ 2)

#Varianza con formula alternativa n * p * (1 - p)
10*0.5*(1-0.5)
#¿Pas alo mismo que en anterior punto?
pbinom(5, 10, 0.5)
pbinom(50, 100, 0.5)
pbinom(500, 1000, 0.5)
pbinom(5000, 10000, 0.5)
pbinom(50000, 100000, 0.5)

#cae muco menos y es acerca asisntoticamente a 0.5
pbinom(4, 10, 0.5)
pbinom(4999, 10000, 0.5)

#jugar a la ruleta 36 números 
#multinomial
y = runif(10, 0, 36)
y = round(y)
#Media
mean(y)

#¿Cuanto dinero ganamos en la ruleta?
# Apostamos un dolar al 18
premio = ifelse(y == 18, 36, -1)
sum(premio)

z = runif(100000, 0, 36)
z = round(z)
hist(z, probability=TRUE)
lines(density(z),lty="dotted", lwd=2, col="red")

library(datasets)
data(mtcars)
view(mtcars)
colMeans(mtcars)

var(mtcars)

var(mtcars$disp)
var(mtcars[, 1:4])
var(mtcars[, c(1,2,4)])
