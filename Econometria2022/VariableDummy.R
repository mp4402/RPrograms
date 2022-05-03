library(readxl)
dat1 <- read_excel("Salario profesores US.xlsx", col_name = FALSE, sheet = 2)

library(tidyr)
dat2 <- separate(dat1, 1 ,c("Salary", "Spending","D2","D3"), sep = " ")
dat2$Salary <- as.numeric(gsub(",","",dat2$Salary))

modelo0 <- lm(Salary ~ 1, dat2)
summary(modelo0)
mean(dat2$Salary)
modelo1 <- lm(Salary ~ D2 + D3, dat2)
summary(modelo1)

salarios <- modelo1$coefficients
salarios <- as.data.frame(salarios)
salarios$zonas <- c("West","North","South")
salarios[2,1] = salarios[1,1]+salarios[2,1]
salarios[3,1] = salarios[1,1]+salarios[3,1]

library(ggplot2)
ggplot(salarios, aes(zonas, salarios)) + geom_bar(stat = "identity")

library(carData)
data("Salaries", package = "carData")

modelo2<- lm(salary ~ sex, data = Salaries)
summary(modelo2)

modelo00 <- lm(salary ~ 1, data = Salaries)
summary(modelo00)
