Laboratorio1
================
MarioPisquiy
2022-08-03

## Ejercicio 1

### Lectura de archivos

``` r
doc1 <- read_excel("01-2018.xlsx")
doc2 <- read_excel("02-2018.xlsx")
doc3 <- read_excel("03-2018.xlsx")
doc4 <- read_excel("04-2018.xlsx")
doc5 <- read_excel("05-2018.xlsx")
doc6 <- read_excel("06-2018.xlsx")
doc7 <- read_excel("07-2018.xlsx")
doc8 <- read_excel("08-2018.xlsx")
```

    ## New names:
    ## * `` -> `...10`

``` r
doc9 <- read_excel("09-2018.xlsx")
doc10 <- read_excel("10-2018.xlsx")
doc11 <- read_excel("11-2018.xlsx")
```

### Limpieza de archivos e ingreso de fechas

### Se crea la tabla con la data junta

``` r
tablaFinal <- rbind(doc1,doc2,doc3,doc4,doc5,doc6,doc7,doc8,doc9,doc10,doc11)
```

El resultado es una tabla de 9 columnas y 2180 filas

``` r
head(tablaFinal)
```

    ## # A tibble: 6 x 9
    ##   COD_VIAJE CLIENTE         UBICACION CANTIDAD PILOTO     Q CREDITO UNIDAD FECHA
    ##       <dbl> <chr>               <dbl>    <dbl> <chr>  <dbl>   <dbl> <chr>  <chr>
    ## 1  10000001 EL PINCHE OBEL~     76002     1200 Ferna~ 300        30 Camio~ 01-2~
    ## 2  10000002 TAQUERIA EL CH~     76002     1433 Hecto~ 358.       90 Camio~ 01-2~
    ## 3  10000003 TIENDA LA BEND~     76002     1857 Pedro~ 464.       60 Camio~ 01-2~
    ## 4  10000004 TAQUERIA EL CH~     76002      339 Angel~  84.8      30 Panel  01-2~
    ## 5  10000005 CHICHARRONERIA~     76001     1644 Juan ~ 411        30 Camio~ 01-2~
    ## 6  10000006 UBIQUO LABS ||~     76001     1827 Luis ~ 457.       30 Camio~ 01-2~

## Ejercicio 2

### Se generan vectores dentro de una lista, su largo es variable entre 20 y 30

``` r
generate_dff <- function(x,size){ return(
  data.frame(b = sample(1:10, size = size, replace = TRUE)
  ))
}

lista <- lapply(1:3, generate_dff, size = sample(20:30, 1))
```

### Las listas generadas

``` r
lista[[1]][['b']]
```

    ##  [1] 10  7  6  9  1  2  9  9  8  2  9  2 10  6  3  4  4  2  2  7  7  7 10  4 10
    ## [26]  5  2

``` r
lista[[2]][['b']]
```

    ##  [1]  8  3  6  6  6  8  9  7  2  1  1  4  2  7  2  4 10  6 10  4  2  2  8  1  2
    ## [26]  1  4

``` r
lista[[3]][['b']]
```

    ##  [1]  3  2  9  2  3  8  8  4  9  7  9  3  4  3  5  4  1  6  8  6  3 10  4  9  9
    ## [26]  3  8

### Se encuentra la moda de cada lista

``` r
moda <- function(x) {
  return(as.numeric(names(which.max(table(x)))))
}

resultado <- lapply(lista,moda)

resultado[[1]]
```

    ## [1] 2

``` r
resultado[[2]]
```

    ## [1] 2

``` r
resultado[[3]]
```

    ## [1] 3

## Ejercicio 3

### Lectura del archivo usando “\|” como delimitador

``` r
parqueVehicular <- read_delim("INE_PARQUE_VEHICULAR_080219.txt",delim = "|")
```

    ## New names:
    ## * `` -> `...11`

    ## Warning: One or more parsing issues, see `problems()` for details

    ## Rows: 2435294 Columns: 11
    ## -- Column specification --------------------------------------------------------
    ## Delimiter: "|"
    ## chr (8): MES, NOMBRE_DEPARTAMENTO, NOMBRE_MUNICIPIO, MODELO_VEHICULO, LINEA_...
    ## dbl (2): ANIO_ALZA, CANTIDAD
    ## lgl (1): ...11
    ## 
    ## i Use `spec()` to retrieve the full column specification for this data.
    ## i Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
head(parqueVehicular)
```

    ## # A tibble: 6 x 11
    ##   ANIO_ALZA MES   NOMBRE_DEPARTAMENTO NOMBRE_MUNICIPIO MODELO_VEHICULO
    ##       <dbl> <chr> <chr>               <chr>            <chr>          
    ## 1      2007 05    HUEHUETENANGO       "HUEHUETENANGO"  2007           
    ## 2      2007 05    EL PROGRESO         "EL JICARO"      2007           
    ## 3      2007 05    SAN MARCOS          "OCOS"           2007           
    ## 4      2007 05    ESCUINTLA           "SAN JOS\xc9"    2006           
    ## 5      2007 05    JUTIAPA             "MOYUTA"         2007           
    ## 6      2007 05    GUATEMALA           "FRAIJANES"      1997           
    ## # ... with 6 more variables: LINEA_VEHICULO <chr>, TIPO_VEHICULO <chr>,
    ## #   USO_VEHICULO <chr>, MARCA_VEHICULO <chr>, CANTIDAD <dbl>, ...11 <lgl>
