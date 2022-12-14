# Define global variables
#'
#' @import utils
globalVariables(c("us_cost_of_living", "state_abbr", "state", "total_avg_cost",
                  "t.avg_col_breakdown.", "living_cost", "", "category", "cost",
                  "cost_pct", "csum", "pos"))
#' Function that plots the average living costs per state
#'
#' A function that plots the average cost of living for a single person earning
#' minimum wage at one state, given a state as input.
#'
#'
#' @import dplyr
#' @importFrom magrittr %>%
#' @import ggplot2
#' @import tidyr
#' @import ggrepel
#' @import forcats
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

  # Convert df from wide to long format
  table <- avg_col_breakdown %>%
    pivot_longer(
      everything(),
      names_to = "category",
      values_to = "cost"
    ) %>%
    mutate(cost_pct = round((cost / sum(cost)) * 100, digits = 2))

  # Create a position table based on percentage for labeling
  pct_pos_table <- table %>%
    mutate(csum = rev(cumsum(rev(cost_pct))),
           pos = cost_pct/2 + lead(csum, 1),
           pos = if_else(is.na(pos), cost_pct/2, pos))

  # Create a plot title
  full_state_name <- us_cost_of_living %>%
    filter(input_state==state_abbr) %>%
    select(state)
  plot_title <- paste("Average cost of living breakdown in", full_state_name, "in 2022")

  plot <- ggplot(table, aes(x="", y=cost_pct, fill=fct_inorder(category))) +
    geom_col(width = 1, col = 1) +
    coord_polar(theta = "y") +
    scale_fill_brewer(palette="Pastel2") +

    geom_label_repel(data = pct_pos_table,
                     aes(y = pos, label = paste("$", cost, "\n(", cost_pct, "%)", sep="")),
                     size = 3.5, nudge_x = 1, show.legend = FALSE) +
    labs(title = plot_title) +
    guides(fill = guide_legend(title = "Type of Living Cost")) +
    theme_void()

    # Add a plus sign at the end of the previous line if you want to de-comment this
    # geom_text(aes(label = cost),
    #           position = position_stack(vjust = 0.5), color = "black")
  return(plot)

}
