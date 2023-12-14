#' FIFA World Cup Hosts and Attendance 1930-2022
#'
#' @format A data frame with 22 observations
#' \describe{
#' \item{Year}{Year world cup was played}
#' \item{Hosts}{Host country}
#' \item{Matches}{Total matches played that year}
#' \item{Totalattendance}{Total attendance at all matches}
#' \item{Averageattendance}{Average attendance across all matches that year}
#' }
#' @source \url{https://en.wikipedia.org/wiki/FIFA_World_Cup}
"World_Cup"

library(tidyverse)
library(rvest)
library(stringr)

url = 'https://en.wikipedia.org/wiki/FIFA_World_Cup'
data <- read_html(url) %>%
html_nodes('table') %>%
  .[[4]] %>%
  html_table(header = TRUE, fill = TRUE)

World_Cup <- data %>%
  select(c(1, 2, 4, 5, 6)) %>%
  slice(-c(1, 24:27)) %>%
  rename(Totalattendance = 3) %>%
  relocate(Matches, .before = Totalattendance) %>%
  mutate_at(4:5, str_remove_all, ',') %>%
  mutate_at(4:5, as.numeric)
