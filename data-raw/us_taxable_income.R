library(tidyverse)

us_taxable_income <- read_csv("data-raw/us_taxable_income.csv")

usethis::use_data(us_taxable_income, overwrite = TRUE)

