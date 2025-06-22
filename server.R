


server <- function(input, output) {
  
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(10)]
    hist(data)
  })
  
  output$plot2 <- renderPlot({
    data <- histdata[seq_len(10)]
    hist(data, col = "violet")
  })
  
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