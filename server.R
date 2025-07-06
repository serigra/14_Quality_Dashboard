


server <- function(input, output) {
  
  output$qi_summary <- 
    renderText({
      d.qi |> 
        filter(QI == input$qi) |> 
        pull(name)
    })
  
  output$qi_description <- 
    renderText({
      desc <- d.qi |> 
        filter(QI == input$qi) |> 
        pull(description)
      HTML(desc)
  })
  
  output$qi_publikationen <- 
    renderText({
      pub <- d.qi |> 
        filter(QI == input$qi) |> 
        pull(publikationen)
      
      HTML(paste0("Publikationen: ", pub))
    })
  
  timeTrendServer("plot1", reactive(input$qi))
  
  
  barplotsServer("plot_2_3_4", reactive(input$qi), reactive(input$year))
  
  
  chloroplethServer("chloropleth", reactive(input$qi), reactive(input$year))
  
}