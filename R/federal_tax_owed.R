# Define global variables
#'
#' @import utils
globalVariables(c("min_income", "max_income", "fed_tax_rate", "us_federal_tax_rate"))

#' Function to calculate the federal tax owed by an individual based on their gross income
#'
#' A function that calculates the amount of federal tax owed by an individual earning
#' minimum wage based on federal income tax brackets, given a state as input.
#'
#' @import dplyr
#' @import purrr
#' @importFrom magrittr %>%
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of the state, minimum wage, gross salary calculation
#' earning minimum wage, and the federal tax owed based on income
#'
#' @export
#'
#' @examples
#' federal_tax_owed("TX")
#' federal_tax_owed("MA")
#'

federal_tax_owed <- function(input_state) {
  if (!(input_state %in% us_minimum_wage$state_abbr)) {
    stop("Please enter valid state abbreviations and check that the letters are capitalized.")
  }

  state_row <- gross_salary(input_state)
  # subset the gross_salary column to perform calculations
  state_gross_salary <- state_row$gross_salary
  # series of if statements to match the state's gross salary to the correct income tax bracket
  # example: the first tax bracket is between 0 and 10275 and 10% is taxable income
  if (state_gross_salary >= us_federal_tax_rate$min_income[1] & state_gross_salary <= us_federal_tax_rate$max_income[1]) {
    state_row <- state_row %>%
      # calculate the federal tax owed by multiplying gross salary by the tax rate (and add any baseline numbers if necessary)
      mutate(federal_tax_owed = as.double(format(round(state_gross_salary * (us_federal_tax_rate$fed_tax_rate[1] / 100), 2), nsmall = 2)))
  } else if (state_gross_salary >= us_federal_tax_rate$min_income[2] & state_gross_salary <= us_federal_tax_rate$max_income[2]) {
    state_row <- state_row %>%
      mutate(federal_tax_owed = as.double(format(round((state_gross_salary - 10275) * (us_federal_tax_rate$fed_tax_rate[2] / 100) + 1027.50, 2), nsmall = 2)))
  } else if (state_gross_salary >= us_federal_tax_rate$min_income[3] & state_gross_salary <= us_federal_tax_rate$max_income[3]) {
    state_row <- state_row %>%
      mutate(federal_tax_owed = as.double(format(round((state_gross_salary - 41775) * (us_federal_tax_rate$fed_tax_rate[3] / 100) + 4807.50, 2), nsmall = 2)))
  } else if (state_gross_salary >= us_federal_tax_rate$min_income[4] & state_gross_salary <= us_federal_tax_rate$max_income[4]) {
    state_row <- state_row %>%
      mutate(federal_tax_owed = as.double(format(round((state_gross_salary - 89075) * (us_federal_tax_rate$fed_tax_rate[4] / 100) + 15213.50, 2), nsmall = 2)))
  } else if (state_gross_salary >= us_federal_tax_rate$min_income[5] & state_gross_salary <= us_federal_tax_rate$max_income[5]) {
    state_row <- state_row %>%
      mutate(federal_tax_owed = as.double(format(round((state_gross_salary - 170050) * (us_federal_tax_rate$fed_tax_rate[5] / 100) + 34647.50, 2), nsmall = 2)))
  } else if (state_gross_salary >= us_federal_tax_rate$min_income[6] & state_gross_salary <= us_federal_tax_rate$max_income[6]) {
    state_row <- state_row %>%
      mutate(federal_tax_owed = as.double(format(round((state_gross_salary - 215950) * (us_federal_tax_rate$fed_tax_rate[6] / 100) + 49335.50, 2), nsmall = 2)))
  } else { # also means state_gross_salary >= us_federal_tax_rate$min_income[7]
    state_row <- state_row %>%
      mutate(federal_tax_owed = as.double(format(round((state_gross_salary - 539900) * (us_federal_tax_rate$fed_tax_rate[7] / 100) + 162718, 2), nsmall = 2)))
  }

  return(state_row)
}
