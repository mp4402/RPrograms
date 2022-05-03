# Programa regresion datos reales
# Daniel Fernandez Universidad Francisco Marroquin

rm(list = ls())

#Cargar base datos M2 Banguat
library(readxl)
dat1 <- read_excel("Medio circulante.xls")
dat1 <- read_excel("C:/Users/mepg1/Downloads/inflacion2.xls", skip = 4)
dat1 <- dat1[-13,]
dat1$Periodo <- c(1:12)
colnames(dat1) <- c("Periodo", 1995:2022)

library(tidyr)
dat2 <- gather(dat1, key = "Ano", value = "Inflacion", 2:28)
dat3 <- unite(dat2, "Fecha", 2:1, sep = "-")
dat33 <- unite(dat2, "Fecha", 2:1, sep = "-")
dat3 <- na.omit(dat3)

library(zoo)
#dat3$Fecha <- as.Date(dat3$Fecha)
dat3$Fecha <- as.Date(as.yearmon(dat3$Fecha))

mean(dat33$Inflacion, na.rm = TRUE)
mean(dat3$Inflacion)
