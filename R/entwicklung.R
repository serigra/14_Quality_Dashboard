

entwicklung <- function() {
  
  tabBox(
    
    id = "tabset2", 
    height = "90vh", width = 12,
    
    tabPanel("1 Challenges", 
             
             br(), 
             
             h3("Grosses Angebot an Packages und Widgets - Was passt am besten?"),
             
             hr(),
             
             tags$img(src = "packages.png", style = "max-width:60%; height:auto;"),
             
             hr(),
             
             tags$img(src = "widgets.png", style = "max-width:70%; height:auto;"),
             
    ),
    
    tabPanel("2 Think & Design", 
             
             br(), 
             
             h4(
               "Dashboard Skizze: ",
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
             br(), br(),
             tags$img(src = "architecture.png", style = "max-width:90%; height:auto;")
             
    ),
    tabPanel("5 Build", 
             br(),
             tags$img(src = "hex_pkgs.png", style = "max-width:60%; height:auto;")
             
    )
  )  
  
}