#Mario Enrique Pisquiy Gómez
#Carné 20200399

#1: ?Que diferencia una limpieza de datos en excel vs una limpieza
#de datos en R? ?Porque la consolidacion de columnas es mas rapida en R?

#La liempieza de datos en excel es muy tardada y echa a mano, mientras que en R es automatica, por lo que sólo se 
#ajusta a los patrones del documento y es facilmente replicable

#2: ?Que funcion se utiliza para que se borren celdas vacias en R? ?Que
#utilidad genera borrar las celdas? 

#na.omit, tiene utilidad para que al momento de calcular la media, esta no salga como na

#3: Describa que hace la funcion Merge. ?Como se identifico la 
#variable dependiente e independiente en la ecuacion con Inflacion
#y Medio circulante?

#une dos columnas como una matriz, organizandola según el parámetro puesto. x es la variable independiente 
# y Y es la variable dependiente, se identifican según nuestro modelo, en este caso, medio circulante es la 
#independiente e inflación es la dependiente

#4: ?Que problema resulta en R cuando solo se lee la fecha? ?Que se 
#le coloca al comando as.date para que organize bien la fecha?

#en el caso puesto, es que no reconoce cuál es el mes y el día, por lo que se coloca as.yearmon

#Problema practico: Corra lo siguiente
lynx
A = lynx
Linces = data.frame(as.matrix(A), date=time(A))
colnames(Linces) <- c("Especies","Periodo")
#Con la funion Delt, consiga el cambio anual de Especies
#de un periodo para otro. Utilice K = 0 y guardelo como
#otro data frame llamado Cambio Linces
library(quantmod)
cambioLinces <- Delt(Linces$Especies, k =0)
cambioLinces
