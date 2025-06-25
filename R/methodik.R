
methodik <- function() {

  output <- list(
  

  # ============================================================================
  h3("Entwicklung Qualitätsindikatoren"), 
  p("Das SQIPRICA-Projekt (Swiss Quality Indicator for Primary Care) wurde 2016 gegründet, 
    um erstmals schweizweit einheitliche, evidenzbasierte Qualitätsindikatoren (QI) für 
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
  h3("Definitionen Qualitätsindikatoren"),
  
  br(),
  
  h4("Arzneimittelsicherheit"),
  p("Zur Bewertung der Arzneimittelsicherheit erfassen die vier entsprechenden Qualitätsindikatoren
    die Prävalenzen von potenziell problematischen Verschreibungsmustern, 
    die gemäß Leitlinien vermieden werden sollten (PIPPI potenziell inadäquate Protonenpumpenhemmer-Verschreibungen, 
    PIO potenziell inadäquate Opioid-Verschreibungen, PIM potenziell inadäquate Medikation bei älteren Menschen sowie 
    POLY Polypharmazie bei älteren Menschen). Die QIs geben den Prozentsatz der Patient:innen wieder, 
    bei denen potenziell kritische Verschreibungen vorliegen und somit die 
    Arzneimittelsicherheit beeinträchtigt sein könnte."),
  "Publikationen:",
  tags$a(href = 'https://pmc.ncbi.nlm.nih.gov/articles/PMC8053831/', 
         "Muheim et al. 2021"),
  tags$a(href = 'https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0311099', 
         "Farcher et al. 2024"),
  
  br(),br(),
  
  h4("Diabetes"),
  p("Zur Bewertung der Behandlung von Diabetespatient:innen erfassen die vier entsprechenden
    Qualitätsindikatoren die Prävalenzen von zentralen Kontrolluntersuchungen 
    , die gemäss Leitlinien empfohlen werden (Blutzucker, 2 mal jährlich empfohlen; 
    Blutfett, Nierenstatus und Augenkontrolle, jeweils 1 mal jährlich emfohlen). 
    Die QIs geben den Prozentsatz der Diabetespatient:innen wieder, 
    deren Behandlung den fachlichen Standards entspricht.  
    Ein zusätzlicher Gesamtindikator bewertet die vollständige Leitlinienkonformität über alle Untersuchungen hinweg."),
  "Publikationen:",
  tags$a(href = 'https://pubmed.ncbi.nlm.nih.gov/32332005/', "Huber et al. 2020"), "; ",
  tags$a(href = 'https://pmc.ncbi.nlm.nih.gov/articles/PMC10308744/', "Farcher et al. 2023"),
 
  hr(),
  
  # ============================================================================
  h3("Prävalenzen"),
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