## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(janitor)
apples <- read_csv("data-raw/apples.csv") %>%
  clean_names()

usethis::use_data(DATASET, overwrite = TRUE)
