

bar_plot <- function(data, variable, angle = 30, hjust = 0.5,
                     col, width, height, mean = TRUE,
                     ggiraph = FALSE, base_size = 20,
                     ...){
  
  dark_col <- generate_palette(colour = col, modification = "go_darker", n_colours = 9)[5]
  
  if (variable == "model") {
    variable_name <- "Versicherungsmodell"
    
    # generate data for CI
    model <- unique(data$model)
    set.seed(123)  # For reproducibility
    model_n <- data.frame(
      model = model,
      n = sample(500:5000, length(model), replace = TRUE)
    )
    data <- merge(data, model_n, by = "model")
    
  } else if (variable == "Netz") {
    variable_name <- "Ärztenetz"
    
    # generate data for CI
    net <- unique(data$Netz)
    set.seed(123)  # For reproducibility
    nets_n <- data.frame(
      Netz = net,
      n = sample(500:5000, length(net), replace = TRUE)
    )
    data <- merge(data, nets_n, by = "Netz")
  }
  
  #tooltip_css <- paste0("background-color:", dark_col, ";color:white;padding:5px;border-radius:3px;")
  
  # Calculate Wald confidence intervals
  z_value <- qnorm(0.975)  # 95% CI (1.96)
  data$se <- with(data, sqrt((percent/100) * (1 - percent/100) / n) * 100)
  data$lower <- data$percent - z_value * data$se
  data$upper <- data$percent + z_value * data$se
  
  qi_name <- unique(data$QI)
  year_name <- unique(data$year)
  upper_y_limit <- max(data$percent, na.rm = TRUE) + 10
  
  p <- ggplot(data, aes(x = get(variable), y = percent)) +
    geom_bar_interactive(
      aes(tooltip = tooltip, data_id = get(variable)),
      stat = "identity",
      position = position_dodge(width = 0.8),
      width = 0.5, 
      color = dark_col, 
      fill = col
    ) +
    geom_errorbar(
      aes(ymin = lower, ymax = upper),
      width = 0.2,
      color = "black",
      size = 0.7,
      position = position_dodge(0.8)
    ) +
    scale_y_continuous(
      labels = function(x) paste0(x, "%"),
      limits = c(0, upper_y_limit)
    ) +
    labs(
      title = variable_name,
      y = "", #paste0(qi_name, "  Prävalenz"),
      x = ""
    ) +
    theme_minimal(base_size = base_size,
                  base_family = "Open Sans") +
    theme(
      plot.title = element_text(size = rel(1), hjust = 0.5, vjust = -1),
      axis.text.x = element_text(angle = angle, hjust = hjust),
      axis.text.y = element_text(),
      axis.title.y = element_text(size = rel(0.8)),
      axis.title.x = element_blank(),
      legend.title = element_blank(),
      panel.grid.major.y = element_line(color = grid_color),
      panel.grid.major.x = element_blank(),
      panel.grid.minor = element_blank(),
      plot.margin = margin(0, 3, 0, 3),
      panel.background = element_rect(fill = background_color, color = NA),
      plot.background = element_rect(fill = background_color, color = NA)
    )
  
  if(mean == TRUE){
    p <- p + geom_hline(yintercept = mean(data$percent, na.rm = TRUE), 
                        linetype = "dashed", color = dark_col, 
                        linewidth = 1) +
              annotate("text", x = 4, y = mean(data$percent, na.rm = TRUE) + 3, 
                       label = paste0("Mittelwert: ", round(mean(data$percent, na.rm = TRUE), 2), "%"), 
                       size = 6,
                       color = dark_col)
  }
  
  if(ggiraph){
  return(girafe(ggobj = p,
                width_svg = width, 
                height_svg = height,
                options = list(
                  opts_toolbar(position =  "bottom"), 
                  opts_toolbar(hidden = c("selection", "zoom", "misc"))
                  
                )))
    
  } else {
    return(p)
  }
  
}
