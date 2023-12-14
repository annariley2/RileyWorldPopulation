#' Countrypop function
#'
#' Returns a graph of a country's population over time.
#'
#' @param a "Country"
#' @return A graph of the population by year for the country of interest
#' @examples
#' countrypop("United States of America")
#' @export

countrypop <- function(x){
  input <- x
  output <- WorldPopulation %>%
    filter(Country == x) %>%
    pivot_longer(2:50,
                 names_to = 'Year',
                 values_to = 'Population') %>%
    select(Country, Year, Population) %>%
    mutate_at(2:3, as.numeric)
    output <- ggplot(data = output, aes(x = Year, y = Population)) +
      geom_point() +
      labs(x = "Year", y = "Population") +
      labs(title = x) +
      scale_x_continuous(breaks = c(1950, 1960, 1970, 1980, 1990, 2000, 2010, 2020))
    ifelse(WorldPopulation$Country == x, return(output), stop("Error: enter valid country"))
}
