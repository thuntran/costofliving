#' US cost of living data set
#'
#' A data set that contains information related to cost of living in the US,
#' broken down into different categories.
#'
#' @format ## `us_cost_of_living`
#' A data frame with 50 rows representing 50 states and 9 columns
#' \describe{
#' \item{state}{State name}
#' \item{state_abbr}{State name abbreviation}
#' \item{grocery_cost}{State's average grocery cost}
#' \item{medical_cost}{State's average medical cost}
#' \item{housing_cost}{State's average housing cost}
#' \item{transportation_cost}{State's average transportation cost}
#' \item{civic_cost}{State's average civic cost}
#' \item{other_cost}{State's average miscellaneous/other cost}
#' \item{total_avg_cost}{State's total average cost of living}
#' }
#'
#' @source Download from
#'   <https://livingwage.mit.edu/>
#'
#' @docType data
"us_cost_of_living"


#' US federal income tax rates data set
#'
#' A data set that contains information about US tax brackets and federal income
#' tax rates for a single filer.
#'
#' @format ## `us_federal_tax_rate`
#' A data frame with 7 rows representing 7 tax brackets and 4 columns
#' \describe{
#' \item{fed_tax_rate}{Federal tax rate, in percent}
#' \item{min_income}{Minimum income threshold for a tax rate}
#' \item{max_income}{Maximum income threshold for a tax rate}
#' \item{fed_tax_info}{Additional information regarding the tax owed for each bracket}
#' }
#'
#' @source Download from
#'   <https://www.nerdwallet.com/article/taxes/federal-income-tax-brackets>
#'
#' @docType data
"us_federal_tax_rate"

#' US state and average local tax rate data set
#'
#' A data set that contains information related to US state and average local tax rate data set.
#'
#' @format ## `us_state_local_tax_rate`
#' A data frame with 50 rows representing 50 states and 5 columns
#' \describe{
#' \item{state}{State name}
#' \item{state_abbr}{State name abbreviation}
#' \item{state_tax_rate}{State's tax rate, in percent}
#' \item{avg_local_tax_rate}{State's average local tax rate, in percent}
#' \item{combined_tax_rate}{State's combined state and local tax rate, in percent}
#' }
#'
#' @source Download from
#'   <https://worldpopulationreview.com/state-rankings/sales-tax-by-state>.
#'
#' @docType data
"us_state_local_tax_rate"

#' US minimum wage data set
#'
#' A data set that contains information related to minimum wage rates in the US.
#'
#' @format ## `us_minimum_wage`
#' A data frame with 50 rows representing 50 states and 3 columns
#' \describe{
#' \item{state}{State name}
#' \item{state_abbr}{State name abbreviation}
#' \item{minimum_wage}{State's minimum wage (hourly rate)}
#' }
#'
#' @source Download from
#'   <https://www.laborlawcenter.com/state-minimum-wage-rates>.
#'
#' @docType data
"us_minimum_wage"

