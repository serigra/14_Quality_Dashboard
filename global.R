
library(shiny)
library(shinydashboard)
library(tidyverse)
library(magrittr)
library(plotly)
library(ggiraph)
library(monochromeR)

library(leaflet)
library(sf)



# deploy app on shinyapps.io
#library(rsconnect)
#rsconnect::deployApp('/Users/sereina/Documents/03_Projects/14_Quality_Dashboard')


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
#                                  DATA 
# ==============================================================================

load('data/data.Rda') # read data see: R/read_data.R

d.age_sex %<>%
  mutate(age = factor(age, levels = unique(d.age_sex$age))) %>%
  mutate(
    tooltip = paste0(
      "Alter: ", age, "\n",
      "Geschlecht: ", ifelse(sex == "Female", "Frauen", "Männer"), "\n",
      "Prävalenz: ", percent, "%"
    )
  )


d.model %<>%
  mutate(
    tooltip = paste0(
      "Modell: ", model, "\n",
      "Prävalenz: ", percent, "%"
    )
  )

d.netz %<>%
  mutate(
    tooltip = paste0(
      "Netz: ", Netz, "\n",
      "Prävalenz: ", percent, "%"
    )
  )


tooltip_css <- "background-color:#7B9790;color:white;padding:5px;border-radius:3px;border:none;box-shadow:none;"



