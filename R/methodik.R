
methodik <- function() {

  output <- list(
  
  h2("Methodik"),
  br(),
  
  # ============================================================================
  h3("Entiwcklung Qualitätsindikatoren"), 
  
  br(), 
  
  hr(),
  
  br(),
  
  # ============================================================================
  h3("Definition Qualitätsindikatoren"),
  h4("Medikationssicherheit"),
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
         "Farcher et al. (2024)"),
  br(),
  h4("Diabetes"),
 
  
  br(), 
  
  hr(),
  
  br(),
  
  # ============================================================================
  h3("Entwicklung Dashboard - R Packages"),
  p("shiny, shinydashboard, ggplot2, ggiraph, plotly, leaflet")
)
  return(output)
}