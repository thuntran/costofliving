# Define global variables
#'
#' @import utils
globalVariables(c("us_minimum_wage", "net_salary" , "us_cost_of_living", "net_salary_avg_col_difference"))

#' Function to calculate the difference between average cost of living and net salary
#'
#' A function that calculates the difference between the average costs of living (grocery, medical, housing, etc)
#' by net salary, given a state as input.
#'
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of the state, minimum wage, gross salary,
#' minimum wage, total tax, net salary,
#' and the difference between net salary and average cost of living
#'
#'
#' @export
#'
#' @examples
#' net_salary_avg_col_difference("TX")
#' net_salary_avg_col_difference("MA")
#'
net_salary_avg_col_difference <- function(input_state) {
  # checks if user inputs a valid state abbreviation
  if (input_state %in% us_minimum_wage$state_abbr) {
    # the user's input is passed through the `net_salary()` function
    # the output is saved to state_row
    state_row <- net_salary(input_state)
    us_cost_of_living <- us_cost_of_living %>%
      # filter by state from user input
      filter(state_abbr==input_state)
    state_row <- state_row %>%
      # the average cost of living is subtracted by the net salary (the difference)
      mutate(net_salary_avg_col_difference = net_salary - us_cost_of_living$total_avg_cost)
    return(state_row)
  } else {
    # throws an error if user does not input a valid state
    print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  }
}
