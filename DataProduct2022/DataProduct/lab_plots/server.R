library(shiny)
library(ggplot2)
library(dplyr)

shinyServer(function(input, output) {
  event_click_x <- list(1)
  event_click_y <- list(1)
  event_dclick_x <- list(1)
  event_dclick_y <- list(1)
  event_hover_x <- list(1)
  event_hover_y <- list(1)
  
  output$grafica_base_r <- renderPlot({
    plot(mtcars$wt,mtcars$mpg, xlab = "wt", ylab="millas por galon")
    
  })

  output$click_data <- renderPrint({
    clk_msg <- NULL
    dclk_msg<- NULL
    mhover_msg <- NULL
    mbrush_msg <- NULL
    if(!is.null(input$clk$x) ){
      if(length(event_click_x) == 1){
        event_click_x <- append(event_click_x,round(input$clk$x,2))
        event_click_y <- append(event_click_y,round(input$clk$y,2))
        event_click_x <- event_click_x[-1]
        event_click_y <- event_click_y[-1]
      }else{
        event_click_x <- append(event_click_x,round(input$clk$x,2))
        event_click_y <- append(event_click_y,round(input$clk$y,2))
      }
    }
    if(!is.null(input$dclk$x) ){
      if(length(event_click_x) == 1){
        event_dclick_x <- append(event_click_x,round(input$dclk$x,2))
        event_dclick_y <- append(event_click_y,round(input$dclk$y,2))
        event_dclick_x <- event_dclick_x[-1]
        event_dclick_y <- event_dclick_y[-1]
      }else{
        event_dclick_x <- append(event_click_x,round(input$dclk$x,2))
        event_dclick_y <- append(event_click_y,round(input$dclk$y,2))
      }
    }
    if(!is.null(input$mhover$x) ){
      if(length(event_click_x) == 1){
        event_hover_x <- append(event_hover_x,round(input$mhover$x,2))
        event_hover_y <- append(event_hover_y,round(input$mhover$y,2))
        event_hover_x <- event_hover_x[-1]
        event_hover_y <- event_hover_y[-1]
      }else{
        event_hover_x <- append(event_hover_x,round(input$mhover$x,2))
        event_hover_y <- append(event_hover_y,round(input$mhover$y,2))
      }
    }
    
    
    if(!is.null(input$mbrush$xmin)){
      brushx <- paste0(c('(',round(input$mbrush$xmin,2),',',round(input$mbrush$xmax,2),')'),collapse = '')
      brushy <- paste0(c('(',round(input$mbrush$ymin,2),',',round(input$mbrush$ymax,2),')'),collapse = '')
      mbrush_msg <- cat('\t rango en x: ', brushx,'\n','\t rango en y: ', brushy)
    }
    
    
    
    
    #cat(clk_msg,dclk_msg,mhover_msg,mbrush_msg,sep = '\n')
    plot(mtcars$wt,mtcars$mpg, xlab = "wt", ylab="millas por galon")
    if (event_hover_x[1] != 1){
      points(mtcars$wt[event_hover_x],mtcars$mpg[event_hover_y],col="gray",pch=19)
    }
    if (event_click_x[1] != 1){
      points(mtcars$wt[event_click_x],mtcars$mpg[event_click_y],col="green",pch=19)
    }
    
  })
  
  
  
  output$mtcars_tbl <- renderTable({
    ## df <- nearPoints(mtcars,input$clk,xvar='wt',yvar='mpg')
    df <- brushedPoints(mtcars,input$mbrush,xvar='wt',yvar='mpg')
    if(nrow(df)!=0){
      df
    } else {
      NULL
    }
    
  })
  
  
  
  
  output$plot_click_options <- renderPlot({
    
    plot(mtcars$wt,mtcars$mpg, xlab = "wt", ylab="millas por galon")
  })
  
  
})