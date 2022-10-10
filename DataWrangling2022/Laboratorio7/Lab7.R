library(readr)
library(stringr)
library(dplyr)
library(lubridate)

data <- read.csv("c1.csv")

data %>%
  select(Fecha) %>%
  filter(str_detect(data$Fecha,'/')==TRUE)

data$Fecha <- dmy(data$Fecha)
