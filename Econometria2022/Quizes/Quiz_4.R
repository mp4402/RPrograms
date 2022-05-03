#Mario Pisquiy      Carné 20200399

#Una empresa de aerolineas quiere que se demuestre graficamente
#cuantas personas utilizan el servicio de E tickets para su
#boleto de avion. Se espera de que 50% de las personas tengan ya 
#e-ticket. Para ello, la empresa pide que se determine, con un experimento
# de 20 rondas, que se pueda indicar graficamente 
#en grupos determinados cuantas personas podrian tener e-ticket.

#Pregunta 1: Muestre en un histograma la distribucion de 
#prob que estos grupos tengan e ticket (todos con 0.5). Considere
#que se hace de manera aleatoria.
#Primera clase: 20 personas
#Un avion: 200 personas
#Todo el aeropuerto: 20000 personas. 


#Explique, porque cuando mas repeticiones se dan en un experimento binomial, 
#se aproxima a una funcion normal? 

#Pregunta 2

#Que es lo que diferencia una variable continua de una variable discreta?
# Como se observaria graficamente una distribucion de probabilidad para ambas?

boletosPrimeraClase <- rbinom(20, 20, 0.5)
boletosAvion <- rbinom(20, 200, 0.5)
boletosAeropuerto <- rbinom(20, 20000, 0.5)
hist(boletosPrimeraClase)
hist(boletosAvion)
hist(boletosAeropuerto)

#porque se tienen más datos, en los cuales se repiten un mayor número de veces aquellos
#que estén más cerca del valor esperado

#Pregunta 2
#Que una variable continua puede tener diferentes valores, mientras que una discreta se encuentra en un rango
#de valores.