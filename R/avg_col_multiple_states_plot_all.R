# Define global variables
#'
#' @import utils
globalVariables(c("avg_col_multiple_states", "net_salary_avg_col_difference", "state_abbr"))
#' Function that plots the difference in average cost of living and net salary across all states
#'
#' A function that plots the difference in average cost of living and net salary
#' of a single person earning minimum wage across all states in the USA.
#'
#'
#' @import dplyr
#' @importFrom magrittr %>%
#' @import ggplot2
#'
#'
#' @return A scatter plot of the difference in average cost of living
#' for all states
#'
#' @export
#'
#' @examples
#' avg_col_multiple_states_plot_all()
#'
avg_col_multiple_states_plot_all <- function() {
  table <- avg_col_multiple_states((c("AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI",
                                      "ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI",
                                      "MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC",
                                      "ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT",
                                      "VT","VA","WA","WV","WI","WY")))
  table <- table %>%
    arrange(net_salary_avg_col_difference)
  table$state_abbr <- factor(table$state_abbr, levels=table$state_abbr)
  plot <- ggplot(table, aes(x=net_salary_avg_col_difference, y=factor(state_abbr))) +
    geom_point(color=4, size=2) +
    theme(legend.position="none") +
    labs(title="Difference in Average Cost of Living and Minimum Wage Net Salaries Across States",
         x="Difference in Average Cost of Living and Minimum Wage Net Salaries (Dollars)", y="States") +
    theme(plot.title = element_text(size=12))
  return(plot)
}
