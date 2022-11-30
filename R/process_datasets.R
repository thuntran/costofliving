#' US cost of living data set
#'
#' A data set that contains information related to cost of living in the US.
#'
#' @format ## `us_cost_of_living`
#' A data frame with 50 rows representing 50 states and 12 columns
#' \describe{
#' \item{state}{State name}
#' \item{state_abbr}{State name abbreviation}
#' \item{state_tax_rate}{State's tax rate}
#' \item{avg_local_tax_rate}{State's average local tax rate}
#' \item{combined_tax_rate}{State's combined tax rate}
#' \item{cost_index}{State's cost of living index, with the baseline set at 100}
#' \item{grocery_cost_index}{State's grocery cost index, with the baseline set at 100}
#' \item{housing_cost_index}{State's housing cost index, with the baseline set at 100}
#' \item{utilities_cost_index}{State's utilities cost index, with the baseline set at 100}
#' \item{transportation_cost_index}{State's transportation cost index, with the baseline set at 100}
#' \item{misc_cost_index}{State's miscellaneous cost index, with the baseline set at 100}
#' \item{minimum_wage}{State's minimum wage (hourly rate)}
#' }
#'
#' @source Download from
#'   <https://worldpopulationreview.com/state-rankings/cost-of-living-index-by-state>,
#'   <https://worldpopulationreview.com/state-rankings/cost-of-living-index-by-state>, and
#'   <https://www.laborlawcenter.com/state-minimum-wage-rates>.
#'
#' @docType data
"us_cost_of_living"


#' US federal income tax data set
#'
#' A data set that contains information about US tax brackets and federal income
#' tax rates for a single filer.
#'
#' @format ## `taxable_income`
#' A data frame with 7 rows representing 7 tax brackets and 4 columns
#' \describe{
#' \item{tax_rate}{Federal tax rate}
#' \item{min_income}{Minimum income threshold for a tax rate}
#' \item{max_income}{Maximum income threshold for a tax rate}
#' \item{tax_info}{Additional information regarding the tax owed for each bracket}
#' }
#'
#' @source Download from
#'   <https://www.nerdwallet.com/article/taxes/federal-income-tax-brackets>
#'
#' @docType data
"taxable_income"

