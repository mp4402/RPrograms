library(readxl)
library(readr)
library(tidyverse)
library(tidytext)
library(dplyr)
excel <- readxl::read_excel('example_1.xlsx')
#Ver las primeras 5 líneas
head(excel)
#Descripción de los datos por columna
str(excel)

#ojas del excel
excel_sheets('example_1.xlsx')

excel_2 <- read_excel('example_1.xlsx',sheet=2)
head(excel_2)

#Generar documentos de excel, csv en este caso
write_excel_csv2(excel,"exportar_excel.xls",delim=",")

#Csv separado por comas
csv <- read.csv("example_2.csv")
head(csv)

#Csv separado por punto y coma
txt_1 <- read_delim("example_3.txt", delim = ";")
#Separado por '|'
txt_2 <- read_delim("example_4.txt",delim = "|")

#Cargar archivos de texto no tabulador
dorian <- read_lines("dorian_gray.txt",skip_empty_rows = TRUE)
dorian[]

#dedocumentos de texto a data tabular
dorian_frame <- tibble(dorian)

dorian_words <- unnest_tokens(dorian_frame,output = word,input=dorian,token="words")
table(dorian_words)

dorian_words %>%
  select (word) %>%
  group_by(word) %>%
  count(word) %>%
  arrange(dest(n))
