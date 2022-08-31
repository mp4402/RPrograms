library(shiny)

shinyUI(fluidPage(

    titlePanel("UI Dinamico, UpdateInput"),

   tabsetPanel(
     tabPanel("Ejemplo 1",
              numericInput("lim_inf",label="Ingrese limite inferior", value = 1),
              numericInput("lim_sup",label="Ingrese limite superior", value = 1),
              sliderInput("sl1",label="Seleccione intervalo",
                          value=5,
                          min=0,max=15)),
   
     tabPanel("Ejemplo 2",
              sliderInput("sl2","Seleccione",value=0,min=-10,max=10),
              sliderInput("sl3","Seleccione",value=0,min=-10,max=10),
              sliderInput("sl4","Seleccione",value=0,min=-10,max=10),
              sliderInput("sl5","Seleccione",value=0,min=-10,max=10),
              sliderInput("sl6","Seleccione",value=0,min=-10,max=10),
              actionButton("limpiar","limpiar")),
     
     tabPanel("Ejemplo 3",
              numericInput("runs","Ingrese", value = 0),
              actionButton("correr","correr")),
     
     tabPanel("Ejemplo 4",
              numericInput("nvalue","Valor", value = 0)),
     
     tabPanel("Ejemplo 5",
              numericInput('Celsius','Ingrese grados celsius',value=NULL, step = 1),
              numericInput('Farenheit','Ingrese grados farenheit',value=NULL, step = 1)),
     
     tabPanel("Ejemplo 6",
              selectInput("dist","Distribucion",
                          choices=c("normal","uniforme","exponencial")),
              numericInput("nrandom","Numero de muestras",value = 100),
              tabsetPanel(id = "parametros",
                          type = "hidden",
                          tabPanel("normal",
                                   numericInput("n_media","media",value=0),
                                   numericInput("n_sd","desviacion",value=1)),
                          tabPanel("uniforme",
                                   numericInput("a","minimo",value=0),
                                   numericInput("b","max",value=1)),
                          tabPanel("exponencial",
                                   numericInput("lambda","razon",value=1,min=0))
              ),
              plotOutput('plot_dist')
     )
    )
))
