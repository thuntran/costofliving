#' Function to calculate gross salary, tax, net salary, and difference between average cost of living
#' and net salary across multiple states
#'
#' A function that calculates the annual gross salary, total tax (federal, state, local), net salary,
#' and difference between average cost of living and net salary
#' of a single person earning minimum wage at one or more states, given a vector of states as input.
#'
#'
#' @import dplyr
#' @import purrr
#' @param states A list of states
#'
#' @return A tibble of minimum wage, gross salaries earning minimum wage, federal,
#' state, local taxes, net salaries, and difference between average cost of living
#' and net salary per state
#'
#' @export
#'
#' @examples
#' avg_col_multiple_states(c("MA","TX","IL","AL"))
#' avg_col_multiple_states("MA")
#'

avg_col_multiple_states <- function(states) {
  # each state is passed to the `net_salary_avg_col_difference()` function and iterated using map()
  state_rows <- map(states, net_salary_avg_col_difference)
  # separate tibbles are combined into one
  state_rows <- bind_rows(state_rows)
  return(state_rows)
}
