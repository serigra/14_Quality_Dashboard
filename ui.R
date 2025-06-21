library(shiny)
library(shinydashboard)
library(magrittr)
library(tidyverse)


ui <- dashboardPage(
  
  
  dashboardHeader(title = "Ambulante Qualitätsindikatoren", titleWidth = 450),
  
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("Themenfelder", tabName = "themenfelder",
               menuSubItem("Arzeimittel", tabName = "arzneimittel"),
               menuSubItem("Diabetes",    tabName = "diabetes"),
               menuSubItem("Prävention",  tabName = "prevention") 
      ),
      menuItem("Methodik", tabName = "methodik"),
      menuItem("Publikationen", tabName = "publikationen")
    ),
    
    div(
      class = "sidebar-disclaimer", # see www/custom.css
      h4("Disclaimer"),
      p("Alle hier abgebildeten Zahlen sind rein fiktiv und dienen ausschließlich zu Demonstrationszwecken."),
      p("Sereina M. Graber | 2025.")
    )
  ),
  
  
  dashboardBody(
    
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
      tags$script(src = "custom.js")
    ),
    
    tabItems(
      
      # =========================== ARZNEIMITTEL ===============================
      tabItem(tabName = "arzneimittel",
              
              
              
              fluidRow(
                
                column(width = 5, 
                box(
                  selectInput("indikator", "Indikator:", 
                              c("PIPPI", "PIO", "PIM", "POLY"),
                              selected = "PIPPI"),
                  height = 230
                )
                ),
                
                column(width = 7,
                box(plotOutput("plot1", height = 210),
                    height = 230)
                )
                
              ),
              
              fluidRow(
                
                column(width = 5, 
                       box(
                         p("some stuff")
                       )
                ),
                
                column(width = 7,
                       box(p("some stuff"))
                )
              )
              
              
      ),
      
      
      # ============================ DIABETES ==================================
      tabItem(tabName = "diabetes",
              h2("Diabetes tab content")
      ),
      
      
      # ============================ PRÄVENTION ================================
      tabItem(tabName = "prevention",
              h2("Prävention tab content")
      ),
      
      
      # ============================ METHODIK ==================================
      tabItem(tabName = "methodik",
              h2("Methodik tab content")
      ),
      
      
      # ============================ PUBLIKATIONEN =============================
      tabItem(tabName = "publikationen",
              h2("Publikationen tab content")
      )
      
      
      
    )
  )
)





