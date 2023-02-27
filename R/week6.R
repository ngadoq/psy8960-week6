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
         year = str_extract(pattern = "(\\d+)"),
         page_start = 
         perf_ref = str_detect(citations_txt, pattern = "peformance|Performance"),
         title = 
         first_author = 
         )


#.([\sa-zA-Z,:\n\t]+).

str_match(citations_txt, pattern = "[a-zA-Z.&\\s,]+?\\(\\d+\\).([\\sa-zA-Z,:\n\t]+).")


