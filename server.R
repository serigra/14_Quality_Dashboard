


server <- function(input, output) {
  
  
  
  timeTrendServer("plot1", reactive(input$qi))
  
  ageSexServer("plot2", reactive(input$qi), reactive(input$year))
  
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot3 <- renderPlot({
    data <- histdata[seq_len(10)]
    hist(data, col = "yellow")
  })
  
  output$plot4 <- renderPlot({
    data <- histdata[seq_len(10)]
    hist(data, col = "darkorange")
  })
  
  
  output$plot5 <- renderPlot({
    data <- histdata[seq_len(10)]
    hist(data, col = "#7B9790")
  })
  
}