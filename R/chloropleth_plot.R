


chloropleth_plot <- function(data) {
  
  min_percent <- floor(min(data$percent, na.rm = TRUE)/10) * 10
  max_percent <- ceiling(max(data$percent, na.rm = TRUE)/10) * 10
  
  # get map data
  data(gadmCHE, package = "leaflet")      # load Swiss canton data
  swiss_cantons <- sf::st_as_sf(gadmCHE)  # convert to sf object
  
  # add data
  canton_lookup <- data.frame(
    NAME_1 = swiss_cantons$NAME_1,
    kanton = c("AG", "AR", "AI", "BL", "BS", "BE", "FR", "GE",
               "GL", "GR", "JU", "LU", "NE", "NW", "OW", "SG",
               "SH", "SZ", "SO", "TG", "TI", "UR", "VS", "VD", "ZH", "ZG")
  )
  
  swiss_cantons <- swiss_cantons %>%
    left_join(canton_lookup, by = "NAME_1") |> 
    left_join(data |> select(kanton, percent), by = "kanton")
  
  # create a color palette
  bin_width <-  round(length(c(min_percent:max_percent))/10, 0)
  bins <- seq(min_percent, max_percent, bin_width)
  my_palette <- rev(generate_palette(colour = '#1d453b', modification = "go_lighter", 
                                 n_colours = length(bins)))
  pal <- colorBin(my_palette, domain = swiss_cantons$percent, bins = bins)
  
  # create labels
  labels <- sprintf(
    "Prävalenz <strong>%s:</strong><br/>%g%%",
    swiss_cantons$NAME_1, swiss_cantons$percent
  ) %>% lapply(htmltools::HTML)
  

  # build the map
  plot <- leaflet(swiss_cantons, 
          options = leafletOptions(zoomSnap = 0.1)) %>%
    addPolygons(fillColor = ~pal(percent),
                weight = 2,
                opacity = 1,
                color = "white",
                dashArray = "3",
                fillOpacity = 0.7,
                
                highlightOptions = highlightOptions(
                  weight = 5,
                  color = "#666",
                  dashArray = "",
                  fillOpacity = 0.7,
                  bringToFront = TRUE),
                
                label = labels,
                labelOptions = labelOptions(
                  style = list("font-weight" = "normal", padding = "3px 8px"),
                  textsize = "15px",
                  direction = "auto")
                
                ) %>% 
    addLegend(pal = pal, values = ~percent, opacity = 0.7, title = NULL,
              position = "bottomright") %>% 
    setView(lng = 8.2, lat = 46.8, zoom = 7.0) 
  
    return(plot)

}
