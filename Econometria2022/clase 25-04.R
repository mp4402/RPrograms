# Programa 2 Generacion test F
# Daniel Fernandez Universidad Francisco Marroquin

rm(list = ls())

# Creacion vectores como vimos en clase
y <- c(3,5,4,9,8)
x <- c(1,2,2,4,5)

# Regresion
modelo1 <- lm(y ~ x)
summary(modelo1)

# Especificar test F
# Modelo restringido y sin restringir
# Modelo sin restringir
summary(modelo1)

# Modelo restringido
modelo2 <- lm(y ~ 1)
summary(modelo2)
mean(y)
# residual standard error(y)
sqrt((sum((y-mean(y))^2))/(5-1))
sd(y)