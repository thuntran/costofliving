# Define global variables
#'
#' @import utils
globalVariables(c("avg_col_multiple_states", "net_salary_avg_col_difference", "state_abbr"))
#' Function that plots the difference in average cost of living and net salary
#'
#' A function that plots the difference in average cost of living and net salary
#' of a single person earning minimum wage at one or more states, given a vector of states as input.
#'
#'
#' @import dplyr
#' @importFrom magrittr %>%
#' @import ggplot2
#'
#' @param input A list of states
#'
#' @return A scatter plot of the difference in average cost of living
#' for one or multiple states
#'
#' @export
#'
#' @examples
#' avg_col_multiple_states_plot(c("MA","TX","IL","AL"))
#' avg_col_multiple_states_plot("MA")
#'
avg_col_multiple_states_plot <- function(input) {
  table <- avg_col_multiple_states(input)
  table <- table %>%
    arrange(net_salary_avg_col_difference)
  table$state_abbr <- factor(table$state_abbr, levels = table$state_abbr)
  plot <- ggplot(table, aes(x=net_salary_avg_col_difference, y=state_abbr)) +
    geom_point(color = 4) +
    theme(legend.position="none") +
    labs(title = "Difference in Average Cost of Living and Minimum Wage Net Salaries Across States", x = "Difference in Average Cost of Living and Minimum Wage Net Salaries", y = "States")
  return(plot)
}
