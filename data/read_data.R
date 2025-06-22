
# Load required packages
library(readxl)
library(tidyverse)

excel_file <- "/Users/sereina/Documents/03_Projects/14_Quality_Dashboard/data/data.xlsx"

# Read each sheet into a separate data frame
d.overall <- read_excel(excel_file, sheet = "overall")
d.age_sex <- read_excel(excel_file, sheet = "age_sex")
d.model <- read_excel(excel_file, sheet = "model")
d.netz <- read_excel(excel_file, sheet = "netz")
d.kanton <- read_excel(excel_file, sheet = "kanton")

# Save all three data frames into a single .Rda file
save(d.overall, d.age_sex, d.model, d.netz, d.kanton, file = "data/data.Rda")
