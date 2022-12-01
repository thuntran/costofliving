library(tidyverse)

us_minimum_wage <- read_csv("data-raw/us_minimum_wage.csv")

usethis::use_data(us_minimum_wage, overwrite = TRUE)
