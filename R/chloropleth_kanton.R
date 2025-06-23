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
              weight = 5,
              color = "#666",
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
      
      highlight_kanton <- rv$hovered_kanton
      
      # Default color for all bars
      plot_data$color <- "rgba(100,140,130,0.5)"
      
      # If a canton is hovered, highlight only that bar
      if (!is.null(highlight_kanton) && highlight_kanton %in% plot_data$kanton) {
        plot_data$color[plot_data$kanton == highlight_kanton] <- "rgba(255,0,0,0.7)"
      }
      
      plot_ly(
        plot_data,
        x = ~kanton,
        y = ~percent,
        type = 'bar',
        marker = list(color = plot_data$color,
                      line = list(color = 'rgba(40,60,50,1)', width = 2))
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
            )
          ),
          plot_bgcolor = '#f8f8f6',
          paper_bgcolor = '#f8f8f6',  
          bargap = 0.3
        )
    })
    
    # Observe hover on Leaflet map
    observeEvent(input$plotmap_shape_mouseover, {
      rv$hovered_kanton <- input$plotmap_shape_mouseover$id
    })
    observeEvent(input$plotmap_shape_mouseout, {
      rv$hovered_kanton <- NULL
    })
    
    # Observe hover on Plotly bar plot
    observe({
      hover <- event_data("plotly_hover", source = ns("plotbar"))
      if (!is.null(hover)) {
        hovered_kanton <- data()$kanton[hover$pointNumber + 1]
        # Programmatically highlight canton on map
        leafletProxy("plotmap", session) %>%
          setShapeStyle(layerId = hovered_kanton, color = "#FF0000", weight = 5)
        rv$hovered_kanton <- hovered_kanton
      } else {
        rv$hovered_kanton <- NULL
      }
    })
  })
}
