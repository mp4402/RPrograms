PracticaE <- read.csv("PracticaE.csv", header = TRUE)
PracticaE
x1 <- matrix(1, nrow = 33, ncol = 1)
x11 <- PracticaE[,2]
x11
x <- cbind(x1, x11)
y <- matrix(PracticaE[,3], nrow = 33, ncol=1)
Betas <- solve(t(x)%*%(x)) %*% t(x) %*% y
Betas
