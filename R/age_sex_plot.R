
age_sex_plot <- function(data){
  
  qi_name <- unique(data$QI)
  year_name <- unique(data$year)
  upper_y_limit <- max(data$percent, na.rm = TRUE) + 10
  
  # generate data for CI
  data$age_sex <- paste(data$age, data$sex, sep = "_")
  age_sex_classes <- unique(data$age_sex)
  set.seed(123)  # For reproducibility
  age_sex_n <- data.frame(
    age_sex = age_sex_classes,
    n = sample(2000:5000, length(age_sex_classes), replace = TRUE)
  )
  data <- merge(data, age_sex_n, by = "age_sex")
  
  # Calculate Wald confidence intervals
  z_value <- qnorm(0.975)  # 95% CI (1.96)
  data$se <- with(data, sqrt((percent/100) * (1 - percent/100) / n) * 100)
  data$lower <- data$percent - z_value * data$se
  data$upper <- data$percent + z_value * data$se
  
  
  # plot <- ggplot(data, aes(x = age, y = percent, fill = sex)) +
  #   geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.6) +
  #   scale_y_continuous(labels = function(x) paste0(x, "%"),
  #                      limits = c(0, upper_y_limit)) +
  #   scale_fill_manual(values = c("Female" = "#c3b0d6", "Male" = "#b5cbe1")) +
  #   labs(
  #     title = "Alter & Geschlecht",
  #     y = paste0(qi_name, "  Prävalenz"),
  #     x = ""
  #   ) +
  #   theme_minimal(base_size = 16) +
  #   theme(
  #     plot.title = element_text(size = 17, face = "bold", hjust = 0.2),
  #     axis.text.x = element_text(angle = 30, hjust = 0.5, size = 14),
  #     axis.text.y = element_text(size = 14),
  #     axis.title.y = element_text(size = 13),
  #     axis.title.x = element_blank(),
  #     legend.title = element_blank(),
  #     legend.position = c(0.15, 0.85),
  #     panel.grid.major.y = element_line(color = "grey90"),
  #     panel.grid.major.x = element_blank(),
  #     panel.grid.minor = element_blank(),
  #     plot.margin = margin(0, 10, 0, 10),
  #     panel.background = element_rect(fill = "#f8f8f6", color = NA),
  #     plot.background = element_rect(fill = "#f8f8f6", color = NA)
  #   )
  
  
  p <- ggplot(data, aes(x = age, y = percent, fill = sex)) +
    geom_bar_interactive(
      aes(tooltip = tooltip, data_id = paste(age, sex)),
      stat = "identity",
      position = position_dodge(width = 0.8),
      width = 0.6
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
    scale_fill_manual(values = c("Female" = "#b1a2b6", "Male" = "#8fa4b5")) +
    labs(
      title = "Alter & Geschlecht",
      y = paste0(qi_name, "  Prävalenz"),
      x = ""
    ) +
    theme_minimal(base_size = 24) +
    theme(
      plot.title = element_text(size = rel(1.2), hjust = -0.1, vjust = -6),
      axis.text.x = element_text(angle = 30, hjust = 0.5),
      axis.text.y = element_text(),
      axis.title.y = element_text(),
      axis.title.x = element_blank(),
      legend.title = element_blank(),
      legend.position = c(0.15, 0.55),
      panel.grid.major.y = element_line(color = grid_color),
      panel.grid.major.x = element_blank(),
      panel.grid.minor = element_blank(),
      plot.margin = margin(0, 2, 0, 0),
      panel.background = element_rect(fill = background_color, color = NA),
      plot.background = element_rect(fill = background_color, color = NA)
    )
   
  return(girafe(ggobj = p,
                width_svg = 10, 
                height_svg = 6,
                options = list(
                  opts_hover(css = ""), # no hover effect on bars
                  opts_tooltip(use_fill = TRUE, 
                               css = "color:#fff; padding:6px; border-radius:6px; border:none; box-shadow:none; font-size:14px;"),
                  opts_toolbar(position =  "bottom"), 
                  opts_toolbar(hidden = c("selection", "zoom", "misc"))
                  
                )))

}
  
  
  