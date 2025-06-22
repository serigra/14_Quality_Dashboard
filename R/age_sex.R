

# ==================================== UI ======================================

ageSexUI <- function(id) {
  plotOutput(NS(id, "plot2"), height = 250)
}


# ================================== Server ====================================

ageSexServer <- function(id, qi, year) {
  
  stopifnot(is.reactive(qi))
  stopifnot(is.reactive(year))
  
  moduleServer(id, function(input, output, session) {
    
    percent_qi <- reactive(d.age_sex |> 
                             filter(QI == qi()) |> 
                             filter(year == year()) |> 
                             pull(percent))
    
    output$plot2 <- renderPlot({
      
      hist(percent_qi(), col = "violet")
      
    })
  })
}