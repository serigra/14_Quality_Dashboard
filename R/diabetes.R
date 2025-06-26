

diabetes <- function() {
  
  output <- list(
    
    fluidRow(
      
      box(width = 6,  height = 280,
          
          column(width = 3,
                 
                 selectInput("qi_diab", "Indikator", 
                             c("Blutzucker", "Blutfett", "Nierenstatus", "Augenkontrolle", "Volle Adhärenz"),
                             selected = "Blutzucker")
          ),
          
          column(width = 9,
                 br(), br(), br(), 
                 div(
                   style = "text-align: center;",
                   tags$img(src = "wip.png", style = "max-width:20%; height:auto;")
                 )
          )
      ),
      
      box(width = 6, height = 280, 
          br(), br(), 
          div(
            style = "text-align: center;",
            tags$img(src = "wip.png", style = "max-width:20%; height:auto;")
          )
      ),
      
    ),
    
    fluidRow(  
      
      box(width = 12, height = 600,
          
          fluidRow(column(width = 1,
                          selectInput("year_diab", "Jahr", 
                                      c(2014:2024),
                                      selected = 2024)
          ),
          
          column(width = 4, 
                 br(), br(), 
                 div(
                   style = "text-align: center;",
                   tags$img(src = "wip.png", style = "max-width:25%; height:auto;")
                 )
          ),
          
          column(width = 3,
                 br(), br(), 
                 div(
                   style = "text-align: center;",
                   tags$img(src = "wip.png", style = "max-width:30%; height:auto;")
                 )
          ),
          
          column(width = 4,
                 br(), br(), 
                 div(
                   style = "text-align: center;",
                   tags$img(src = "wip.png", style = "max-width:25%; height:auto;")
                 )
          )
          ),
          
          fluidRow(
            
            column(width = 6, 
                   
                   div(
                     br(), br(), br(), br(), 
                     style = "text-align: center;",
                     tags$img(src = "wip.png", style = "max-width:25%; height:auto;")
                   )
            ),
            
            column(width = 6, 
                   div(
                     br(), br(), br(), br(), 
                     style = "text-align: center;",
                     tags$img(src = "wip.png", style = "max-width:25%; height:auto;")
                   )    
            ),
            
            footer = tags$div("Alle 12-Monatsprävalenzen sind für Alter und Geschlecht adjustiert, 
                                            ausgenommen sind die Prävalenzen in der Darstellung nach Alter und Geschlecht.", 
                              style = "font-size: 0.85em; text-align: right; background-color: #f8f8f6; color:  #9b9c9d; margin: -15px -12px -15px -12px; padding: 10px; border-radius: 0 0px 15px 15px; border: 2px solid #eef0f2 !important;")
          )
      )
    )
    
  )
  
  
  return(output)
}