library(readxl)
library(tidyr)
library(zoo)
library(quantmod)
library(dplyr)
library(pracma)
library(ggplot2)
library(GGally)

dat1 <- read_excel("Datos Econometria.xlsx", sheet = 1)

modelo0 <- lm(Desempleo ~ SalarioMinimo + GDPPerCapita + GDPCambio + IngresoPerCapita + EmpresasPequeñas, dat1)
summary(modelo0)

ggpairs(dat1, columns = c(2:8))
