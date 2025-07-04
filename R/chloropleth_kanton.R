# ================================ UI ================================
chloroplethUI <- function(id) {
  ns <- NS(id)
  fluidRow(
    column(width = 5, leafletOutput(ns("plotmap"), height = 250)),
    column(width = 7, plotlyOutput(ns("plotbar"), height = 250))
  )
}

# ============================== Server ==============================
chloroplethServer <- function(id, qi, year) {
  
  stopifnot(is.reactive(qi))
  stopifnot(is.reactive(year))
  
  moduleServer(id, function(input, output, session) {
    
    ns <- session$ns
    
    data <- reactive({
      d.kanton |>
        filter(QI == qi()) |>
        filter(year == year())
    })
    
    # reactive value to store the currently hovered canton
    rv <- reactiveValues(hovered_kanton = NULL)
    
    # leaflet map with layerId for each canton
    output$plotmap <- renderLeaflet({
      
      prep <- chloropleth_prep(data())
      
      leaflet(prep$sf,
              options = leafletOptions(zoomSnap = 0.1)) %>%
        addPolygons(
          
          fillColor = ~prep$pal(percent),
          weight = 2,
          opacity = 1,
          color = "white",
          dashArray = "3",
          fillOpacity = 0.7,
          layerId = ~kanton,  # enables hover/click interactivity
          
          highlightOptions = highlightOptions(
            weight = 4,
            color = dark_color,
            dashArray = "",
            fillOpacity = 0.7,
            bringToFront = TRUE),
          
          label = prep$labels,
          labelOptions = labelOptions(
            style = list("font-weight" = "normal", padding = "3px 8px"),
            textsize = "15px",
            direction = "auto")
        ) %>%
        addLegend(pal = prep$pal, values = prep$sf$percent, opacity = 0.7, title = NULL,
                  position = "bottomright") %>%
        setView(lng = 8.2, lat = 46.8, zoom = 7.0)
    })
    
    # bar plot, highlight bar if hovered on map
    output$plotbar <- renderPlotly({
      
      plot_data <- data()
      
      plot_data <- plot_data[order(plot_data$percent), ]
      mean_value <- mean(plot_data$percent)
      max_percent <- ceiling(max(plot_data$percent, na.rm = TRUE)/10) * 10
      plot_data$kanton <- factor(plot_data$kanton, levels = plot_data$kanton)
      
      # generate data for CI
      kantone <- unique(plot_data$kanton)
      set.seed(123)  # For reproducibility
      kanton_n <- data.frame(
        kanton = kantone,
        n = sample(500:5000, length(kantone), replace = TRUE)
      )
      plot_data <- merge(plot_data, kanton_n, by = "kanton")
      
      # Calculate Wald confidence intervals
      z_value <- qnorm(0.975)  # 95% CI (1.96)
      plot_data$se <- with(plot_data, sqrt((percent/100) * (1 - percent/100) / n) * 100)
      plot_data$lower <- plot_data$percent - z_value * plot_data$se
      plot_data$upper <- plot_data$percent + z_value * plot_data$se
      
      
      highlight_kanton <- rv$hovered_kanton
      
      # Default color for all bars
      plot_data$color <- light_color
      
      # If a canton is hovered, highlight only that bar
      if (!is.null(highlight_kanton) && highlight_kanton %in% plot_data$kanton) {
        plot_data$color[plot_data$kanton == highlight_kanton] <- dark_color
      }
      
      plot_ly(
        plot_data,
        x = ~kanton,
        y = ~percent,
        type = 'bar',
        marker = list(color = plot_data$color,
                      line = list(color = dark_color, width = 2)),
        
        error_y = list(
          type = "data",
          symmetric = FALSE,
          color = dark_color,
          array = plot_data$upper - plot_data$percent,      # distance from bar to upper CI
          arrayminus = plot_data$percent - plot_data$lower  # distance from bar to lower CI
        ),
        hovertemplate = "%{x}: %{y:.1f}%<extra></extra>"
      ) |> 
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
              x1 = length(plot_data$kanton) - 0.5,
              y0 = mean_value,
              y1 = mean_value,
              line = list(color = "rgba(40,80,70,0.8)", width = 4, dash = "dash")
            )),
            annotations = list(
              list(
                x = -0.5,  # leftmost position
                y = mean_value + 0.5,
                text = paste0("CH: ", sprintf("%.1f%%", mean_value)),
                xref = "x",
                yref = "y",
                showarrow = FALSE,
                xanchor = "left",
                yanchor = "bottom",
                font = list(size = 14, color = "rgba(40,80,70,0.8)")
              )
          )
          ,
          plot_bgcolor = background_color,
          paper_bgcolor = background_color,  
          bargap = 0.3
        )
    })
    
    # observe hover on Leaflet map
    observeEvent(input$plotmap_shape_mouseover, {
      rv$hovered_kanton <- input$plotmap_shape_mouseover$id
    })
    observeEvent(input$plotmap_shape_mouseout, {
      rv$hovered_kanton <- NULL
    })
    
    
    # observe hover on Plotly bar plot
    observe({
      hover <- event_data("plotly_hover")
      if (!is.null(hover)) {
        rv$hovered_kanton <- hover$x  # or hover$key, depending on your plot_ly setup
      } else {
        rv$hovered_kanton <- NULL
      }
    })
    
    # highlight canton on hover in Leaflet map
    observe({
      kanton <- rv$hovered_kanton
      leafletProxy("plotmap") %>% clearGroup("highlight")
      if (!is.null(kanton)) {
        # Find the geometry for the hovered canton
        prep <- chloropleth_prep(data())
        sf_row <- prep$sf[prep$sf$kanton == kanton, ]
        if (nrow(sf_row) > 0) {
          leafletProxy("plotmap") %>%
            addPolygons(
              data = sf_row,
              fill = FALSE,              # No fill at all
              fillColor = "transparent", # For safety
              fillOpacity = 0,           # No fill
              color = dark_color,        # Border color
              weight = 4,                # border thickness
              opacity = 1,               # border opacity
              group = "highlight",
              layerId = paste0("highlight_", kanton)
            )
        }
      }
    })
    
    
  })
}