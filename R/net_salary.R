# Define global variables
#'
#' @import utils
globalVariables(c("us_minimum_wage", "federal_tax_owed" , "total_tax_owed", "state_local_tax_owed" , "net_salary"))

#' Function to calculate the total tax owed and net salary of an individual based on their gross income
#'
#' A function that calculates the combined amount of federal, state, and local tax owed by an individual earning
#' minimum wage, and their net salary, given a state as input.
#'
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of the state, minimum wage, gross salary,
#' total tax owed based on income, and net salary
#'
#'
#' @export
#'
#' @examples
#' net_salary("TX")
#' net_salary("MA")
#'
net_salary <- function(input_state) {
  # checks if user inputs a valid state abbreviation
  if (input_state %in% us_minimum_wage$state_abbr) {
    # the user's input is passed through the `state_local_tax_owed()` function
    # the output is saved to state_row
    state_row <- state_local_tax_owed(input_state)
    state_row <- state_row %>%
      # total tax owed is calculated by adding state, local, and federal tax amounts
      mutate(total_tax_owed = state_local_tax_owed + federal_tax_owed) %>%
      # net salary is calculated by finding the difference between gross salary and total tax owed
      mutate(net_salary = gross_salary - total_tax_owed)
    return(state_row)
  } else {
    # throws an error if user does not input a valid state
    print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  }
}
