
# ==================================== UI ======================================

timeTrendUI <- function(id) {
  plotOutput(NS(id, "plot1"), height = 210)
}


# ================================== Server ====================================

timeTrendServer <- function(id, qi) {
  
  stopifnot(is.reactive(qi))
  
  moduleServer(id, function(input, output, session) {
    
    percent_qi <- reactive(d.overall$percent[d.overall$QI == qi()])
    
    output$plot1 <- renderPlot({

      hist(percent_qi())
      
    })
  })
}
