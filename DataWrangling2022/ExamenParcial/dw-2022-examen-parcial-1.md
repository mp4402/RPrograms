dw-2022-parcial-1
================
Mario Pisquiy
9/19/2022

# Examen parcial

Indicaciones generales:

-   Usted tiene el período de la clase para resolver el examen parcial.

-   La entrega del parcial, al igual que las tareas, es por medio de su
    cuenta de github, pegando el link en el portal de MiU.

-   Pueden hacer uso del material del curso e internet (stackoverflow,
    etc.). Sin embargo, si encontramos algún indicio de copia, se
    anulará el exámen para los estudiantes involucrados. Por lo tanto,
    aconsejamos no compartir las agregaciones que generen.

## Sección I: Preguntas teóricas.

-   Existen 10 preguntas directas en este Rmarkdown, de las cuales usted
    deberá responder 5. Las 5 a responder estarán determinadas por un
    muestreo aleatorio basado en su número de carné.

-   Ingrese su número de carné en `set.seed()` y corra el chunk de R
    para determinar cuáles preguntas debe responder.

``` r
set.seed("20200399") 
v<- 1:10
preguntas <-sort(sample(v, size = 5, replace = FALSE ))

paste0("Mis preguntas a resolver son: ",paste0(preguntas,collapse = ", "))
```

    ## [1] "Mis preguntas a resolver son: 3, 4, 8, 9, 10"

Preguntas a responder: 3, 4, 8, 9, 10

### Listado de preguntas teóricas

1.  Para las siguientes sentencias de `base R`, liste su contraparte de
    `dplyr`:

    -   `str()`
    -   `df[,c("a","b")]`
    -   `names(df)[4] <- "new_name"` donde la posición 4 corresponde a
        la variable `old_name`
    -   `df[df$variable == "valor",]`

2.  Al momento de filtrar en SQL, ¿cuál keyword cumple las mismas
    funciones que el keyword `OR` para filtrar uno o más elementos una
    misma columna?

3.  ¿Por qué en R utilizamos funciones de la familia apply
    (lapply,vapply) en lugar de utilizar ciclos?

4.  ¿Cuál es la diferencia entre utilizar `==` y `=` en R?

5.  ¿Cuál es la forma correcta de cargar un archivo de texto donde el
    delimitador es `:`?

6.  ¿Qué es un vector y en qué se diferencia en una lista en R?

7.  ¿Qué pasa si quiero agregar una nueva categoría a un factor que no
    se encuentra en los niveles existentes?

8.  Si en un dataframe, a una variable de tipo `factor` le agrego un
    nuevo elemento que *no se encuentra en los niveles existentes*,
    ¿cuál sería el resultado esperado y por qué?

    -   El nuevo elemento
    -   `NA`

9.  En SQL, ¿para qué utilizamos el keyword `HAVING`?

10. Si quiero obtener como resultado las filas de la tabla A que no se
    encuentran en la tabla B, ¿cómo debería de completar la siguiente
    sentencia de SQL?

    -   SELECT \* FROM A \_\_\_\_\_\_\_ B ON A.KEY = B.KEY WHERE
        \_\_\_\_\_\_\_\_\_\_ = \_\_\_\_\_\_\_\_\_\_

Extra: ¿Cuántos posibles exámenes de 5 preguntas se pueden realizar
utilizando como banco las diez acá presentadas? (responder con código de
R.)

## Sección II Preguntas prácticas.

-   Conteste las siguientes preguntas utilizando sus conocimientos de R.
    Adjunte el código que utilizó para llegar a sus conclusiones en un
    chunk del markdown.

A. De los clientes que están en más de un país,¿cuál cree que es el más
rentable y por qué?

B. Estrategia de negocio ha decidido que ya no operará en aquellos
territorios cuyas pérdidas sean “considerables”. Bajo su criterio,
¿cuáles son estos territorios y por qué ya no debemos operar ahí?

### I. Preguntas teóricas

3.  Porque el orden de las iteraciones no importa, así como exige tener
    un mejor código

4.  El ‘==’ es utilizado para comparación, por ejemplo en un if.
    Mientras que ‘=’ es utilizado para asignar valores a una variable,
    objeto, etc.

5.  NA, porque dicho valor únicamente está puesto en una columna de tipo
    factor, pero dicho valor no está reconocido como uno de tipo factor
    para R, por lo que no puede devolver nada

6.  Se utiliza having para filtrar data agrupada, porque where solo
    puede filtrar filas normales no agrupadas

7.  SELECT \* FROM A LEFT JOIN B ON A.KEY = B.KEY WHERE B.KEY IS NULL

Extra

    ## [1] "El total posible de examenes es: 252"

## A

    ## # A tibble: 7 x 3
    ##   cliente  cantidadMarcas ventas
    ##   <chr>             <int>  <dbl>
    ## 1 a17a7558             10 19818.
    ## 2 ff122c3f             10 15359.
    ## 3 c53868a0              9 13813.
    ## 4 044118d4              9  9436.
    ## 5 f676043b              8  3635.
    ## 6 f2aab44e              3   400.
    ## 7 bf1e94e9             12     0

    ## [1] "El cliente más rentable es a17a7558, porque es quien más gasta en nosotros ($19,817.70) y es de los que más marcas maneja (10)"

## B

    ## # A tibble: 104 x 3
    ##    territorio cantidadMarcas ventas
    ##    <chr>               <int>  <dbl>
    ##  1 e6fd9da9                1   18.2
    ##  2 13b223c9                1   49.9
    ##  3 368301e2                2  121. 
    ##  4 79428560                1  132  
    ##  5 e034e3c8                4  247. 
    ##  6 0bfe69a0                5  384. 
    ##  7 456278b8                4  493. 
    ##  8 4163fa3f                4  580. 
    ##  9 3e0d75d0                3  647. 
    ## 10 aed8e579                5  747. 
    ## # ... with 94 more rows

    ## [1] "Los territorios menos rentables son: e6fd9da9, 13b223c9, 368301e2, 79428560, e034e3c8; Tienen las ventas más bajas, en un rango entre $18.16 y $247.16, y que además manejan la menor cantidad de marcas, 3 territorios con 1, una con 2 y la otra con 4"
