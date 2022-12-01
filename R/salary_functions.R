# Define global variables
#'
#' @import utils
globalVariables(c("minimum_wage", "state_abbr", "us_minimum_wage"))

#' Function to calculate gross salary of one state
#'
#' A function that calculates the annual gross salary of a single person earning
#' minimum wage at a specific state, given a state as input.
#' `gross_salary` is an added column to the existing `us_minimum_wage` data set.
#' This serves as a helper function to the following `avg_col_multiple_states()`
#' function.
#'
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of the state, minimum wage, and gross salary calculation
#' earning minimum wage
#'
#' @export
#'
#' @examples
#' gross_salary("MA")
#' gross_salary("TX")
#'

gross_salary <- function(input_state) {
  # checks if user inputs a valid state abbreviation
  if (input_state %in% us_minimum_wage$state_abbr) {
    us_cost_of_living_gross_salary <- us_minimum_wage %>%
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
  # checks if user inputs a valid state abbreviation
  if (input_state %in% us_minimum_wage$state_abbr) {
  # the user's input is passed through the `gross_salary()` function
  # the output is saved to state_row
  state_row <- gross_salary(input_state)
    # subset the gross_salary column to perform calculations
    state_gross_salary <- state_row$gross_salary
    # series of if statements to match the state's gross salary to the correct income tax bracket
    # example: the first tax bracket is between 0 and 10275 and 10% is taxable income
    if (state_gross_salary >= us_federal_tax_rate$min_income[1] & state_gross_salary <= us_federal_tax_rate$max_income[1]) {
      state_row <- state_row %>%
        # calculate the federal tax owed by multiplying gross salary by the tax rate (and add any baseline numbers if necessary)
        mutate(federal_tax_owed = state_gross_salary * (us_federal_tax_rate$fed_tax_rate[1] / 100))
    } else if (state_gross_salary >= us_federal_tax_rate$min_income[2] & state_gross_salary <= us_federal_tax_rate$max_income[2]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 10275) * (us_federal_tax_rate$fed_tax_rate[2] / 100) + 1027.50)
    } else if (state_gross_salary >= us_federal_tax_rate$min_income[3] & state_gross_salary <= us_federal_tax_rate$max_income[3]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 41775) * (us_federal_tax_rate$fed_tax_rate[3] / 100) + 4807.50)
    } else if (state_gross_salary >= us_federal_tax_rate$min_income[4] & state_gross_salary <= us_federal_tax_rate$max_income[4]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 89075) * (us_federal_tax_rate$fed_tax_rate[4] / 100) + 15213.50)
    } else if (state_gross_salary >= us_federal_tax_rate$min_income[5] & state_gross_salary <= us_federal_tax_rate$max_income[5]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 170050) * (us_federal_tax_rate$fed_tax_rate[5] / 100) + 34647.50)
    } else if (state_gross_salary >= us_federal_tax_rate$min_income[6] & state_gross_salary <= us_federal_tax_rate$max_income[6]) {
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 215950) * (us_federal_tax_rate$fed_tax_rate[6] / 100) + 49335.50)
    } else { # also means state_gross_salary >= us_federal_tax_rate$min_income[7]
      state_row <- state_row %>%
        mutate(federal_tax_owed = (state_gross_salary - 539900) * (us_federal_tax_rate$fed_tax_rate[7] / 100) + 162718)
    }
    return(state_row)
  }
  else {
    # throws an error if user does not input a valid state
    print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  }
}

# Define global variables
#'
#' @import utils
globalVariables(c("us_minimum_wage", "federal_tax_owed" , "us_state_local_tax_rate", "state_local_tax_owed"))

#' Function to calculate the state and local tax owed by an individual based on their gross income
#'
#' A function that calculates the amount of state and local tax owed by an individual earning
#' minimum wage, given a state as input.
#'
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @param input_state A state name, abbreviated (e.g. MA)
#'
#' @return A tibble of the state, minimum wage, gross salary calculation
#' earning minimum wage, federal tax owed based on income, and state and local tax owed
#' based on income
#'
#'
#' @export
#'
#' @examples
#' state_local_tax_owed("TX")
#' state_local_tax_owed("MA")
#'
state_local_tax_owed <- function(input_state) {
  # checks if user inputs a valid state abbreviation
  if (input_state %in% us_minimum_wage$state_abbr) {
    # the user's input is passed through the `federal_tax_owed()` function
    # the output is saved to state_row
  state_row <- federal_tax_owed(input_state)
  us_state_local_tax_rate <- us_state_local_tax_rate %>%
    # filter by state from user input
    filter(state_abbr==input_state)
  state_row <- state_row %>%
    # state and local tax are calculated by multiplying the combined rate by the gross salary
    mutate(state_local_tax_owed = (us_state_local_tax_rate$combined_tax_rate / 100) * gross_salary)
  return(state_row)
  } else {
    # throws an error if user does not input a valid state
    print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  }
}

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
