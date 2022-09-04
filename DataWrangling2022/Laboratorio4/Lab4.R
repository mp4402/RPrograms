library(readr)
library(dplyr)
library(stringr)
library(tidyverse)
library(highcharter)
library(plotly)

data <- read_csv2("tabla_completa.csv")

data$unidad <- iconv(data$unidad, to = "UTF-8")
names(data) <- tolower(names(data))
names(data)



data["unidad"][data["unidad"] == "Camion Peque–o"] <- "Camion Pequenio"
data$tipo_orden <- tolower(data$tipo_orden)

#El total cobrado por piloto
data %>%
  select(piloto,q)%>%
  group_by(piloto)%>%
  summarise(q = sum(q))

#Encontrar los tipos de unidad
data %>%
  select(unidad)%>%
  summarise(q= n_distinct(unidad))
#3 tipos de unidad
#Camión grande
#Panel
#Camión pequeño

#Cantidad de viajes hechos por cada tipo de unidad
data %>%
  select(q,unidad) %>%
  group_by(unidad)%>%
  summarise(q = sum(q))

#Promedio de credito(dias) por mes
data %>%
  select(credito,mes) %>%
  group_by(mes) %>%
  summarise(credito_promedio = mean(credito))

#Desviacion estandar de credito(dias) por mes
data %>%
  select(credito,mes) %>%
  group_by(mes) %>%
  summarise(credito_desv = sd(credito))

#Cantidad de faltante en total
data %>%
  select(tipo_orden,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  summarise(cantidad = n())

#Cantidad de faltante segun unidades

data %>%
  select(tipo_orden,unidad) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  group_by(unidad) %>%
  summarise(cantidad = n())%>%
  arrange(desc(cantidad))%>% 
  hchart("column",hcaes(x = unidad, y = cantidad)) %>%
  hc_title(text="<b>Unidades ordenados por su total de faltante")


#Unidad tipo panel
data %>%
  select(tipo_orden,unidad) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  filter(tolower(unidad) == 'panel') %>%
  summarise(unidad = n())

#Unidad tipo camion grande
data %>%
  select(tipo_orden,unidad) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  filter(tolower(unidad) == 'camion grande') %>%
  summarise(unidad = n())

#Unidad tipo camion pequeño
data %>%
  select(tipo_orden,unidad) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  filter(tolower(unidad) == 'camion pequenio') %>%
  summarise(unidad = n())

#Cantidad de faltante por piloto
data %>%
  select(tipo_orden,piloto,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  group_by(piloto) %>%
  summarise(cantidad_faltante = n(),total_q = sum(q)) %>%
  arrange(desc(total_q))%>% 
  hchart("column",hcaes(x = piloto, y = cantidad_faltante)) %>%
  hc_title(text="<b>Pilotos ordenados por su total de faltante")

#Promedio de faltante de TODOS los pilotos, promedio en general por piloto
data %>%
  select(tipo_orden,piloto) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  group_by(piloto) %>%
  summarise(cantidad = n()) %>%
  summarise(prom = mean(cantidad))

#Cantidad de faltante por ubicacion
data %>%
  select(tipo_orden,ubicacion) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  group_by(ubicacion) %>%
  summarise(cantidad = n())%>%
  arrange(desc(cantidad))%>% 
  hchart("column",hcaes(x = ubicacion, y = cantidad)) %>%
  hc_title(text="<b>Ubicaciones ordenadas por su total de faltante")

#Cantidad de faltante por mes
data %>%
  select(tipo_orden,mes,q,credito) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  group_by(mes,credito)%>%
  summarise(cantidad = sum(q))

#Cantidad de devolución en total
data %>%
  select(tipo_orden,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'devolucion') == TRUE) %>%
  summarise(cantidad = n())

#Cantidad de devolución por mes 
data %>%
  select(tipo_orden,q,mes,credito) %>%
  filter(str_detect(tolower(data$tipo_orden),'devolucion') == TRUE) %>%
  group_by(mes,credito)%>%
  summarise(cantidad = n())

#Cantidad de despacho a cliente en total
data %>%
  select(tipo_orden,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'despacho a cliente') == TRUE) %>%
  summarise(cantidad = n())

#Cantidad de despacho a cliente en total
data %>%
  select(tipo_orden,q,mes,credito) %>%
  filter(str_detect(tolower(data$tipo_orden),'despacho a cliente') == TRUE) %>%
  group_by(mes,credito)%>%
  summarise(cantidad = sum(q))

#Total de credito dado por tipo de credito
creditos_total <- data %>%
  select(credito,q) %>%
  group_by(credito)%>%
  summarise(total = sum(q))

#Total de creditos dados por tipo de credito
creditos_cantidad <- data %>%
  select(credito,q) %>%
  group_by(credito)%>%
  summarise(cantidad = n())

#Unimos las dos tablas 
creditos <- merge(creditos_total,creditos_cantidad)
#Ratio de credito promedio dado por tipo de credito
creditos$prom <- creditos$total/creditos$cantidad

data %>%
  select(tipo_orden,credito) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  group_by(credito) %>%
  summarise(cantidad = n())

data %>%
  select(tipo_orden,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE & str_detect(tolower(data$tipo_orden),'despacho a cliente')) %>%
  summarise(cantidad = n())

data %>%
  select(tipo_orden,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE & str_detect(tolower(data$tipo_orden),'devolucion')) %>%
  summarise(cantidad = n())

data %>%
  select(tipo_orden,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'devolucion') == TRUE & str_detect(tolower(data$tipo_orden),'despacho a cliente')) %>%
  summarise(cantidad = n())

data %>%
  select(tipo_orden,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE & str_detect(tolower(data$tipo_orden),'despacho a cliente') & str_detect(tolower(data$cliente),'devolucion') == TRUE) %>%
  summarise(cantidad = n())

data %>%
  select(tipo_orden,unidad,piloto) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE & str_detect(tolower(data$tipo_orden),'despacho a cliente')) %>%
  group_by(unidad,piloto) %>%
  summarise(cantidad = n())

data %>%
  select(tipo_orden,cantidad) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  summarise(cantidad = sum(cantidad))

data %>%
  select(tipo_orden,cantidad) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE & str_detect(tolower(data$tipo_orden),'despacho a cliente')) %>%
  summarise(cantidad = sum(cantidad))

data %>%
  select(piloto,q) %>%
  group_by(piloto) %>%
  summarise(total = sum(q))

data %>%
  select(piloto,q) %>%
  group_by(piloto) %>%
  summarise(total = sum(q)) %>%
  summarise(prom = mean(total))

data %>%
  select(cliente,q) %>%
  group_by(cliente) %>%
  summarise(total = sum(q)) %>%
  mutate(ratio = ((total/(sum(data$q)))*100)) %>%
  arrange(desc(ratio))%>% 
  hchart("column",hcaes(x = cliente, y = ratio)) %>%
  hc_title(text="<b>Clientes ordenados por ratio del total vendido")

creditos_total <- data %>%
                    select(cliente,credito,q) %>%
                    group_by(cliente,credito) %>%
                    summarise(total = sum(q))%>%
                    arrange(desc(credito),desc(total))
options(dplyr.summarise.inform = FALSE)

data%>%
  select(cliente,credito)%>%
  group_by(cliente)%>%
  summarise(prom = mean(credito))%>%
  arrange(desc(prom))%>%
  hchart("column",hcaes(x = cliente, y = prom)) %>%
  hc_title(text="<b>Credito promedio dado a cada cliente")

data %>%
  select(cliente,q) %>%
  group_by(cliente) %>%
  summarise(total = sum(q)) %>%
  arrange(desc(total))%>% 
  hchart("column",hcaes(x = cliente, y = total)) %>%
  hc_title(text="<b>Clientes ordenados por ratio del total vendido")

data %>%
  select(cliente,credito,q) %>%
  group_by(cliente,credito) %>%
  summarise(total = sum(q))%>%
  arrange(desc(credito),desc(total))%>% 
  hchart("column",hcaes(x = cliente, y = total)) %>%
  hc_title(text="<b>Clientes ordenados por ratio del total vendido") %>%
  hc_subtitle(text = "<b>5 empresas nos dan, cada una, más del 10% de nuestros ingresos")

unidad_faltante <- data %>%
  select(tipo_orden,unidad,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'faltante') == TRUE & str_detect(tolower(data$tipo_orden),'despacho a cliente') == FALSE) %>%
  group_by(unidad,tipo_orden) %>%
  summarise(cantidad = n(),total = sum(q))
  
unidad_despacho <- data %>%
  select(tipo_orden,unidad,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'despacho a cliente') == TRUE & str_detect(tolower(data$tipo_orden),'faltante') == FALSE) %>%
  group_by(unidad,tipo_orden) %>%
  summarise(cantidad = n(),total = sum(q))

unidad_devolucion <- data %>%
  select(tipo_orden,unidad,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'devolucion') == TRUE) %>%
  group_by(unidad,tipo_orden) %>%
  summarise(cantidad = n(),total = sum(q))

unidad_faltante_despacho <- data %>%
  select(tipo_orden,unidad,q) %>%
  filter(str_detect(tolower(data$tipo_orden),'despacho a cliente') == TRUE & str_detect(tolower(data$tipo_orden),'faltante') == TRUE) %>%
  group_by(unidad,tipo_orden) %>%
  summarise(cantidad = n(),total = sum(q))

unidad_vacio <- data %>%
  select(tipo_orden,unidad,q) %>%
  filter(is.na(tipo_orden)) %>%
  group_by(unidad,tipo_orden) %>%
  summarise(cantidad = n(),total = sum(q))

unidad_tipo_orden <- rbind(unidad_faltante,unidad_despacho,unidad_faltante_despacho,unidad_devolucion,unidad_vacio)

unidad_tipo_orden %>%
  arrange(unidad,tipo_orden)

unidades_totales <- data %>%
                    select(unidad,q)%>%
                    group_by(unidad) %>%
                    summarise(no_viajes = n())

unidades_camion_grande <- unidad_tipo_orden %>%
                            filter(tolower(unidad) ==  'camion grande')

total_camion_grande <- unidades_totales %>%
                        filter(tolower(unidad) == 'camion grande')

unidades_camion_grande$ratio = ((unidades_camion_grande$cantidad)*100)/total_camion_grande$no_viajes

unidades_camion_peq <- unidad_tipo_orden %>%
  filter(tolower(unidad) ==  'camion pequenio')

total_camion_peq <- unidades_totales %>%
  filter(tolower(unidad) == 'camion pequenio')

unidades_camion_peq$ratio = ((unidades_camion_peq$cantidad)*100)/total_camion_peq$no_viajes

unidades_panel <- unidad_tipo_orden %>%
  filter(tolower(unidad) ==  'panel')

total_panel <- unidades_totales %>%
  filter(tolower(unidad) == 'panel')

unidades_panel$ratio = ((unidades_panel$cantidad)*100)/total_panel$no_viajes

unidades_totales_final <- rbind(unidades_camion_grande,unidades_camion_peq,unidades_panel)

data %>%
  select(credito) %>%
  summarise(prom = mean(credito))
x                               