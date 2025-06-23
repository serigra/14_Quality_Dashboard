library(shiny)
library(shinydashboard)
library(magrittr)
library(tidyverse)


ui <- dashboardPage(
  
  dashboardHeader(title = "Ambulante Qualitätsindikatoren", titleWidth = 450),
  
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("Hintergrund", tabName = "hintergrund"),
      menuItem("Entwicklung", tabName = "entwicklung"),
     
      hr(),
      
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
      
      # ============================ HINTERGRUND ===============================
  
      tabItem(tabName = "hintergrund",
              h2("Hintergrund tab content")
      ),
      
      # ============================ ENTWICKLUNG ===============================
      
      tabItem(tabName = "entwicklung",
              
              tabBox(
                
                id = "tabset1", 
                height = "100vh", width = 12,
                
                tabPanel("1 Challenges", 
                         
                         br(), 
                         
                         h4("Grosses Angebot an Packages und Widgets - Was passt am besten?"),
                         
                         hr(),
                         
                         tags$img(src = "packages.png", style = "max-width:60%; height:auto;"),
                         
                         hr(),
                         
                         tags$img(src = "widgets.png", style = "max-width:70%; height:auto;"),
                        
                         ),
                
                tabPanel("2 Think & Design", 
                         
                         br(), 
                         
                         h4(
                           "Erste Skizze des Dashboards: ",
                           tags$a("excalidraw.com", href = "https://excalidraw.com/#json=OYC1khHWhkh4ZmVtYbUti,yYR0dNhBFCbqH758_zuNVQ", target = "_blank"),
                           " and ", 
                           tags$a("shinydraw library", href = "https://github.com/MikeJohnPage/shinydraw", target = "_blank"),
                           " by Mike Page."
                         ),
                         
                         br(), 
                         
                         tags$img(src = "skizze_dashboard.png", style = "max-width:90%; height:auto;"),
                         
                         ),
                tabPanel("3 Involve Stakeholders", 
                         
                         tags$img(src = "stakeholders.png", style = "max-width:80%; height:auto;"),
                         
                         ),
                tabPanel("4 Architecture", 
                         br(),
                         tags$img(src = "architecture.png", style = "max-width:90%; height:auto;")
                         
                         )
              )  
              
              
              
              
      ),
      
      # =========================== ARZNEIMITTEL ===============================
      
      tabItem(tabName = "arzneimittel",
              
              fluidRow(
                
                box(width = 6,  height = 260,
                    
                    column(width = 3,
                    
                           selectInput("qi", "Indikator", 
                                       c("PIPPI", "PIO", "PIM", "POLY"),
                                       selected = "PIPPI")
                    ),
                    
                    column(width = 9,
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





