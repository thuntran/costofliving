# Define global variables
#'
#' @import utils
globalVariables(c("minimumWage", "stateAbbr", "us_cost_of_living"))

#' A function that calculates the annual gross salary of a single person earning
#' minimum wage at a specific state, given a state as input.
#'
#' grossSalary is an added column to the existing us_cost_of_living data set.
#' This serves as a helper function to the following grossSalaryMultiple()
#' function.
#'
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @param state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of taxes, average living costs, minimum wage, and gross
#' salaries earning minimum wage per state
#'
#' @export
#'
#' @examples
#' grossSalary("MA")
#' grossSalary("TX")
#'

grossSalary <- function(state) {
  # checks if user inputs a valid state abbreviation
  if (state %in% us_cost_of_living$stateAbbr) {
    us_cost_of_living_grossSalary <- us_cost_of_living %>%
      # filter by state from user input
      filter(stateAbbr==state) %>%
      # gross salary is calculated by working minimum wage 40 hours a week
      # and 52 weeks in a year
      mutate(grossSalary = minimumWage * 40 * 52)
    return(us_cost_of_living_grossSalary)
  }
  else {
    # throws an error if user does not input a valid state
    print("Error: Please enter valid state abbreviations and check that
          the letters are capitalized.")
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
#' grossSalaryMultiple(c("MA","TX","IL","AL"))
#' grossSalaryMultiple("MA")
#'

grossSalaryMultiple <- function(states) {
  # each state is passed to the grossSalary function to calculate gross salary and
  # iterated using map()
  state_rows <- map(states, grossSalary)
  # separate tibbles are combined into one
  bind_rows(state_rows)
}


