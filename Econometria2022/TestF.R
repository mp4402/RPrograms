rm(list = ls())

y <- c(3,5,4,9,8)
x <- c(1,2,2,4,5)

modelo1 <- lm(y ~ x)
summary(modelo1)

modelo2 <- lm(y ~ 1)
summary(modelo2)
mean(y)

sqrt((sum((y-mean(y))^2))/(5-1))
sd(y)

ST <- (sum((y-mean(y))^2))
residuos <- modelo1$residuals
SR <- sum(residuos^2)


Numerador_F <- (ST - SR) / (2-1)
Denominador_F <- SR / (5 - 2)
Estadistico_F <- Numerador_F / Denominador_F
summary(modelo1)

F_tabla <- 10.128
Estadistico_F