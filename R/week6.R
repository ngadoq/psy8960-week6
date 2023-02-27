# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(stringi)
library(stringr)
library(tidyverse)


# Data Import
citations <- stri_read_lines("../data/citations.txt", encoding = )
citations_txt <- str_subset(citations, ".$")
length(citations)-length(citations_txt)
mean(str_length(citations_txt))

# Data Cleaning
sample(citations_txt, size = 10)
original = citations_tbl <- as_tibble(citations_txt, rownames = "line", .name_repair =~ "cite")
citations_tbl <- as_tibble(citations_txt, rownames = "line", .name_repair =~ "cite") |> 
  mutate(cite = str_replace_all(cite, "(\"|'')", ""),
         year = str_extract(cite, pattern = "(\\d{4})"),
         page_start = str_match(cite, pattern = "(\\d+)-\\d+")[,2],
         perf_ref = str_detect(cite, pattern = "peformance|Performance"),
         title = str_match(cite, pattern = ".*\\(\\d{4}\\)\\.\\s([^.]*\\.)(?: .*)")[,2],
         first_author = str_extract(cite, pattern = "([\\sa-zA-Z,]+)."))

length(citations_tbl$first_author)

