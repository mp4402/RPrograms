library(readr)
library(tidyverse)
library(highcharter)

dataset <- read_csv2("miuDocumento_802169_2010-2019-top_878986.csv")
View(dataset)

str(dataset)
glimpse(dataset)

#Cambio de nombre de columna normal
names(dataset)[4] <- "top_genre"
names(dataset)

#Cambio de nombre de columna con dplyr
rename(dataset, top_genre= "top genre")

#Ambas funcionan igual
head(select(dataset, artist, year))

dataset %>%
  select(title, artist, year) %>%
  filter(year == 2012) %>%
  head()

dataset %>%
  rename(top_genre = "top genre")

rename_with(df, ~(gsub(" ","_",.x)))

dataset %>%
  rename_with(~tolower(gsub(" ","_",.x)))

dataset$year
dataset[c(1,2)]

dataset %>%
  select(1,2)

dataset %>%
  select(-1) %>%
  head()

dataset %>%
  select(artist,year) %>%
  filter(year == 2012 | year == 2014) %>%
  head()

dataset %>%
  select(artist,year) %>%
  group_by(year) %>%
  summarise(artistas = n())

dataset %>%
  summarise(artist = n_distinct(artist))

dataset %>%
  select(artist,year) %>%
  group_by(year) %>%
  summarise(artistas = n_distinct(artist))

dataset %>%
  summarise(title = n_distinct(title))

dataset %>%
  group_by(title)%>%
  summarise(conteo_canciones = n())%>%
  filter(conteo_canciones > 1) %>%
  arrange(desc(conteo_canciones))
