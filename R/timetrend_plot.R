
timetrend_plot <- function(data){
  
  qi_name <- unique(data$QI)
  upper_y_limit <- max(data$percent, na.rm = TRUE) + 10
  
  plot <- data |> 
    ggplot( aes(x = year, y = percent)) +
    geom_line(linewidth = 1, color = dark_color) +
    geom_point(size = 6, color = dark_color, fill = light_color, shape = 21, stroke = 1.5) +
    geom_text(aes(label = paste0(percent, "%")), 
              vjust = -1.5, 
              size = 5, 
              color = mid1_color) +
    scale_x_continuous(breaks = c(2014:2024), labels = c(2014:2024)) +
    scale_y_continuous(breaks = seq(0, upper_y_limit, 5), 
                       labels = function(x) paste0(x, "%"),
                       limits = c(0, upper_y_limit)) +
    labs(y = paste0(qi_name, "   Prävalenz"), x = "") +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 30, hjust = 1, size = 14),
      axis.text.y = element_text(size = 14),
      axis.title.y = element_text(size = 13),
      axis.title.x = element_blank(),
      panel.grid.major = element_line(color = grid_color),
      panel.grid.minor = element_blank(),
      plot.margin = margin(0, 10, 0, 10),
      panel.background = element_rect(fill = background_color, color = NA),
      plot.background = element_rect(fill = background_color, color = NA)
    )
  
  return(plot)

}
