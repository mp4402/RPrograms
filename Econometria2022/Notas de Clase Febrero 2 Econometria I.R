rm(list = ls())

#Programa algebra lineal Daniel Fernandez Universidad Francisco Marroquin

# Creacion vector
x <- c(2,5,1,8)
x
# Cambio componente en vector
x[3] <- 7
x
# En secuencia 0, 3, 6, 9, 12, 15
y <- seq(0,12, by = 3)
y
# En repeticion
z <- rep(5,8)
z
# Numeros aleatorios
a <- sample(1:20, 5, replace = TRUE)
a2 <- sample(1:20, 21, replace = FALSE)
# Si queremos que ademas de realizar una operacion, se imprima, usamos parentesis
(zz <- rep(3,5))

# Creacion matriz (datos, nrow, ncol)
# Con repeticion valor
X <- matrix(4, nrow = 2, ncol = 3)
X
# Con distintos valores
Y <- matrix (c(4,2,4,1,5,3), nrow = 3, ncol = 2, byrow = TRUE)
Y
# Se consigue exactamente lo mismo sin especificar componente funcion, 
# aunque es mas dificil que otros interpreten el codigo
Z <- matrix (c(1,7,8,4,1,9), 3, 2, TRUE)
Z
# Byrow sirve para especificar el orden en el que se asignan 
# elementos en la matriz
Z2 <- matrix(c(1,7,8,4,1,9), nrow = 3, ncol = 2, byrow = FALSE)
Z
Z2

# Matriz numeros aleatorios
A <- matrix(sample(1:20,8, replace = TRUE), nrow = 2, ncol = 4, 
            byrow = TRUE)
A
# Cambio componente en matriz
Z2[1,2] <- 50
Z2
Z2[1,3] <- 50
Z2
# Cambio componente matriz con numero aleatorio
Z2[1,2] <- sample(1:20, 1)

# Algebra de vectores
# Suma escalar con vector
2 + x
x
# Multiplicacion vector por escalar
3 * y
y
# Suma de vectores con mismo numero componentes
y
zz
length(y)
length(zz)
length(y) == length(zz)
y + zz
# Suma con diferente numero de componentes
x
z
length(x)
length(z)
length(x) == length(z)
x + z
# Suma con diferente numero de componentes otro caso
length(x)
length(y)
length(x) == length(y)
x + y
# Multiplicacion vectores con mismos elementos
length(y) == length(zz)
y
zz
y * zz
# Multiplicacion vectores con diferentes elementos
length(x) == length(y)
x
y
x * y

# Algebra de matrices
# Suma escalar con matriz
A
4 + A
# Multiplicacion escalar con matriz
A
4 * A

# Suma de matrices
B <- matrix(c(3,7,1,4), nrow = 2, ncol = 2, byrow = TRUE)
C <- matrix(c(2,1,5,3), nrow =2, ncol = 2, byrow = TRUE)
dim(B)
dim(C)
dim(B) == dim(C)
B + C
# Suma no definida
dim(A) == dim(B)
A + C
# Multiplicacion matrices
dim(B)
dim(C)
ncol(B) == nrow(C)
B
C
B * C
B %*% C
# ¿Cual es correcto?
# Multiplicacion no definida
dim(A)
dim(B)
ncol(A) == nrow(B)
A%*%B
ncol(B) == nrow(A)
B%*%A
# El orden importa, no hay propiedad conmutativa
B %*% C
C %*% B
# Multiplicacion escalar es lo mismo que multiplicar por matriz escalar
(diag(2)*3) %*% B
3 * B
(diag(2)*3) %*% B == 3 * B