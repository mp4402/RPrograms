

library(shiny)

shinyServer(function(input, output) {

  output$out_numeric_input <- renderPrint({
    print(input$ninput)
  })    
  
  output$out_slider_input<- renderPrint({
    print(input$slinput)
  })
  
  output$out_slider_input_multi<- renderPrint({
    print(input$slinputmulti)
  })
  
  output$out_slider_input_ani<- renderPrint({
    print(input$slinputanimate)
  })
  
  output$out_date_input<- renderPrint({
    print(input$date_input)
  })
  
  output$out_date_range_input<- renderPrint({
    print(input$date_range_input)
  })
  
  output$out_select_input<- renderPrint({
    print(input$select_input)
  })
  
  output$out_select_input_multi<- renderPrint({
    print(input$select_input_2)
  })
    
  output$out_checkbox<- renderPrint({
    print(input$chkbox_input)
  })
  
  output$out_checkbox_multi<- renderPrint({
    print(input$chkbox_group_input)
  })

  output$out_radio<- renderPrint({
    print(input$radio_buttons)
    print(str(input$radio_buttons))
  })
  
  output$out_action<- renderPrint({
    print(input$action)
  })
  
})
