library(shiny)
library(shinydashboard)
library(magrittr)
library(tidyverse)


ui <- dashboardPage(
  
  dashboardHeader(title = "Ambulante Qualitätsindikatoren", titleWidth = 450,
                  
                  tags$li(
                    a(
                      href = "https://github.com/serigra/14_Quality_Dashboard", 
                      icon("github"), 
                      title = "View on GitHub",
                      target = "_blank"
                    ),
                    class = "dropdown"
                  )
                  ),
  
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("Hintergrund", tabName = "hintergrund"),
      menuItem("Entwicklung", tabName = "entwicklung"),
     
      hr(),
      
      menuItem("Themenfeld", tabName = "themenfeld",
               menuSubItem("Arzneimittel", tabName = "arzneimittel"),
               menuSubItem("Diabetes",    tabName = "diabetes"),
               menuSubItem("...",    tabName = "other")
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
    
    # ===================== Custom CSS and JS files ============================
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
      tags$script(src = "custom.js"),
      
      ## TODO --> move to custom.css
      
      # background of leaflet Swiss map same
      tags$style(HTML(paste0(".leaflet-container {background:", background_color ," !important;}"))),
      # vertical distance between bulleted list of publications
      tags$style(HTML("
              ul.publications {
                display: flex;
                flex-direction: column;
                gap: 1.2em;
              }")),
      # hover link changing color
      tags$style(HTML("
              .pub-link {
                color: #7B9790;
                font-size: 1.15em;
                font-weight: bold;
                text-decoration: none;
                transition: color 0.2s;
              }
              .pub-link:hover {
                color: #afc1bc; /* a lighter green for hover */
              }
              .pub-link-block {
                margin-bottom: 0.2em;
                display: block;
              } "))
    ),
    
    
    tabItems(
      
      # ============================ HINTERGRUND ===============================
  
      tabItem(tabName = "hintergrund",
              hintergrund() # R/ hintergrund.R
      ),
      
      # ============================ ENTWICKLUNG ===============================
      
      tabItem(tabName = "entwicklung",
              entwicklung() # R/ entwicklung.R
      ),
      
      # =========================== ARZNEIMITTEL ===============================
      
      tabItem(tabName = "arzneimittel",
              
              ## TODO --> move to arzneimittel.R (does not exist yet!)
              
              fluidRow(
                
                box(width = 6,  height = 260,
                    
                    column(width = 2,
                    
                           selectInput("qi", "Indikator", 
                                       c("PIPPI", "PIO", "PIM", "POLY"),
                                       selected = "PIPPI")
                    ),
                    
                    column(width = 10,
                           h5(strong(textOutput("qi_summary"))),
                           p(htmlOutput("qi_description")),
                           p(htmlOutput("qi_publikationen"))
                           )
                    ),
               
                
                
                box(width = 6, height = 260, 
                    timeTrendUI("plot1"))
              
              ),
              
              fluidRow(  
                
                      box(width = 12, height = 570,
                          
                          fluidRow(column(width = 1,
                                          selectInput("year", "Jahr", 
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
                          
                          chloroplethUI("chloropleth"),
                          
                          footer = tags$div("Alle 12-Monatsprävalenzen sind für Alter und Geschlecht adjustiert, 
                                            ausgenommen sind die Prävalenzen in der Darstellung nach Alter und Geschlecht.", 
                                            style = "font-size: 0.85em; text-align: right; background-color: #f8f8f6; color:  #9b9c9d; margin: -15px -12px -15px -12px; padding: 10px; border-radius: 0 0px 15px 15px; border: 2px solid #eef0f2 !important;")
                          )
                      )

      ),
      
      
      # ============================ DIABETES ==================================
      
      tabItem(tabName = "diabetes",
             
              diabetes() # R/ diabetes.R
             
      ),
      
      # =========================== ... (OTHER) ================================
      
      tabItem(tabName = "other",
              br(), br(),
              br(), br(),
              br(), br(),
              
              div(
                style = "text-align: center;",
                tags$img(src = "wip.png", style = "max-width:25%; height:auto;")
              )
      ),
      
      
      
      # ============================ METHODIK ==================================
      
      tabItem(tabName = "methodik",
              box(height = "90vh", width = 12,
                  methodik() # R/ methodik.R
              )
      ),
      
      
      # ============================ PUBLIKATIONEN =============================¨
      
      tabItem(tabName = "publikationen",
              
              box(height = "90vh", width = 12,
                  publikationen() # R/ publikationen.R
              )
      )
      
    )
  )
)





