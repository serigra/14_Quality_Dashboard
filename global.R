
library(shiny)
library(shinydashboard)
library(tidyverse)
library(magrittr)
library(plotly)
library(ggiraph)
library(monochromeR)
library(patchwork)

library(leaflet)
library(sf)



# deploy app on shinyapps.io
# library(rsconnect)
# rsconnect::deployApp('/Users/sereina/Documents/03_Projects/14_Quality_Dashboard')


library(gdtools)
library(gfonts)
register_gfont("Open Sans") # or "Arial"

# ==============================================================================
#                                  COLORs
# ==============================================================================

dark_color <- "#1d453b"
# see also: https://cararthompson.shinyapps.io/monochromeR/
col_palette <- generate_palette(colour = dark_color, 
                                modification = "go_lighter", 
                                n_colours = 6)
mid1_color <- col_palette[3]
mid2_color <- col_palette[4]
light_color <- col_palette[5]


# color for grid lines of all plots
grid_color <- "#e0e0e0"

# background color
background_color <- "#f8f8f6"


# ==============================================================================
#                                  Tooltip CSS
# ==============================================================================

# for bar plots: age_sex, model, netz --> see R/three_bar_plots.R

tooltip_css <- "background-color:#FFFFFF;color:black;padding:5px;border-radius:3px;border:none;box-shadow:2px 2px 8px rgba(0,0,0,0.15);"


# ==============================================================================
#                                  DATA 
# ==============================================================================

load('data/data.Rda') # read data see: R/read_data.R

d.age_sex %<>%
  mutate(age = factor(age, levels = unique(d.age_sex$age))) %>%
  mutate(
    tooltip = paste0(
      "Alter: <b>", age, "</b> \n",
      "Geschlecht: <b>", ifelse(sex == "Female", "Frauen", "Männer"), "</b> \n",
      "Prävalenz: ", percent, "%"
    )
  )


d.model %<>%
  mutate(
    tooltip = paste0(
      "Modell: <b>", model, "</b> \n",
      "Prävalenz: ", percent, "%"
    )
  )

d.netz %<>%
  mutate(
    tooltip = paste0(
      "Netz: <b>", Netz, "</b> \n",
      "Prävalenz: ", percent, "%"
    )
  )





