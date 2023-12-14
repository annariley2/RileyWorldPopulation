library(tidyverse)
library(readxl)

WorldPopulation <- read_excel('data-raw/World_Population.xls', sheet = 1, range = cell_rows(17:306)) %>%
  filter(Type == "Country/Area") %>%
  select(-c(1:2, 4:7)) %>%
  rename(Country = 1)
