library(tidyverse)

us_federal_tax_rate <- read_csv("data-raw/us_federal_tax_rate.csv")

usethis::use_data(us_federal_tax_rate, overwrite = TRUE)

