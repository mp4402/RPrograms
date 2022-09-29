library(lubridate)
library(nycflights13)
library(tidyverse)

#### el día de hoy ####
today()
### base r
Sys.time()

####
now()

#### parsear fechas de texto ####
#parsear x
x <- "1994 October 27th"
ymd(x)

y <- "1994 October 27"
ymd(y)

y <- "27.10.1994"

dmy(y)

x <- "1994 octubre 27"
ymd(x)

#### parsear timedates ####
z <- "oct, 27th 1994 14:00"
mdy_hm(z)

#### diferencias de tiempo ####
date_landing <- mdy("July 20, 1969")
moment_step <- mdy_hms("July 20, 1969, 02:56:16", tz ="UTC")

#### cuantos dias desde el primer hombre en la luna ####
difftime(today(), date-landing, unites = "days")

#### suma tiempos ####
mon_lpm <- dmy_hm("26 Sep 2022 13:00")
mon_lpm + weeks(x=1)

##### Consideraciones de lubridate ####
#duration. mide la cantidad exacta entre dos momentos. Cronometro
#periods: Interpretación umana del tiempo

#### 2020
feb <- dmy("28 feb 2020")
feb + dyears(x=1)


jan <- dmy("31 jan 2022")
jan + month(x=1)

add_with_rollback(jan, months(1), roll_to_first = TRUE)

#### Secuencias de fechas
jan <- dmy("31 jan 2022")
month_seq <- 1:12 * months(1)
month_seq + jan 
oct <- dmy("31 oct 2022")
seq(jan,oct,"weeks")

#### flights
flights %>%
  select(year,month,day,hour,minute,arr_time)

flights <- flights %>%
            mutate(departure = make_date(year,month,day))

flights <- flights %>%
            mutate(departure = make_datetime(year,month,day,hour,minute))

####
day(flights$departure)
month(flights$departure, label = TRUE)
