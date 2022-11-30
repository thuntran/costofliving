# Define global variables
#'
#' @import utils
globalVariables(c("minimum_wage", "state_abbr", "us_cost_of_living"))

#' Function to calculate gross salary of one state
#'
#' A function that calculates the annual gross salary of a single person earning
#' minimum wage at a specific state, given a state as input.
#' `gross_salary` is an added column to the existing `us_cost_of_living` data set.
#' This serves as a helper function to the following `gross_salary_multiple()`
#' function.
#'
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of taxes, average living costs, minimum wage, and gross
#' salaries earning minimum wage per state
#'
#' @export
#'
#' @examples
#' gross_salary("MA")
#' gross_salary("TX")
#'

gross_salary <- function(input_state) {
  # checks if user inputs a valid state abbreviation
  if (input_state %in% us_cost_of_living$state_abbr) {
    us_cost_of_living_gross_salary <- us_cost_of_living %>%
      # filter by state from user input
      filter(state_abbr==input_state) %>%
      # gross salary is calculated by working minimum wage 40 hours a week
      # and 52 weeks in a year
      mutate(gross_salary = minimum_wage * 40 * 52)
    return(us_cost_of_living_gross_salary)
  } else {
    # throws an error if user does not input a valid state
    print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  }
}


#' Function to calculate gross salaries across multiple states
#'
#' A function that calculates the annual gross salary of a single person earning
#' minimum wage at one or more states, given a vector of states as input.
#'
#'
#' @import dplyr
#' @import purrr
#'
#' @param states A list of states
#'
#' @return A tibble of taxes, average living costs, minimum wage, and gross
#' salaries earning minimum wage per state
#'
#' @export
#'
#' @examples
#' gross_salary_multiple(c("MA","TX","IL","AL"))
#' gross_salary_multiple("MA")
#'

gross_salary_multiple <- function(states) {
  # each state is passed to the `gross_salary()` function to calculate gross salary
  # and iterated using map()
  state_rows <- map(states, gross_salary)
  # separate tibbles are combined into one
  state_rows <- bind_rows(state_rows)
  return(state_rows)
}

# Define global variables
#'
#' @import utils
globalVariables(c("min_income", "max_income", "us_taxable_income"))

#' Function to calculate tax owed by an individual based on their gross income
#'
#' A function that calculates the amount of federal tax owed by an individual earning
#' minimum wage at a specific state, given a state as input.
#'
#' @import dplyr
#' @import purrr
#' @importFrom magrittr %>%
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of taxes, average living costs, minimum wage, and gross
#' salaries earning minimum wage per state
#'
#' @export
#'
#' @examples
#' federal_tax_owed("TX")
#' federal_tax_owed("MA")
#'

federal_tax_owed <- function(input_state) {
  state_row <- gross_salary(input_state)
  state_gross_salary <- state_row$gross_salary
  if (!is.null(dim(state_row))) {
    if (state_gross_salary >= us_taxable_income$min_income[1] & state_gross_salary <= us_taxable_income$max_income[1]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = state_gross_salary * 0.10)
    } else if (state_gross_salary >= us_taxable_income$min_income[2] & state_gross_salary <= us_taxable_income$max_income[2]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 10275) * 0.12 + 1027.50)
    } else if (state_gross_salary >= us_taxable_income$min_income[3] & state_gross_salary <= us_taxable_income$max_income[3]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 41775) * 0.22 + 4807.50)
    } else if (state_gross_salary >= us_taxable_income$min_income[4] & state_gross_salary <= us_taxable_income$max_income[4]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 89075) * 0.24 + 15213.50)
    } else if (state_gross_salary >= us_taxable_income$min_income[5] & state_gross_salary <= us_taxable_income$max_income[5]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 170050) * 0.32 + 34647.50)
    } else if (state_gross_salary >= us_taxable_income$min_income[6] & state_gross_salary <= us_taxable_income$max_income[6]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 215950) * 0.35 + 49335.50)
    } else { # state_gross_salary >= us_taxable_income$min_income[7]
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 539900) * 0.37 + 162718)
    }
    return(state_row)
  }
  else {
    print("Error")
  }
}


