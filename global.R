
library(shiny)
library(shinydashboard)
library(tidyverse)
library(magrittr)
library(plotly)
library(ggiraph)
library(monochromeR)

library(leaflet)
library(sf)

library(crosstalk)

# deploy app on shinyapps.io
#library(rsconnect)
#rsconnect::deployApp('/Users/sereina/Documents/03_Projects/14_Quality_Dashboard')

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


tooltip_css <- "background-color:#7B9790;color:white;padding:5px;border-radius:3px;"



