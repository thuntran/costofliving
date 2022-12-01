library(tidyverse)

us_state_local_tax_rate <- read_csv("data-raw/us_state_local_tax_rate.csv")

usethis::use_data(us_state_local_tax_rate, overwrite = TRUE)
