publikationen <- function() {
      
  output <- list(
    
    h3("Publikationen rundum die ambulanten SQIPRICA-Qualitätsindikatoren"),
    br(),
    tags$ul(class = "publications",
      
      tags$li(
        tags$a(
          href = "https://link.springer.com/article/10.1186/s12913-018-3477-z",
          "Blozik et al. 2018",
          class = "pub-link pub-link-block"
        ),
        "Evidence-based indicators for the measurement of quality of primary care using health insurance claims data in Switzerland: results of a pragmatic consensus process."
      ),
      
      tags$li(
        tags$a(
          href = "https://bmchealthservres.biomedcentral.com/articles/10.1186/s12913-022-07893-8",
          "Blozik et al. 2022",
          class = "pub-link pub-link-block"
        ),
        "Evidence-based indicators for the measurement of quality of primary care using health insurance claims data in Switzerland: update of the SQUIPRICA working group."
      ),
      
      tags$li(
        tags$a(
          href = "https://pubmed.ncbi.nlm.nih.gov/32332005/",
          "Huber et al. 2020",
          class = "pub-link pub-link-block"
        ),
        "Evidence-based quality indicators for primary healthcare in association with the risk of hospitalisation: a population-based cohort study in Switzerland."
      ),
      
      tags$li(
        tags$a(
          href = "https://pmc.ncbi.nlm.nih.gov/articles/PMC10308744/",
          "Farcher et al. 2023",
          class = "pub-link pub-link-block"
        ),
        "Does the implementation of an incentive scheme increase adherence to diabetes guidelines? A retrospective cohort study of managed care enrollees."
      ),
      
      tags$li(
        tags$a(
          href = "https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0311099",
          "Farcher et al. 2024",
          class = "pub-link pub-link-block"
        ),
        "Are integrated care models associated with improved drug safety in Swiss primary care? an observational analysis using healthcare claims data."
      )
  )
  )

return(output)
}