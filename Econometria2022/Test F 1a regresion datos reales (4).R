# Programa 3 Generacion test F
# Daniel Fernandez Universidad Francisco Marroquin

# Cargo programa 1a regresion datos reales

# Voy a utilizar el ultimo modelo Inflacionmm ~ Cambio M2 lag + Cambio petroleo
model5 <- lm(data = datfinal2, Inflacionmm ~ cambioM2mmlag + 
               cambiopetmmlag)
summary(model5)

# Necesito primero el modelo restringido
model6 <- lm(data = datfinal2, Inflacionmm ~ 1)
summary(model6)
mean(datfinal2$Inflacionmm, na.rm = TRUE)

# Especificar test F
# H0: Todos Bi son 0 (excepto B0)
# HA: Algun Bi diferente 0 (excepto B0)

# Consigo SRR (suma residuos modelo restringido)
residuos6 <-model6$residuals
SRR <- sum(residuos6^2)
ST <- sum((datfinal2$Inflacionmm - mean(datfinal2$Inflacionmm, na.rm = TRUE))^2, na.rm = TRUE)
#SRR = ST
SRR == ST
all.equal(SRR, ST)
# Problema R para igualdades
0.3 - 0.1 == 0.5 - 0.3
all.equal(0.3 - 0.1, 0.5 - 0.3)

# Consigo SRS (suma residuos modelo sin restringir)
SRS <- sum(model5$residuals^2)
# Construyo test F
Numerador_F <- (SRR-SRS) / (3-1)
Denominador_F <- SRS / (291 - 3)
Test_F <- Numerador_F / Denominador_F
Test_F

# Compruebo que sale igual que en regresion
summary(model5)

# No sale igual, ¿por qué?
# Problema con grados libertad, model5 utiliza lag (se van 12 observaciones)
# Readecuamos base datos a utilizar y pasamos el programa de nuevo
# Buscamos cuando empieza variable con lag
datfinal2 <- datfinal2[36:327,]
#datfinal2 <- datfinal2[-(1:35),]

# Pasar programa de la linea 9 a la linea 41

# Comparo con valor en tablas
F_tablas <- 3.05

# Compruebo que valor es mayor
Test_F > F_tablas