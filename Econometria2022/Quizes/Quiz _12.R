#Mario Enrique Pisquiy G�mez
#Carn� 20200399

#Pregunta 1
#Indique dos maneras que puede pasar la base de datos a R, dado 
#excel en csv.

#Crear un proyecto nuevo, en el cual se coloca la funcion read.'extensi�n del archivo'("nombre del archivo")
#La segunda es colocar todo el path de la ubicaci�n del archivo incluyendo su extensi�n en el mismo formato de arriba

#Ejercicio 2
#Corra USArrests (ya esta pre instalado) en R y obtenga el promedio de tosas las columnas
# menos la columna de UrbanPop. Genere un grafico que indique como se comporta la relacion 
#entre poblacion urbana y violaciones e indique la correlacion.
#Corra: para que corra el ejercicio

library(datasets)
colMeans(USArrests[-3])
library(GGally) 
ggpairs(USArrests[3:4])

#La poblaci�n urbana y las violaciones son directamente proporcionales