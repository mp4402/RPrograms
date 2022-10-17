library(readr)
library(stringr)
library(dplyr)
library(lubridate)
library(highcharter)
library(ggplot2)
library(readxl)

#####
data <- read.csv("c1.csv")

data %>%
  select(Fecha) %>%
  filter(str_detect(data$Fecha,'/')==TRUE)

data$Fecha <- dmy(data$Fecha)

data <- data %>% 
  mutate(Pickup = str_replace(Pickup, "Q", ""))%>%
  mutate(Pickup = str_replace(Pickup, "-","0"))%>%
  mutate(Pickup = as.double(Pickup))
data <- data %>% 
  mutate(Camion_5 = str_replace(Camion_5, "Q", ""))%>%
  mutate(Camion_5 = str_replace(Camion_5, "-","0"))%>%
  mutate(Camion_5 = as.double(Camion_5))
data <- data %>% 
  mutate(Moto = str_replace(Moto, "Q", ""))%>%
  mutate(Moto = str_replace(Moto, "-","0"))%>%
  mutate(Moto = as.double(Moto))
data <- data %>% 
  mutate(directoCamion_5 = str_replace(directoCamion_5, "Q", ""))%>%
  mutate(directoCamion_5 = str_replace(directoCamion_5, "-","0"))%>%
  mutate(directoCamion_5 = as.double(directoCamion_5))
data <- data %>% 
  mutate(directoPickup = str_replace(directoPickup, "Q", ""))%>%
  mutate(directoPickup = str_replace(directoPickup, "-","0"))%>%
  mutate(directoPickup = as.double(directoPickup))
data <- data %>% 
  mutate(directoMoto = str_replace(directoMoto, "Q", ""))%>%
  mutate(directoMoto = str_replace(directoMoto, "-","0"))%>%
  mutate(directoMoto = as.double(directoMoto))
data <- data %>% 
  mutate(fijoCamion_5 = str_replace(fijoCamion_5, "Q", ""))%>%
  mutate(fijoCamion_5 = str_replace(fijoCamion_5, "-","0"))%>%
  mutate(fijoCamion_5 = as.double(fijoCamion_5))
data <- data %>% 
  mutate(fijoPickup = str_replace(fijoPickup, "Q", ""))%>%
  mutate(fijoPickup = str_replace(fijoPickup, "-","0"))%>%
  mutate(fijoPickup = as.double(fijoPickup))
data <- data %>% 
  mutate(fijoMoto = str_replace(fijoMoto, "Q", ""))%>%
  mutate(fijoMoto = str_replace(fijoMoto, "-","0"))%>%
  mutate(fijoMoto = as.double(fijoMoto))
data <- data %>% 
  mutate(factura = str_replace(factura, "Q", ""))%>%
  mutate(factura = str_replace(factura, "-","0"))%>%
  mutate(factura = as.double(factura))
  
data <- data[,-c(23,24,25,26,27,28)]

data <- data %>%
          arrange(Fecha)

dataEneroSeptiembre <- data %>%
                        filter(month(Fecha)<10)

dataOctubreDiciembre <- data %>%
                          filter(month(Fecha)>9)

write_excel_csv2(data,"c1_corregido.xls",delim=",")

#####

#Viajes agrupados por codigo y su ratio
data %>%
  select(ID, Cod) %>%
  group_by(Cod) %>%
  summarise(n = n())%>%
  mutate(ratio = (n/length(data[,1]))*100)%>%
  arrange(desc(n))

#Hay 74232 Latitudes
data %>%
  select(Lat) %>%
  distinct(Lat) %>%
  summarise(n = n())

#Hay 74223 Longitudes
data %>%
  select(Long) %>%
  distinct(Long) %>%
  summarise(n = n())

#Hay 4 puntos de origen
data %>%
  select(origen) %>%
  distinct(origen)

#No de viajes hechos en camion y su ratio total
data %>%
  select(Camion_5,ID) %>%
  filter(Camion_5 != 0) %>%
  summarise(conteo_camion = n()) %>%
  mutate(ratio = (conteo_camion/length(data[,1]))*100)

#No de viajes hechos en pickup y su ratio
data %>%
  select(Pickup,ID) %>%
  filter(Pickup != 0) %>%
  summarise(conteo_pickup = n()) %>%
  mutate(ratio = (conteo_pickup/length(data[,1]))*100)

#No de viajes hechos en moto y su ratio
data %>%
  select(Moto,ID) %>%
  filter(Moto != 0) %>%
  summarise(conteo_moto = n()) %>%
  mutate(ratio = (conteo_moto/length(data[,1]))*100)

#####

#Total facturado y costos fijos y directos, así como rentabilidad de enero a septiembre
dataEneroSeptiembre %>% 
  select(factura,fijoCamion_5,fijoPickup,fijoMoto,directoCamion_5,directoPickup,directoMoto) %>%
  summarise(total_facturado = sum(factura),
            total_fijo_camion = sum(fijoCamion_5),
            total_fijo_pickup = sum(fijoPickup),
            total_fijo_moto = sum(fijoMoto),
            total_directo_camion = sum(directoCamion_5),
            total_directo_pickup = sum(directoPickup),
            total_directo_moto = sum(directoMoto)) %>%
  mutate(rentabilidad = total_facturado-
           (total_fijo_camion + 
              total_fijo_pickup + 
              total_fijo_moto + 
              total_directo_camion + 
              total_directo_pickup + 
              total_directo_moto))

#Tenemos 74239 postes
data %>%
  select(ID) %>%
  distinct(ID) %>%
  summarise(n = n())

#####
#No de viajes entre 5 y 30 minutos: 39559
data %>%
  select(X5.30) %>%
  filter(str_detect(tolower(data$X5.30),'x') == TRUE) %>%
  summarise(n = n())
  
#No de viajes entre 30 y 45 minutos: 52745
data %>%
  select(X30.45) %>%
  filter(str_detect(tolower(data$X30.45),'x') == TRUE) %>%
  summarise(n = n())
  
#No de viajes entre 45 y 75 minutos: 34284
data %>%
  select(X45.75) %>%
  filter(str_detect(tolower(data$X45.75),'x') == TRUE) %>%
  summarise(n = n())

#No de viajes entre 75 y 120 minutos: 110764
data %>%
  select(X75.120) %>%
  filter(str_detect(tolower(data$X75.120),'x') == TRUE) %>%
  summarise(n = n())
  
#No de viajes entre mas de 120 minutos: 26373
data %>%
  select(X120.) %>%
  filter(str_detect(tolower(data$X120.),'x') == TRUE) %>%
  summarise(n = n())

#####
#No de viajes entre 5 y 30 minutos: 39559
data %>%
  select(X5.30, Cod) %>%
  filter(str_detect(tolower(data$X5.30),'x') == TRUE) %>%
  group_by(Cod) %>%
  summarise(n = n()) %>%
  arrange(desc(n))

#No de viajes entre 30 y 45 minutos: 52745
data %>%
  select(X30.45, Cod) %>%
  filter(str_detect(tolower(data$X30.45),'x') == TRUE) %>%
  group_by(Cod) %>%
  summarise(n = n()) %>%
  arrange(desc(n))

#No de viajes entre 45 y 75 minutos: 34284
data %>%
  select(X45.75, Cod) %>%
  filter(str_detect(tolower(data$X45.75),'x') == TRUE) %>%
  group_by(Cod) %>%
  summarise(n = n()) %>%
  arrange(desc(n))

#No de viajes entre 75 y 120 minutos: 110764
data %>%
  select(X75.120, Cod) %>%
  filter(str_detect(tolower(data$X75.120),'x') == TRUE) %>%
  group_by(Cod) %>%
  summarise(n = n()) %>%
  arrange(desc(n))

#No de viajes entre mas de 120 minutos: 26373
data %>%
  select(X120., Cod) %>%
  filter(str_detect(tolower(data$X120.),'x') == TRUE) %>%
  group_by(Cod) %>%
  summarise(n = n()) %>%
  arrange(desc(n))

##### 


data <- data %>%
  mutate(marge_venta = (factura - (Camion_5 + Pickup + Moto)))
data <- data %>%
  mutate(marge_venta_porcostos = (factura - (fijoCamion_5 + directoCamion_5+ fijoPickup +directoPickup+ fijoMoto+ directoMoto)))


data %>%
  select(marge_venta) %>%
  summarise(media_margen = mean(marge_venta))


#No de viajes entre 5 y 30 minutos: 39559
data %>%
  select(X5.30, marge_venta) %>%
  filter(str_detect(tolower(data$X5.30),'x') == TRUE) %>%
  summarise(n = n(), media_margen = mean(marge_venta))

#No de viajes entre 30 y 45 minutos: 52745
data %>%
  select(X30.45, marge_venta) %>%
  filter(str_detect(tolower(data$X30.45),'x') == TRUE) %>%
  summarise(n = n(), media_margen = mean(marge_venta))

#No de viajes entre 45 y 75 minutos: 34284
data %>%
  select(X45.75, marge_venta) %>%
  filter(str_detect(tolower(data$X45.75),'x') == TRUE) %>%
  summarise(n = n(), media_margen = mean(marge_venta))

#No de viajes entre 75 y 120 minutos: 110764
data %>%
  select(X75.120, marge_venta) %>%
  filter(str_detect(tolower(data$X75.120),'x') == TRUE) %>%
  summarise(n = n(), media_margen = mean(marge_venta))

#No de viajes entre mas de 120 minutos: 26373
data %>%
  select(X120., marge_venta) %>%
  filter(str_detect(tolower(data$X120.),'x') == TRUE) %>%
  summarise(n = n(), media_margen = mean(marge_venta))

#####
data %>%
  select(Camion_5,marge_venta,ID) %>%
  filter(Camion_5 != 0) %>%
  summarise(conteo_camion = n(),media_margen = mean(marge_venta)) %>%
  mutate(ratio = (conteo_camion/length(data[,1]))*100)

#No de viajes hechos en pickup y su ratio
data %>%
  select(Pickup,marge_venta,ID) %>%
  filter(Pickup != 0) %>%
  summarise(conteo_pickup = n(),media_margen = mean(marge_venta)) %>%
  mutate(ratio = (conteo_pickup/length(data[,1]))*100)

#No de viajes hechos en moto y su ratio
data %>%
  select(Moto,marge_venta,ID) %>%
  filter(Moto != 0) %>%
  summarise(conteo_moto = n(),media_margen = mean(marge_venta)) %>%
  mutate(ratio = (conteo_moto/length(data[,1]))*100)

#####
analisisIngresosCostos <- data %>%
  group_by(lubridate::month(Fecha)) %>%
  mutate(Costos_Fijos = (fijoCamion_5 + fijoPickup + fijoMoto)) %>%
  mutate(Costos_Directos = (directoCamion_5 + directoPickup + directoMoto)) %>%
  summarise(Facturado = sum(factura), 
            totalCostosFijos = sum(Costos_Fijos), 
            totalCostosDirectos = sum(Costos_Directos))


names(analisisIngresosCostos) <- c("Mes","Facturado","Costos_Fijos", "Costos_Directos")

Factura_costos <- read_excel("Factura_costos.xlsx")

Factura_costos %>%
  ggplot(aes(fill=Categoria, y=Total, x=Mes)) + 
  geom_bar(position="dodge", stat="identity")

library(viridisLite)

cols <- viridis(3)
cols <- substr(cols, 0, 7)

Factura_costos %>%
  hchart('column', hcaes(x = Mes, y = Total, group = Categoria)) %>%
  hc_colors(cols) %>%
  hc_title(text="<b>Total Facturado y Costos por mes (en miles de dólares)")

analisisIngresosCostos %>%
  summarise(Facturado = sum(Facturado),
            Costos_Directos = sum(Costos_Directos),
            Costos_Fijos = sum(Costos_Fijos)) %>%
  mutate(razonTotal = (Facturado/Facturado)*100) %>%
  mutate(razonCostos = ((Costos_Directos+Costos_Fijos)/Facturado)*100)
  
#####

#No de viajes entre 5 y 30 minutos: 39559
data %>%
  select(X5.30, marge_venta,Cod) %>%
  filter(str_detect(tolower(data$X5.30),'x') == TRUE) %>%
  group_by(Cod) %>%
  summarise(n = n(), media_margen = mean(marge_venta)) %>%
  arrange(desc(media_margen))

#No de viajes entre 30 y 45 minutos: 52745
data %>%
  select(X30.45, marge_venta, Cod) %>%
  filter(str_detect(tolower(data$X30.45),'x') == TRUE) %>%
  group_by(Cod) %>%
  summarise(n = n(), media_margen = mean(marge_venta)) %>%
  arrange(desc(media_margen))

#No de viajes entre 45 y 75 minutos: 34284
data %>%
  select(X45.75, marge_venta, Cod) %>%
  filter(str_detect(tolower(data$X45.75),'x') == TRUE) %>%
  group_by(Cod) %>%
  summarise(n = n(), media_margen = mean(marge_venta)) %>%
  arrange(desc(media_margen))

#No de viajes entre 75 y 120 minutos: 110764
data %>%
  select(X75.120, marge_venta,Cod) %>%
  filter(str_detect(tolower(data$X75.120),'x') == TRUE) %>%
  group_by(Cod) %>%
  summarise(n = n(), media_margen = mean(marge_venta)) %>%
  arrange(desc(media_margen))

#No de viajes entre mas de 120 minutos: 26373
data %>%
  select(X120., marge_venta, Cod) %>%
  filter(str_detect(tolower(data$X120.),'x') == TRUE) %>%
  group_by(Cod) %>%
  summarise(n = n(), media_margen = mean(marge_venta)) %>%
  arrange(desc(media_margen))

data %>%
  select(ID,marge_venta,Cod) %>%
  filter(str_detect(tolower(data$Cod),'revision') == TRUE) %>%
  group_by(ID) %>%
  summarise(n = n(),total = sum(marge_venta)) %>%
  arrange(desc(n))

data %>%
  select(ID,marge_venta,Cod) %>%
  filter(str_detect(tolower(data$Cod),'cambio_fusible') == TRUE) %>%
  group_by(ID) %>%
  summarise(n = n(),total = sum(marge_venta)) %>%
  arrange(desc(n))

data %>%
  select(ID,marge_venta,Cod) %>%
  filter(str_detect(tolower(data$Cod),'cambio_correctivo') == TRUE) %>%
  group_by(ID) %>%
  summarise(n = n(),total = sum(marge_venta)) %>%
  arrange(desc(n))

data %>%
  select(ID,marge_venta,Cod) %>%
  filter(str_detect(tolower(data$Cod),'verificacion_indicadore') == TRUE) %>%
  group_by(ID) %>%
  summarise(n = n(),total = sum(marge_venta)) %>%
  arrange(desc(n))

data %>%
  select(ID,marge_venta,Cod) %>%
  filter(str_detect(tolower(data$Cod),'verificacion_medidores') == TRUE) %>%
  group_by(ID) %>%
  summarise(n = n(),total = sum(marge_venta)) %>%
  arrange(desc(n))

data %>%
  select(ID,marge_venta,Cod) %>%
  filter(str_detect(tolower(data$Cod),'revision_transformador') == TRUE) %>%
  group_by(ID) %>%
  summarise(n = n(),total = sum(marge_venta)) %>%
  arrange(desc(n))

data %>%
  select(ID,marge_venta,Cod) %>%
  filter(str_detect(tolower(data$Cod),'visita_por_correccion') == TRUE) %>%
  group_by(ID) %>%
  summarise(n = n(),total = sum(marge_venta)) %>%
  arrange(desc(n))

data %>%
  select(ID,marge_venta,Cod) %>%
  filter(str_detect(tolower(data$Cod),'visita') == TRUE) %>%
  group_by(ID) %>%
  summarise(n = n(),total = sum(marge_venta)) %>%
  arrange(desc(n))

data %>%
  select(ID,marge_venta,Cod) %>%
  filter(str_detect(tolower(data$Cod),'cambio_puentes') == TRUE) %>%
  group_by(ID) %>%
  summarise(n = n(),total = sum(marge_venta)) %>%
  arrange(desc(n))


data %>%
  select(ID) %>%
  group_by(ID) %>%
  summarise(n = n()) %>%
  filter(n >= 100 & n <= 125) %>%
  arrange(desc(n))

data %>%
  select(ID) %>%
  group_by(ID) %>%
  summarise(n = n()) %>%
  filter(n >= 75 & n <= 100) %>%
  arrange(desc(n))

data %>%
  select(ID) %>%
  group_by(ID) %>%
  summarise(n = n()) %>%
  filter(n >= 50 & n <= 75) %>%
  arrange(desc(n))

#####

data %>%
  select(Camion_5,Cod,factura) %>%
  filter(Camion_5 != 0) %>%
  group_by(Cod) %>%
  summarise(promedioCobro = mean(factura),
            minimoCobro = min(factura),
            maximoCobro = max(factura)) %>%
  arrange(Cod)

data %>%
  select(Pickup,Cod,factura) %>%
  filter(Pickup != 0) %>%
  group_by(Cod) %>%
  summarise(promedioCobro = mean(factura),
            minimoCobro = min(factura),
            maximoCobro = max(factura)) %>%
  arrange(Cod)

data %>%
  select(Moto,Cod,factura) %>%
  filter(Moto != 0) %>%
  group_by(Cod) %>%
  summarise(promedioCobro = mean(factura),
            minimoCobro = min(factura),
            maximoCobro = max(factura)) %>%
  arrange(Cod)

