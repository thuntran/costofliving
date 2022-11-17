library(tidyverse)

us_cost_of_living <- read_csv("data-raw/us_cost_of_living_combined_data.csv")

usethis::use_data(us_cost_of_living, overwrite = TRUE)

