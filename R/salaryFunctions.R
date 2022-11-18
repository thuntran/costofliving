#' A gross salary calculator based on user's input of states
#'
#' There are two functions to help calculate gross salaries earning minimum wage for states
#' gross salary is an added column to existing data set
#'
#' @import tidyverse
#' @import dplyr
#' @importFrom magrittr %>%
#' @import purrr
#' @import utils
#'
#' @param states A list of states
#'
#' @return A tibble of taxes, average living costs, minimum wage, and gross salaries earning minimum wage
#' per state
#'
#'
#'
#' @examples
#' grossSalaryMultiple(c("MA","TX","IL","AL"))
#' grossSalaryMultiple("MA")
#' @export

# define global variables
globalVariables(c("minimumWage", "stateAbbr", "us_cost_of_living"))

# function input takes in a list of states
grossSalaryMultiple <- function(states) {
  # each state is passed to the grossSalary function to calculate gross salary and
  # iterated using map()
  state_rows <- purrr::map(states, grossSalary)
  # separate tibbles are combined into one
  bind_rows(state_rows)
}

# function does calculation
grossSalary <- function(input) {
  # checks if user inputs a valid state abbreviation
    if (input %in% us_cost_of_living$stateAbbr) {
      us_cost_of_living_grossSalary <- us_cost_of_living %>%
        # filter by user input
        filter(stateAbbr==input) %>%
        # gross salary is calculated by working minimum wage 40 hours a week and 52 weeks in a year
        mutate(grossSalary = minimumWage * 40 * 52)
      return(us_cost_of_living_grossSalary)
    }
    else {
      # throws an error if user does not input a valid state
      print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
    }
}

