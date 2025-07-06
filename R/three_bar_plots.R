# ==================================== UI ======================================

barplotsUI <- function(id) {
  girafeOutput(NS(id, "plot_2_3_4"), height = 250
               )
}


# ================================== Server ====================================

barplotsServer <- function(id, qi, year) {
  
  stopifnot(is.reactive(qi))
  stopifnot(is.reactive(year))
  
  moduleServer(id, function(input, output, session) {
    
    
    data.age_sex <- reactive(d.age_sex |> 
                       filter(QI == qi()) |> 
                       filter(year == year())
    )
    
    data.model <- reactive(d.model |> 
                       filter(QI == qi()) |> 
                       filter(year == year())
    )
    
    data.netz <- reactive(d.netz |> 
                       filter(QI == qi()) |> 
                       filter(year == year())
    )
    
    
    output$plot_2_3_4 <-  renderGirafe({
          
        p1 <- age_sex_plot(data = data.age_sex(), base_size = 20)
        
        p2 <- bar_plot(data = data.model(), variable = "model", 
                       col = '#FED9A6', angle = 30, hjust = 0.8,
                       width = 10, height = 6, 
                       mean = FALSE, 
                       base_size = 20)
        
        p3 <- bar_plot(data = data.netz(), variable = "Netz", 
                       col = '#d99c96', angle = 70, hjust = 0.8,
                       width = 10, height = 6, 
                       base_size = 20)
        
       combined_plot <- 
          p1 + p2 + p3 + 
          plot_layout(ncol = 3, widths = c(2, 1.5, 2.5)) & # & to apply the theme to all subplots!
          theme(panel.background = element_rect(fill = background_color, color = NA),
                plot.background = element_rect(fill = background_color, color = NA))
        
       girafe(ggobj = combined_plot,
              width_svg = 18, 
              height_svg = 4,
              options = list(
                 opts_tooltip(css = tooltip_css, opacity = 1),
                 opts_hover(css = paste0("fill:", dark_color, ";stroke:", dark_color, ";r:9pt;")), # hover effect
                 opts_toolbar(position =  "bottom"), 
                 opts_toolbar(hidden = c("selection", "zoom", "misc")))
              )
      
    })
    
  })
}