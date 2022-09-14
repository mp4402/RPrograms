library(shiny)
library(ggplot2)
library(dplyr)

shinyServer(function(input, output) {
  
  posicionHover <<- reactiveVal()
  puntosHover <<- reactiveValues()
  puntoHover <<- reactiveVal()
  posicion <<- reactiveVal()
  puntos <<- reactiveValues()
  punto <<- reactiveVal()
  
  output$grafica_base_r <- renderPlot({
    plot(mtcars$wt,mtcars$mpg, xlab = "wt", ylab="millas por galon")
    
  })
  
  output$click_data <- renderPrint({
    clk_msg <- NULL
    dclk_msg<- NULL
    mhover_msg <- NULL
    mbrush_msg <- NULL
    if(!is.null(input$clk$x) ){
      clk_msg<-
        paste0("click cordenada x= ", round(input$clk$x,2), 
               " click coordenada y= ", round(input$clk$y,2))
      
      indice <- nearPoints(mtcars,input$clk,xvar='wt',yvar='mpg')
      if(nrow(indice) != 0){
        posicion <- toString(indice$wt-indice$mpg)
        puntos[[posicion]] <- indice
      }
    }
    if(!is.null(input$dclk$x) ){
      dclk_msg<-paste0("doble click cordenada x= ", round(input$dclk$x,2), 
                       " doble click coordenada y= ", round(input$dclk$y,2))
      indice <- nearPoints(mtcars,input$dclk,xvar='wt',yvar='mpg')
      if(nrow(indice) != 0){
        posicion <- toString(indice$wt-indice$mpg)
        puntos[[posicion]] <- NULL
        posicionHover <- toString(indice$wt-indice$mpg)
        puntosHover[[posicionHover]] <- NULL
      }
    }
    if(!is.null(input$mhover$x) ){
      mhover_msg<-paste0("hover cordenada x= ", round(input$mhover$x,2), 
                         " hover coordenada y= ", round(input$mhover$y,2))
      indice <- nearPoints(mtcars,input$mhover,xvar='wt',yvar='mpg')
      if(nrow(indice) != 0){
        posicionHover <- toString(indice$wt-indice$mpg)
        puntosHover[[posicionHover]] <- indice
      }
    }
    if(!is.null(input$mbrush$xmin)){
      brushx <- paste0(c('(',round(input$mbrush$xmin,2),',',round(input$mbrush$xmax,2),')'),collapse = '')
      brushy <- paste0(c('(',round(input$mbrush$ymin,2),',',round(input$mbrush$ymax,2),')'),collapse = '')
      mbrush_msg <- cat('\t rango en x: ', brushx,'\n','\t rango en y: ', brushy)
      
      indice <- brushedPoints(mtcars,input$mbrush,xvar='wt',yvar='mpg')
      if(nrow(indice) != 0){
        posicion <- toString(indice$wt-indice$mpg)
        puntos[[posicion]] <- indice
      }
    }
    
    
    
    
    cat(clk_msg,dclk_msg,mhover_msg,mbrush_msg,sep = '\n')
    
  })
  
  
  
  output$mtcars_tbl <- renderTable({
    df <- nearPoints(mtcars,input$clk,xvar='wt',yvar='mpg')
    df2 <- brushedPoints(mtcars,input$mbrush,xvar='wt',yvar='mpg')
    if(nrow(df)!=0){
      df
    } else {
      NULL
    }
    
    if (nrow(df2) != 0){
      df2
    } else {
      NULL
    }
    
  })
  
  
  output$plot_click_options <- renderPlot({
    lista <<- reactiveValuesToList(puntos)
    listaHover <<- reactiveValuesToList(puntosHover)
    plot(mtcars$wt,mtcars$mpg, xlab = "wt", ylab="millas por galon")
    points(punto()$wt,punto()$mpg,col='gray',pch=19)
    lapply(listaHover, graficarPuntosHover)
    lapply(lista, graficarPuntos)
  })
  
  graficarPuntos <- function(lista){
    points(lista$wt,lista$mpg,col='green',pch=19)
  }
  
  graficarPuntosHover <- function(lista){
    points(lista$wt,lista$mpg,col='gray',pch=19)
  }
  
})