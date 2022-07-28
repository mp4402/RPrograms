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


modelo3 <- lm(salary ~ rank,data =Salaries)
summary(modelo3)

salarios2 <- modelo3$coefficients
salarios2 <- as.data.frame(salarios2)
salarios2$tenure <- c("Aistente", "Asociado", "Profesor")
salarios2[2,1] = salarios2[1,1] + salarios2[2,1]
salarios2[3,1] = salarios2[1,1] + salarios2[3,1]
ggplot(salarios2, aes(tenure, salarios2)) + geom_bar(stat = "identity")

modelo4 <- lm(salary ~ rank + sex, data = Salaries)
summary(modelo4)

modelo5 <- lm(salary ~ yrs.service, data = Salaries)
summary(modelo5)

ggplot(data = Salaries, aes(yrs.service, salary)) + geom_point() + geom_smooth()

modelo6 <- lm(salary ~ rank + yrs.service, data = Salaries)
summary(modelo6)

library(HH)
ancova(salary ~ rank + yrs.service, data = Salaries)

modelo7 <- lm(salary ~ sex + yrs.service + sex*yrs.service, data = Salaries)
summary(modelo7)

ggplot(data ~ Salaries, aes(yrs.service, salary, color = sex)) + geom_point() + geom_smooth(method="lm", se=FALSE)
