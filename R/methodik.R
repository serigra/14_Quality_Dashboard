
methodik <- function() {

  output <- list(
  

  # ============================================================================
  h3("Entwicklung Qualitätsindikatoren"), 
  p("Das SQIPRICA-Projekt (Swiss Quality Indicator for Primary Care) wurde 2016 gegründet, 
    um erstmals schweizweit einheitliche, evidenzbasierte Qualitätsindikatoren für 
    die Grundversorgung (auf Patientenebene) zu entwickeln. 
    Potenzielle Indikatoren aus der Fachliteratur wurden von einer 
    internationalen Expertengruppe bewertet und an das Schweizer Gesundheitssystem angepasst, 
    und basierend auf Krankeversicherungsdaten auf Umsetzbarkeit geprüft.
    Total wurden 34 Qualitätsindikatoren identifiziert, die verschiedene Bereiche 
    der Grundversorgung abdecken: Arzneimittelsicherheit, Betreuung älterer Patienten, 
    ärztliche Effizienz und Management chronischer Krankheiten. 
    Total 8 dieser Qualitätsindikatoren sind Teil vom vorliegenden Monitoring-Dashbaord."),
  "Der Entwicklungsprozess und alle Details zu den Indikatoren sind in folgenden zwei Publikationen beschrieben:",
  tags$a(href = 'https://link.springer.com/article/10.1186/s12913-018-3477-z', "Blozik et al. (2018)"),
  "; ",
  tags$a(href = 'https://bmchealthservres.biomedcentral.com/articles/10.1186/s12913-022-07893-8', "Blozik et al. (2022)"),
  
  hr(),
  
  # ============================================================================
  h3("Definition Qualitätsindikatoren"),
  h4("Arzneimittelsicherheit"),
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
 
  hr(),
  
  # ============================================================================
  h3("Prävalenz"),
  p("Alle gegeben Prozentzahlen repräsentieren 12-Monatsprävalenzen. 
    Die 12-Monatsprävalenz gibt den Anteil der Personen in einer definierten Population an, 
    die innerhalb eines Jahres ein bestimmtes Ereignis oder Merkmal aufweisen. 
    Beim Qualitätsindikator PIM zeigt sie beispielsweise, wie viele Prozent aller 
    Versicherten über 65 Jahre mit mindestens einer Medikamentenverschreibung im Laufe von 12 Monaten 
    eine potenziell inadäquate Medikation verschrieben bekommen haben."),
  p("Alle 12-Monatsprävalenzen - mit Ausanhme der Prävalenzen nach Alters- und Geschlechtsgruppen - 
    sind adjustiert für die Alters- und Geschlechtsverteilung der jeweiligen Gruppen/ Populationen."),
  
  br()
)
  return(output)
}