

hintergrund <- function() {
  
  tabBox(
    
    id = "tabset1", 
    height = "90vh", width = 12,
    
    tabPanel("0 ", 
             br(),
             br(),
             div(
               style = "text-align: center;",
               tags$img(src = "title_image.png", style = "max-width:45%; height:auto;")
             )
    ),
    
    tabPanel("1 Gesundheitssystem Schweiz", 
             br(),
             h3("Gesundheitssytem Schweiz: Teuer, Gut und Intransparent"),
             br(),
             tags$img(src = "hintergrund_1.png", style = "max-width:70%; height:auto;")
    ),
    
    tabPanel("2 Gesundheitsdaten", 
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
                      tags$li("Krankenversicherungsdaten", style = "font-size:22px; font-weight: bold;"),
                    )
             ),
             column(width = 5, 
                    br(),
                    tags$img(src = "Puzzle.png", style = "max-width:100%; height:auto;")
             )
    ),
    
    tabPanel("3 Versicherungsdaten",
             h3("Krankenvsericherungsdaten"),
             br(),
             tags$ul(
               tags$li("Real World Evidence", style = "font-size:22px;"),
               tags$li("Grösstenteils ohne Bias", style = "font-size:22px;"),
               tags$li("Sektorübergreifend (Meidkamente, ambulant, stationär, ...)", style = "font-size:22px;")
             ),
             br(),
             tags$img(src = "claims_data.png", style = "max-width:70%; height:auto;")
    ),
    
    tabPanel("4  Qualitätsindikatoren",
             br(),
             h3("Transparenz schaffen und Qualität verbessern"),
             h4("Swiss Quality Indicator for Primary Care (SQIPRICA) Project:
                Evidenzbasierte Qualitätsindikatoren für die ambulante Primärversorung basierend auf Krankenversicherungsdaten"),
            
             "Publikationen:",
             tags$a(href = 'https://link.springer.com/article/10.1186/s12913-018-3477-z', "Blozik et al. (2018)"),
             "; ",
             tags$a(href = 'https://bmchealthservres.biomedcentral.com/articles/10.1186/s12913-022-07893-8', "Blozik et al. (2022)"),
             
             br(), br(),br(),
            
             tags$img(src = "hintergrund_qi.png", style = "max-width:80%; height:auto;")
    )
    
  )  
  
}