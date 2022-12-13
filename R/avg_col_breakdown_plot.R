# Define global variables
#'
#' @import utils
globalVariables(c("us_cost_of_living", "state_abbr", "state", "total_avg_cost",
                  "t.avg_col_breakdown.", "living_cost", ""))
#' Function that plots the average living costs per state
#'
#' A function that plots the average cost of living for a single person earning
#' minimum wage at one state, given a state as input.
#'
#'
#' @import dplyr
#' @importFrom magrittr %>%
#' @import ggplot2
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A pie chart of the average living costs for a single person
#' earning minimum wage for one state
#'
#' @export
#'
#' @examples
#' avg_col_breakdown_plot("MA")
#'
avg_col_breakdown_plot <- function(input_state) {
  if (!(input_state %in% us_cost_of_living$state_abbr)) {
    stop("Please enter valid state abbreviations and check that the letters are capitalized.")
  }

  avg_col_breakdown <- us_cost_of_living %>%
    filter(input_state==state_abbr)  %>%
    subset(select=-c(state, state_abbr, total_avg_cost))
  table <- data.frame(t(avg_col_breakdown))
  table$living_cost <- row.names(table)
  rownames(table) <- NULL

  # idea in progress: create a new column calculating corresponding percentages
  # table$percentage <- round(100*t.avg_col_breakdown./sum(t.avg_col_breakdown./2))

  # View(table)

  plot <- ggplot(table, aes(x="", y=t.avg_col_breakdown., fill=living_cost)) +
    geom_bar(width = 1, stat = "identity") +
    coord_polar("y", start=0) +
    theme_void() +
    scale_fill_brewer("Blues") +
    guides(fill = guide_legend(title = "Type of Living Cost")) +
    labs(title = "Average cost of living breakdown per state", subtitle = input_state) +
    geom_text(aes(label = t.avg_col_breakdown.),
              position = position_stack(vjust = 0.5), color = "black") +

  ## second idea for percentages

    # would have to import the scales package to use the percent() function

    # geom_text(aes(y = t.avg_col_breakdown./6 + c(0, cumsum(t.avg_col_breakdown.)[-length(t.avg_col_breakdown.)]),
    #               label = percent(t.avg_col_breakdown./100)), size=3.5)
  return(plot)

}
