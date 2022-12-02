# Define global variables
#'
#' @import utils
globalVariables(c("us_minimum_wage", "federal_tax_owed" , "us_state_local_tax_rate", "state_local_tax_owed"))

#' Function to calculate the state and local tax owed by an individual based on their gross income
#'
#' A function that calculates the amount of state and local tax owed by an individual earning
#' minimum wage, given a state as input.
#'
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of the state, minimum wage, gross salary calculation
#' earning minimum wage, federal tax owed based on income, and state and local tax owed
#' based on income
#'
#'
#' @export
#'
#' @examples
#' state_local_tax_owed("TX")
#' state_local_tax_owed("MA")
#'
state_local_tax_owed <- function(input_state) {
  # checks if user inputs a valid state abbreviation
  if (input_state %in% us_minimum_wage$state_abbr) {
    # the user's input is passed through the `federal_tax_owed()` function
    # the output is saved to state_row
    state_row <- federal_tax_owed(input_state)
    us_state_local_tax_rate <- us_state_local_tax_rate %>%
      # filter by state from user input
      filter(state_abbr==input_state)
    state_row <- state_row %>%
      # state and local tax are calculated by multiplying the combined rate by the gross salary
      mutate(state_local_tax_owed = (us_state_local_tax_rate$combined_tax_rate / 100) * gross_salary)
    return(state_row)
  } else {
    # throws an error if user does not input a valid state
    print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  }
}
