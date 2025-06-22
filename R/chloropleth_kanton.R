# ==================================== UI ======================================

chloroplethUI <- function(id) {
  
  ns <- NS(id)
  
  fluidRow(

    column(width = 5,
           leafletOutput(NS(id, "plotmap"), height = 250)
          ),

    column(width = 7,
           plotlyOutput(NS(id, "plotbar"), height = 250)
          )
        )

}


# ================================== Server ====================================

chloroplethServer <- function(id, qi, year) {
  
  stopifnot(is.reactive(qi))
  stopifnot(is.reactive(year))
  
  moduleServer(id, function(input, output, session) {
    
    data <- reactive(d.kanton |>
                       filter(QI == qi()) |>
                       filter(year == year())
    )
    
    output$plotbar <- renderPlotly(
      
      kanton_plot(data = data())
      
    )
    
    output$plotmap <- renderLeaflet({
      
      chloropleth_plot(data = data())
      
    })
  })
}