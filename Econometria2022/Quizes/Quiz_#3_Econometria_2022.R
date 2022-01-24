#Mario Enrique Pisquiy Gómez          Carné 20200399
#Una tienda recibe a 400 personas a diario aprox.
#La encargada de la tienda quisiera saber aprox. cuantos 
#hombres llegan. A la tienda llegan 20 personas
#cada 30 minutos, y esta trabaja 10 horas, por lo que quiere
#saber cuantos hombres llegan cada media hora (20 grupos de 20 personas)

#Sabiendo eso se pide: 
#Realice una prueba aleatoria que indique con esas condiciones 
#(20 grupos de 20) cuantos hombres llegan a la tienda. Realice asumiendo
# 50% y 80% de prob. que sea hombre. 

#Con 50%, obtenga la prob EXACTA que indique cuando 5 personas de un grupo 
#de 20 sean hombres. Tambien la prob exacta de 15 de 20.  

#20 grupos de 20 con probabilidad del 50%
rbinom(20, 20, 0.5)

#20 grupos de 20 con probabilidad del 80%
rbinom(20, 20, 0.8)

#probabilidad de que sean 5 hombres de un grupo de 2 personas
dbinom(5, 20, 0.5)

#probabilidad de que sean 15 hombres de un grupo de 2 personas
dbinom(15, 20, 0.5)