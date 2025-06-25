

hintergrund <- function() {
  
  tabBox(
    
    id = "tabset1", 
    height = "90vh", width = 12,
    
    tabPanel("1", 
             br(),
             h3("Gesundheitssytem Schweiz: Teuer, Gut und Intransparent"),
             br(),
             tags$img(src = "hintergrund_1.png", style = "max-width:70%; height:auto;")
    ),
    
    tabPanel("> 2", 
             column(width = 7,
                    br(),
                    h3("Gesundheitssytem Schweiz: Daten"),
                    br(),
                    tags$ul(
                      tags$li("Statistische Daten (BfS)", style = "font-size:22px;"),
                      tags$li("Administrative Daten (Kantone, BAG)", style = "font-size:22px;"),
                      tags$li("Kosten Daten (SwissDRG, SASIS)", style = "font-size:22px;"),
                      tags$li("Qualitäts Daten (ANQ, Register)", style = "font-size:22px;"),
                      tags$li("Andere (IQVIA™ Verkaufsdaten, pharmaSuisse, Sentinella, FIRE, ...)", style = "font-size:22px;"),
                      tags$li("Versicherungsdaten", style = "font-size:22px; font-weight: bold;"),
                    )
             ),
             column(width = 5, 
                    br(),
                    tags$img(src = "Puzzle.png", style = "max-width:100%; height:auto;")
             )
    ),
    
    tabPanel("> 3",
             br(),
             h3("Versicherungsdaten-Schatz!"),
             br(),
             tags$img(src = "claims_data.png", style = "max-width:90%; height:auto;")
    ),
    
    tabPanel("> 4",
             br(),
             h3("Transparenz schaffen und Qualität verbessern"),
             h4("Evidenzbasierte Qualitätsindikatoren basierend auf Krankenversicherungsdaten"),
             br(),
             h4("Swiss Quality Indicator for Primary Care (SQIPRICA) Project"),
             p("Sammlung von evidenzbasierten Indikatoren zur Messung der Qualität der ambulanten Primärversorgung in der Schweiz."),
             tags$img(src = "claims_data.png", style = "max-width:90%; height:auto;")
    )
    
  )  
  
}