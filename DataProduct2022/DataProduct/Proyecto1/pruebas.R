library(readr)
library(dplyr)

tienda <- read_csv("tienda.csv")

tienda <- read_csv("tienda.csv")
names(tienda)[c(1,2,3,4,5,6,7,12,14,17)] <- c("row_id","order_id","order_date","ship_date","ship_mode","customer_id","customer_name","postal_code","product_id","product_name")
names(tienda) <- tolower(names(tienda))

names(tienda)

tienda %>%
  select(product_name, profit) %>%
  group_by(product_name) %>%
  summarise(total = sum(profit)) %>%
  arrange(desc(total)) %>%
  head(1)

tienda %>%
  select(product_name, profit) %>%
  group_by(product_name) %>%
  summarise(total = sum(profit)) %>%
  arrange(total) %>%
  head(1)

data %>%
  select(product_name,quantity, profit) %>%
  group_by(product_name) %>%
  summarise(total = sum(profit),cantidad_vendida = n()) %>%
  arrange(desc(total)) %>%
  head(1)

data %>%
  select(product_name,quantity, profit) %>%
  group_by(product_name) %>%
  summarise(total = sum(profit),cantidad_vendida = n()) %>%
  arrange(total) %>%
  head(1)

data %>%
  select(state, profit) %>%
  group_by(state) %>%
  summarise(total = sum(profit)) %>%
  arrange(desc(total))

data %>%
  select(segment, profit, quantity) %>%
  filter(segment == 'Consumer') %>%
  group_by(segment) %>%
  summarise(total = sum(profit),cantidad = n()) %>%
  mutate(ratio = (cantidad*100)/9994)


data %>%
  select(segment, profit, quantity) %>%
  filter(segment == 'Corporate') %>%
  group_by(segment) %>%
  summarise(total = sum(profit),cantidad = n()) %>%
  mutate(ratio = (cantidad*100)/9994)


data %>%
  select(segment, profit, quantity) %>%
  filter(segment == 'Home Office') %>%
  group_by(segment) %>%
  summarise(total = sum(profit),cantidad = n()) %>%
  mutate(ratio = (cantidad*100)/9994)

data %>%
  select(ship_mode, row_id) %>%
  group_by(ship_mode) %>%
  summarise(cantidad = n()) %>%
  arrange(desc(cantidad)) %>%
  mutate(ratio = (cantidad*100)/9994)

data %>%
  select(ship_mode, row_id) %>%
  filter(ship_mode == "Standard Class") %>%
  group_by(ship_mode) %>%
  summarise(cantidad = n()) %>%
  arrange(desc(cantidad)) %>%
  mutate(ratio = (cantidad*100)/9994)

data %>%
  select(ship_mode, row_id) %>%
  filter(ship_mode == "Second Class") %>%
  group_by(ship_mode) %>%
  summarise(cantidad = n()) %>%
  arrange(desc(cantidad)) %>%
  mutate(ratio = (cantidad*100)/9994)

data %>%
  select(ship_mode, row_id) %>%
  filter(ship_mode == "First Class") %>%
  group_by(ship_mode) %>%
  summarise(cantidad = n()) %>%
  arrange(desc(cantidad)) %>%
  mutate(ratio = (cantidad*100)/9994)

data %>%
  select(ship_mode, row_id) %>%
  filter(ship_mode == "Same Day") %>%
  group_by(ship_mode) %>%
  summarise(cantidad = n()) %>%
  arrange(desc(cantidad)) %>%
  mutate(ratio = (cantidad*100)/9994)

data %>%
  select(region, row_id) %>%
  group_by(region) %>%
  summarise(cantidad = n()) %>%
  arrange(desc(cantidad)) %>%
  mutate(ratio = (cantidad*100)/9994)

data %>%
  select(segment,ship_mode,row_id)%>%
  group_by(segment,ship_mode) %>%
  summarise(cantidad_envios = n())
