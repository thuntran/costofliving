# Define global variables
#'
#' @import utils
globalVariables(c("minimum_wage", "state_abbr", "us_minimum_wage"))

#' Function to calculate gross salary of one state
#'
#' A function that calculates the annual gross salary of a single person earning
#' minimum wage at a specific state, given a state as input.
#'
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of the state, minimum wage, and gross salary calculation
#' earning minimum wage
#'
#' @export
#'
#' @examples
#' gross_salary("MA")
#' gross_salary("TX")
#'

gross_salary <- function(input_state) {
  if (!(input_state %in% us_minimum_wage$state_abbr)) {
    stop("Please enter valid state abbreviations and check that the letters are capitalized.")
  }

  us_cost_of_living_gross_salary <- us_minimum_wage %>%
    filter(state_abbr == input_state) %>%
    # gross salary is calculated by working minimum wage 40 hours a week and 52 weeks in a year
    mutate(gross_salary = as.double(format(round(minimum_wage * 40 * 52, 2), nsmall = 2)))

  return(us_cost_of_living_gross_salary)
}
