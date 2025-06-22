
# ==================================== UI ======================================

timeTrendUI <- function(id) {
  plotOutput(NS(id, "plot1"), height = 220)
}


# ================================== Server ====================================

timeTrendServer <- function(id, qi) {
  
  stopifnot(is.reactive(qi))
  
  moduleServer(id, function(input, output, session) {
    
    percent_qi <- reactive(d.overall |> 
                             filter(QI == qi()))
    
    output$plot1 <- renderPlot({

      timetrend_plot(data = percent_qi())
      
    })
  })
}
