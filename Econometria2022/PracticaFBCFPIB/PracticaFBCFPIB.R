Datos <- read.csv2("FBCFPIB.csv", header = TRUE)
colMeans(Datos)
colMeans(Datos[,(2:5)])
library(GGally)
library(ggplot2)
ggplot(Datos,columns = 2:5)

#Tipo datos
is.matrix(Datos)
is.data.frame(Datos)

#Preparar matrices
#Columna 1s (dos formas)
x1 <- rep(1, 112)
x11 <- matrix(1, nrow = 112, ncol = 1)

#Segunda columna matriz de datos
x2 <- Datos[,2]
x22 <- matrix(data =Datos[,2],nrow = 112, ncol = 1)

#Crear matriz x
x <- cbind(x1, x2)
xx <- cbind(x11, x22)

colnames(x) <- c("cons","FBC")
colnames(xx) <- c("cons","FBC")
head(x)
head(xx)

x == xx
identical(x,xx)
all.equal(x,xx)

y <- matrix(Datos[,5], nrow = 112, ncol=1)
colnames(y) <- "PIBCAPm"
head(y)

Betas <- solve(t(xx)%*%(xx)) %*% t(xx) %*% y
Betas1 <- solve(t(x)%*%(x)) %*% t(x) %*% y
Betas
Betas1 

identical(Betas, Betas1)

modelo <- lm(PIBcap1470 ~ FBC_7014, data = Datos)
summary(modelo)
