

# ==================================== UI ======================================

netzUI <- function(id) {
  girafeOutput(NS(id, "plot4"), height = 250)
}


# ================================== Server ====================================

netzServer <- function(id, qi, year) {
  
  stopifnot(is.reactive(qi))
  stopifnot(is.reactive(year))
  
  moduleServer(id, function(input, output, session) {
    
    data <- reactive(d.netz |> 
                       filter(QI == qi()) |> 
                       filter(year == year())
    )
    
    
    
    output$plot4 <- renderGirafe({
      
      bar_plot(data = data(), variable = "Netz", angle = 70, hjust = 0.8,
               col = '#d99c96',
               width = 10, height = 6)
      
    })
  })
}