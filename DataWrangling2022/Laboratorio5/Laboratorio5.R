library(lubridate)
library(readxl)

##### Ejercicio 1 ####
#Variable que guarda el último eclipse
start_date <- ymd_hms("2017 august 21 18:26:40")

#Variable que guarda el valor de un synodic_month
synodic_month <- days(29) + hours(12) + minutes(44) + seconds(3)

#Variable que guarda un saros
saros <- ymd_hms(synodic_month * 223)

#Siguiente eclipse
for (i in 1: 223)
{
  if (i == 1){
    next_date <- start_date + synodic_month  
  }
  else{
    next_date <- next_date + synodic_month
  }
}


##### Ejercicio 2 ####
data <- read_excel("data.xlsx")
colnames(data) <- c("fecha_creacion","hora_creacion","caller_id","cod","email","sms","call","fecha_final","fecha_inicio")
View(data)

hms::hms(hours:1,min=2,sec=12)
hour(data$`Hora Creación`[1])

strftime