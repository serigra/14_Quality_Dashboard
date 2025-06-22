


server <- function(input, output) {
  
  timeTrendServer("plot1", reactive(input$qi))
  
  ageSexServer("plot2", reactive(input$qi), reactive(input$year))
  
  modelServer("plot3", reactive(input$qi), reactive(input$year))
  
  netzServer("plot4", reactive(input$qi), reactive(input$year))
  
  chloroplethServer("chloropleth", reactive(input$qi), reactive(input$year))
  
}