


chloropleth_prep <- function(data) {
  
  min_percent <- floor(min(data$percent, na.rm = TRUE)/10) * 10
  max_percent <- ceiling(max(data$percent, na.rm = TRUE)/10) * 10
  
  # get map data
  data(gadmCHE, package = "leaflet")      # load Swiss canton data
  swiss_cantons <- sf::st_as_sf(gadmCHE)  # convert to sf object
  
  # replace special characters in canton names
  swiss_cantons$NAME_1 <- replace(swiss_cantons$NAME_1, 
                                  swiss_cantons$NAME_1 %in% c("Gen`eve", "Graub\"unden", "Neuch^atel", "Z\"urich"), 
                                  c("Genève", "Graubünden", "Neuchâtel", "Zürich"))
  
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
  my_palette <- rev(generate_palette(colour = dark_color, modification = "go_lighter", 
                                 n_colours = length(bins)))
  pal <- colorBin(my_palette, domain = swiss_cantons$percent, bins = bins)
  
  # create labels
  labels <- sprintf(
    "Kanton: <strong>%s</strong><br/>Prävalenz: %g%%",
    swiss_cantons$NAME_1, swiss_cantons$percent
  ) %>% lapply(htmltools::HTML)
  
  list(
    sf = swiss_cantons,  # the sf object
    pal = pal,           # color palette function
    labels = labels      # HTML labels
  )

}
