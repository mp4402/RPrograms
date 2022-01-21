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

#
