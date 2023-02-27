# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(stringi)
library(stringr)
library(readr)


# Data Import
citations <- stri_read_lines("../data/citations.txt")
citations_txt <- str_match(citations, "^$")
citations_txt <- read_lines(citations, skip_empty_rows = TRUE)

