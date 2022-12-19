#' Function to calculate gross salary, tax, net salary, and difference between
#' average cost of living and net salary across multiple states
#'
#' A function that calculates the annual gross salary, total tax (federal, state, local),
#' net salary, and difference between average cost of living and net salary of a single person
#' earning minimum wage at one or more states, given a vector of states as input.
#'
#'
#' @import dplyr
#' @import purrr
#' @param states A list of states, abbreviated (e.g. c("MA", "TX", "IL", "AL"))
#'
#' @return A tibble of minimum wage, gross salaries earning minimum wage, federal,
#' state, local taxes, net salaries, and difference between average cost of living
#' and net salary per state
#'
#' @export
#'
#' @examples
#' avg_col_multiple_states(c("MA", "TX", "IL", "AL"))
#' avg_col_multiple_states("MA")
#'

avg_col_multiple_states <- function(states) {
  # Throws an error if the user happens to enter the same state twice
  if (length(states) != length(unique(states))) {
    stop("You might have entered the same state twice. Please try again.")
  }

  # map the `net_salary_avg_col_difference()` function to each state in the `states` vector
  state_rows <- map_df(states, net_salary_avg_col_difference)

  return(state_rows)
}
