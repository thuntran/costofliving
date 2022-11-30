library(tidyverse)

taxable_income <- read_csv("data-raw/taxable_income.csv")

usethis::use_data(taxable_income, overwrite = TRUE)

