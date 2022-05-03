# Programa regresion datos reales
# Daniel Fernandez Universidad Francisco Marroquin

rm(list = ls())

#Cargar base datos M2 Banguat
library(readxl)
dat1 <- read_excel("imm18a.xls")
dat1 <- read_excel("imm18a.xls", skip = 3)
dat1 <- dat1[-c(13:16), -30]
dat1$MES <- c(1:12)
colnames(dat1) <- c("MES", 1995:2022)

library(tidyr)
dat2 <- gather(dat1, key = "Ano", value = "M2", 2:29)
dat3 <- unite(dat2, "Fecha", 2:1, sep = "-")
dat3 <- na.omit(dat3)

library(zoo)
dat3$Fecha <- as.Date(dat3$Fecha)
dat3$Fecha <- as.Date(as.yearmon(dat3$Fecha))

# Cargar base datos IPC
dat11 <- read_excel("inflacion2.xls", skip = 5)
dat11 <- dat11[-13,]
dat11$Periodo <- c(1:12)
dat22 <- gather(dat11, key = "Ano", "Inflacion", 2:28)
dat33 <- unite(dat22, "Fecha", 2:1, sep = "-")
dat33 <- na.omit(dat33)

dat33$Fecha <- as.Date(dat33$Fecha)
dat33$Fecha <- as.Date(as.yearmon(dat33$Fecha))

datfinal <- merge(x = dat3, y = dat33, by = "Fecha", all = TRUE)

# Conseguir cambio M2
library(quantmod)
datfinal$cambioM2 <- Delt(datfinal$M2, k = 12)

# Poner inflacion en tanto por 1
library(dplyr)
datfinal <- mutate(datfinal, Inflacion = Inflacion / 100)

# Primer modelo
modelo1 <- lm(data = datfinal, Inflacion ~ cambioM2)
summary(modelo1)

library(ggplot2)
ggplot(data = datfinal, aes(cambioM2, Inflacion)) + geom_point() + 
  geom_smooth(method = "lm")

ggplot(data = datfinal, aes(Fecha, cambioM2)) + 
  geom_point() + geom_smooth(method = "lm")
ggplot(data = datfinal, aes(Fecha, Inflacion)) + 
  geom_point() + geom_smooth(method = "lm")

# Segundo modelo (medias moviles)
# Primero calculamos medias moviles
library(pracma)
datfinal$cambioM2mm <- movavg(datfinal$cambioM2, 
                              n = 12, type = "s")
datfinal$Inflacionmm <- movavg(datfinal$Inflacion, 
                               n = 12, type = "s")

# Especificamos segundo modelo
model2 <- lm(data = datfinal, Inflacionmm ~ cambioM2mm)
summary(model2)

ggplot(data = datfinal, aes(cambioM2mm, Inflacionmm)) + geom_point() + geom_smooth(method = "lm")

# Introduciendo precio petroleo
datpet <- read_excel("petroleo.xlsx")
str(datpet)
datpet$Fecha <- as.Date(datpet$Fecha)
datpet <- datpet[,c(1,2)]
colnames(datpet) <- c("Fecha", "petroleo")
datfinal2 <- merge(x = datfinal, y = datpet, by = "Fecha", all = TRUE)

# Cambio precio petroleo
datfinal2$cambiopet <- Delt(datfinal2$petroleo, k = 12)

# Media movil
datfinal2$cambiopetmm <- movavg(datfinal2$cambiopet, n = 12, type = "s")

# Tercer modelo
model3 <- lm(data = datfinal2, Inflacionmm ~ cambioM2mm + 
               cambiopetmm)
summary(model3)

# Modelo con lag en inflación
datfinal2$cambioM2mmlag <- lag(datfinal2$cambioM2mm, 12)

model4 <- lm(data = datfinal2, Inflacionmm ~ cambioM2mmlag + 
               cambiopetmm)
summary(model4)

datfinal2$cambiopetmmlag <- lag(datfinal2$cambiopetmm, 6)

model5 <- lm(data = datfinal2, Inflacionmm ~ cambioM2mmlag + 
               cambiopetmmlag)
summary(model5)

# Sacar cosas del modelo
Betas <- model5$coefficients
Betas

Estimaciones <- model5$fitted.values
Estimaciones

Errores_estimacion <- model5$residuals
Errores_estimacion

# Intervalos confianza
confint(model5, level = 0.95)
confint(modelo1, level = 0.95)
confint(model5, level = 0.99)

datprueba <- data.frame(cambioM2mmlag = 0.18, cambiopetmmlag = 0.1)
predicciones <- predict(model5, datprueba, interval = "confidence")
predicciones


#Gráficos extra
library(jtools)
effect_plot(model5, pred = cambioM2mmlag, interval = TRUE, plot.points = TRUE)
effect_plot(model5, pred = cambiopetmmlag,interval = TRUE, plot.points = TRUE)

#Exportar la base de datos con cambios
write.csv2(datfinal2, file = "Base limpia.csv")

model6 <- lm(data = datfinal2, Inflacionmm ~ 1)
summary(model6)
mean(datfinal2$Inflacionmm, na.rm = TRUE)

residuos6 <- model6$residuals
SRR <- sum(residuos6^2) 
ST <- sum((datfinal2$Inflacionmm - mean(datfinal2$Inflacionmm, na.rm = TRUE))^2, na.rm=TRUE)
SRR = ST

SRS <- sum(model5$residuals^2)
Numerador_F <- (SRR-SRS)/(3 - 1)
Denominador_F <- SRS / (291 - 3)
Test_F <- Numerador_F / Denominador_F
Test_F
summary(model5)




datfinal2 <- datfinal2[36:327,]
