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
      tags$script(src = "custom.js")
    ),
    
    tabItems(
      
      # =========================== ARZNEIMITTEL ===============================
      tabItem(tabName = "arzneimittel",
              
              fluidRow(
                
                box(width = 6,  height = 250,
                    
                    column(width = 5,
                    
                           selectInput("indikator", "Indikator:", 
                                       c("PIPPI", "PIO", "PIM", "POLY"),
                                       selected = "PIPPI")
                    ),
                    
                    column(width = 7,
                           p("somasdflkja klasjfksd jklsdjf asdlf jksljf slf lksdjf."))
                    ),
               
                
                
                box(width = 6, height = 250,
                    
                    plotOutput("plot1", height = 210)
                    
                    )
              
              ),
              
              fluidRow(  
                
                      box(width = 12, height = 570,
                          
                          fluidRow(column(width = 1,
                                          selectInput("jahr", "Jahr:", 
                                                      c(2014:2024),
                                                      selected = 2024)
                                          ),
                                   
                                   column(width = 4, 
                                          plotOutput("plot2", height = 250)
                                          ),
                                   
                                   column(width = 3,
                                          plotOutput("plot3", height = 250)
                                          ),
                                   
                                   column(width = 4,
                                          plotOutput("plot4", height = 250)
                                          )
                                  ),
                          
                          br(),
                          
                          fluidRow(
                            
                            column(width = 5,
                                   p("alksjdflas jalsdkjfas lkjs dflasdkfj sdfkljsd.")
                                  ),
                            
                            column(width = 7,
                                   plotOutput("plot5", height = 280)
                                  )
                                )
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
              h2("Methodik"),
              br(), br(),
              h4("Arzneitmittel Indikatoren"),
              p("Patientengruppen mit potenziell unangemessener PPI-Behandlung wurden 
                mittels PIPPI bei einer Stichprobe von Patienten mit ≥1 PPI-Verschreibung erfasst.
                Unangemessene Dosierungen wurden nach der Definition von Muheim et al. 2021 bestimmt,
                welche durch eine Mindestdosis von 11,5 g Pantoprazol-Äquivalenten 
                während 365 aufeinanderfolgender Tage definiert wird. 
                PIOs wurden anhand einer Patientenstichprobe mit ≥2 Verschreibungen 
                von Schmerzmedikamenten mit einer Verschreibungslücke von ≤4 Wochen 
                (auch quartalsübergreifend) pro Quartalsjahr evaluiert.
                Krebspatienten, Patienten in palliativer Betreuung oder in
                Opioid-Substitutionsprogrammen wurden ausgeschlossen. 
                PIOs wurden durch die Verschreibung von ≥2 schwachen oder starken 
                Opioiden mit einer Verschreibungslücke von ≤4 Wochen pro Quartalsjahr definiert. 
                PIM und Polypharmazie (Verschreibung von ≥5 verschiedenen Wirkstoffen, d.h. ATC-Codes) 
                stellen Arzneimittelsicherheitsmaße bei Patienten ab 65 Jahren mit 
                ≥1 Medikamentenverschreibung im jeweiligen Jahr dar. Diese wurden 
                pro Quartalsjahr evaluiert und auf Jahresebene aggregiert 
                (bei ≥1 PIM oder Polypharmazie pro Jahr). 
                PIMs wurden basierend auf den Beers und PRISCUS Kriterien bewertet
                und umfassen Medikamente, die bei älteren Personen aufgrund 
                erhöhter Risiken unerwünschter Ereignisse und mangelnder 
                Wirksamkeitsnachweise vermieden werden sollten, 
                wenn alternative Medikation verfügbar ist."),
              p("Allgemein: Patienten, die verstorben waren, schwanger waren, 
                im Ausland oder in einem Pflegeheim lebten oder die jünger als 18 
                bzw. älter als 85 Jahre waren, 
                wurden von der Analyse ausgeschlossen. 
                Für die Analyse wurden drei Stichproben gebildet, 
                wobei ergebnisspezifische Ausschlusskriterien zur Bestimmung der 
                jeweiligen Ergebnisse zur Arzneimittelsicherheit angewendet wurden."),
              tags$a(href = 'https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0311099', 
                        "Farcher et al. (2024)")
      ),
      
      
      # ============================ PUBLIKATIONEN =============================
      tabItem(tabName = "publikationen",
              h2("Publikationen tab content")
      )
      
      
      
    )
  )
)





