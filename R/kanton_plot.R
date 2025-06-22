
kanton_plot <- function(data) {
  
  data <- data[order(data$percent), ]
  mean_value <- mean(data$percent)
  max_percent <- ceiling(max(data$percent, na.rm = TRUE)/10) * 10
  data$kanton <- factor(data$kanton, levels = data$kanton)
  
  plot <- plot_ly(
    data,
    x = ~kanton,
    y = ~percent,
    type = 'bar',
    marker = list(color = 'rgba(100,140,130,0.5)', 
                  line = list(color = 'rgba(40,60,50,1)', width = 2))
  ) %>%
    layout(
      yaxis = list(
        title = "",
        range = c(0, max_percent),
        tickformat = ".%",
        tickvals = seq(0,max_percent, 10),
        ticktext = paste0(seq(0,max_percent, 10), "%")
      ),
      xaxis = list(title = ""),
      shapes = list(
        list(
          type = "line",
          x0 = -0.5,
          x1 = length(data$kanton) - 0.5,
          y0 = mean_value,
          y1 = mean_value,
          line = list(color = "rgba(40,80,70,0.8)", width = 4, dash = "dash")
        )
      ),
      plot_bgcolor = '#f8f8f6',
      paper_bgcolor = '#f8f8f6',  
      bargap = 0.3
    )
  
  return(plot)

}
