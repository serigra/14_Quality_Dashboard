library(shiny)
library(shinydashboard)
library(magrittr)
library(tidyverse)


ui <- dashboardPage(
  
  dashboardHeader(title = "Ambulante Qualitätsindikatoren", titleWidth = 450),
  
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("Themenfeld", tabName = "themenfeld",
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
      tags$script(src = "custom.js"),
      tags$style(HTML(".leaflet-container {background: #f8f8f6 !important;}"))
    ),
    
    tabItems(
      
      # =========================== ARZNEIMITTEL ===============================
      
      tabItem(tabName = "arzneimittel",
              
              fluidRow(
                
                box(width = 6,  height = 250,
                    
                    column(width = 5,
                    
                           selectInput("qi", "Indikator:", 
                                       c("PIPPI", "PIO", "PIM", "POLY"),
                                       selected = "PIPPI")
                    ),
                    
                    column(width = 7,
                           p("somasdflkja klasjfksd jklsdjf asdlf jksljf slf lksdjf."))
                    ),
               
                
                
                box(width = 6, height = 250, 
                    timeTrendUI("plot1"))
              
              ),
              
              fluidRow(  
                
                      box(width = 12, height = 570,
                          
                          fluidRow(column(width = 1,
                                          selectInput("year", "Jahr:", 
                                                      c(2014:2024),
                                                      selected = 2024)
                                          ),
                                   
                                   column(width = 4, 
                                          ageSexUI("plot2")
                                          ),
                                   
                                   column(width = 3,
                                          modelUI("plot3")
                                          ),
                                   
                                   column(width = 4,
                                          netzUI("plot4")
                                          )
                                  ),
                          
                          br(),
                          
                          chloroplethUI("chloropleth")
                          
                          # fluidRow(
                          #   
                          #   column(width = 5,
                          #          #p("alksjdflas jalsdkjfas lkjs dflasdkfj sdfkljsd.")
                          #          chloroplethUI("plotmap")
                          #         ),
                          #   
                          #   column(width = 7,
                          #          #plotOutput("plot5", height = 280)
                          #          chloroplethUI("plotbar")
                          #         )
                          #       )
                          
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
              methodik_text() # R/ methodik_text.R
      ),
      
      
      # ============================ PUBLIKATIONEN =============================¨
      
      tabItem(tabName = "publikationen",
              h2("Publikationen tab content")
      )
      
      
      
    )
  )
)





