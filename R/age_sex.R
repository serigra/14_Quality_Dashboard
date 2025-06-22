

# ==================================== UI ======================================

ageSexUI <- function(id) {
  girafeOutput(NS(id, "plot2"), height = 250)
}


# ================================== Server ====================================

ageSexServer <- function(id, qi, year) {
  
  stopifnot(is.reactive(qi))
  stopifnot(is.reactive(year))
  
  moduleServer(id, function(input, output, session) {
    
    data <- reactive(d.age_sex |> 
                        filter(QI == qi()) |> 
                        filter(year == year())
                     )
    
    output$plot2 <- renderGirafe({
      
      age_sex_plot(data = data())
      #hist(percent_qi(), col = "violet")
      
    })
  })
}