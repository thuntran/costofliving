# Define global variables
#'
#' @import utils
globalVariables(c("minimumWage", "stateAbbr", "us_cost_of_living"))

#' A function that calculates the annual gross salary of a single person earning
#' minimum wage at a specific state, given a state as input.
#'
#' `gross_salary` is an added column to the existing `us_cost_of_living` data set.
#' This serves as a helper function to the following `gross_salary_multiple()`
#' function.
#'
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of taxes, average living costs, minimum wage, and gross
#' salaries earning minimum wage per state
#'
#' @export
#'
#' @examples
#' gross_salary("MA")
#' gross_salary("TX")
#'

gross_salary <- function(input_state) {
  # checks if user inputs a valid state abbreviation
  if (input_state %in% us_cost_of_living$state_abbr) {
    us_cost_of_living_gross_salary <- us_cost_of_living %>%
      # filter by state from user input
      filter(state_abbr==input_state) %>%
      # gross salary is calculated by working minimum wage 40 hours a week
      # and 52 weeks in a year
      mutate(gross_salary = minimum_wage * 40 * 52)
    return(us_cost_of_living_gross_salary)
  }
  else {
    # throws an error if user does not input a valid state
    print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  }
}


#' A function that calculates the annual gross salary of a single person earning
#' minimum wage at one or more states, given a vector of states as input.
#'
#'
#' @import dplyr
#' @import purrr
#'
#' @param states A list of states
#'
#' @return A tibble of taxes, average living costs, minimum wage, and gross
#' salaries earning minimum wage per state
#'
#' @export
#'
#' @examples
#' gross_salary_multiple(c("MA","TX","IL","AL"))
#' gross_salary_multiple("MA")
#'

gross_salary_multiple <- function(states) {
  # each state is passed to the `gross_salary()` function to calculate gross salary
  # and iterated using map()
  state_rows <- map(states, gross_salary)
  # separate tibbles are combined into one
  bind_rows(state_rows)
}


