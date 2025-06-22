
# ==================================== UI ======================================

modelUI <- function(id) {
  girafeOutput(NS(id, "plot3"), height = 250)
}


# ================================== Server ====================================

modelServer <- function(id, qi, year) {
  
  stopifnot(is.reactive(qi))
  stopifnot(is.reactive(year))
  
  moduleServer(id, function(input, output, session) {
    
    data <- reactive(d.model |> 
                       filter(QI == qi()) |> 
                       filter(year == year())
    )
    
    output$plot3 <- renderGirafe({
      
      bar_plot(data = data(), variable = "model", col = '#FED9A6',
               width = 8, height = 6, mean = FALSE)
      
    })
  })
}