#Mario Enrique Pisquiy Gómez
#20200399

#Quiz 25
#Pregunta 1
#Correr:
Ej = as.data.frame(matrix(c(0, 1, 1, 2, 3, 5, 8, 13, 21,34),5,2,T))
#Los nombres de las columnas son V1 (Y) y V2 (X)
#Dada la siguiente matriz que debe correr, donde la columna
#1 es Y y la dos es X, calcule un test F con los siguientes pasos.
modeloQuiz <- lm(data = Ej, Ej$V1 ~ Ej$V2)
#1) #Indicar el modelo restringido
modeloRest <- lm(data = Ej, Ej$V1 ~ 1)

#2) #Plantear el Test F
#Se realiza la división entre la resta del resultado obtenido por el modelo restringido y el modelo sin restricciones
#Dividido dentro del número de restricciones, y el resultado del modelo sin restringir partido el número de grados de 
#libertad, la fórmula completa es: (Para el punto 3 considerese que ST = SRR y SR = SRS)
#Test  = ((SRR-SRS)/(q))/(SRS/(T-K))

#3) #Indicar la suma de SR y ST
ST <- (sum((Ej$V1-mean(Ej$V1))^2))
residuos <- modeloQuiz$residuals
SR <- sum(residuos^2)

#4) #Sabiendo que la formula para test F es: 
# (SRR-SRS)(k-1)/(SRS)(T-k). Interprete el resultado
#y plantee como resolver y comparar el ejercicio.
#(No tiene que resolver, aunque puede hacerlo,
#solo una explicacion de que hacer)
Numerador <- (ST-SR)/(1)
Denominador <- SR/(5-2)
TestF <- Numerador / Denominador
TestF
#El valor obtenido por el test F es 5761.655, lo cual resulta en que es un buen valor para este, puesto que 
#Al ser un valor muy alto, este sobrepasa al valor de rechazo, por lo que se rechaza la hipótesis nula (Betas = 0)
# y se toma la hipótesis alternativa (Betas =! 0)
