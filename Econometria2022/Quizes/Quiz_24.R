#Mario Enrique Pisquiy Gómez
#Carné 20200399

#Test 24
#1: ¿Que es y como se identifica la multicolinealidad?
#¿Es este efecto positivo entre variables exogenas y la endogena?

#Es que hallan variables con una correlación muy fuerte. Se identifica con el coeficiente de correlación
#Es negativo. porque puede producir o que no se pueda obtener los minimos cuadrados ordinarios o que la varainza sea muy alta


#2: ¿Como se explica y se determina una estimacion del 
# coeficiente beta en intervalos? 

#Se determina en base a los grados de libertad que se tengan, se entiende que mientras más grados de libertad, el error será menor, aproxiamandose casi a 0

#3:Escencialmente, ¿como se realiza una prueba F en R basado en
#el caso que se presente un modelo ineficiente?

#Se utiliza 1 en vez de una variable exógena.

#4: Dado los siguientes numeros (8,6,7,5,3,0,9) calcule el
#rse de las dos maneras vistas en clase. 
y <- c(8,6,7,5,3,0,9)

sqrt((sum((y-mean(y))^2))/(7-1))
sd(y)
