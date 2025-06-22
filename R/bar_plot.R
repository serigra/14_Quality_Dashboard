

bar_plot <- function(data, variable, angle = 30, hjust = 0.5, col, width, height, mean = TRUE){
  
  dark_col <- generate_palette(colour = col, modification = "go_darker", n_colours = 9)[5]
  
  tooltip_css <- paste0("background-color:", dark_col, ";color:white;padding:5px;border-radius:3px;")
  
  qi_name <- unique(data$QI)
  year_name <- unique(data$year)
  upper_y_limit <- max(data$percent, na.rm = TRUE) + 10
  
  p <- ggplot(data, aes(x = get(variable), y = percent)) +
    geom_bar_interactive(
      aes(tooltip = tooltip),
      stat = "identity",
      position = position_dodge(width = 0.8),
      width = 0.5, 
      color = dark_col, 
      fill = col
    ) +
    scale_y_continuous(
      labels = function(x) paste0(x, "%"),
      limits = c(0, upper_y_limit)
    ) +
    labs(
      title = paste0(qi_name, " nach ", variable, " (", year_name, ")"),
      y = paste0(qi_name, "  Prävalenz"),
      x = ""
    ) +
    theme_minimal(base_size = 26) +
    theme(
      plot.title = element_text(size = rel(1.2), face = "bold", hjust = 0.2),
      axis.text.x = element_text(angle = angle, hjust = hjust),
      axis.text.y = element_text(),
      axis.title.y = element_text(),
      axis.title.x = element_blank(),
      legend.title = element_blank(),
      legend.position = c(0.15, 0.85),
      panel.grid.major.y = element_line(color = "grey90"),
      panel.grid.major.x = element_blank(),
      panel.grid.minor = element_blank(),
      plot.margin = margin(0, 2, 0, 0),
      panel.background = element_rect(fill = "#f8f8f6", color = NA),
      plot.background = element_rect(fill = "#f8f8f6", color = NA)
    )
  
  if(mean == TRUE){
    p <- p + geom_hline(yintercept = mean(data$percent, na.rm = TRUE), 
                        linetype = "dashed", color = dark_col, 
                        linewidth = 2) +
              annotate("text", x = 3, y = mean(data$percent, na.rm = TRUE) + 3, 
                       label = paste0("Mittelwert: ", round(mean(data$percent, na.rm = TRUE), 2), "%"), 
                       size = 8,
                       color = dark_col)
  }
  
  return(girafe(ggobj = p,
                width_svg = width, 
                height_svg = height,
                options = list(
                  opts_tooltip(css = tooltip_css, opacity = 1),
                  opts_toolbar(position =  "bottom"), 
                  opts_toolbar(hidden = c("selection", "zoom", "misc"))
                  
                )))
  
}
