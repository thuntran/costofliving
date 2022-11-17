#' US cost of living data set
#'
#' A data set that contains information related to cost of living in the US
#'
#' @format ## `us_cost_of_living`
#' A data frame with 50 rows representing 50 states and 12 columns
#' \describe{
#' \item{state}{State name}
#' \item{stateTaxRate}{State's tax rate}
#' \item{avgLocalTaxRate}{State's average local tax rate}
#' \item{combinedRate}{State's combined tax rate}
#' \item{costIndex}{State's cost of living index, with the baseline set at 100}
#' \item{groceryCost}{State's grocery cost index, with the baseline set at 100}
#' \item{housingCost}{State's housing cost index, with the baseline set at 100}
#' \item{utilitiesCost}{State's utilities cost index, with the baseline set at 100}
#' \item{transportationCost}{State's transportation cost index, with the baseline set at 100}
#' \item{miscCost}{State's miscellaneous cost index, with the baseline set at 100}
#' \item{minimumWage}{State's hourly minimum wage}
#' }
#'
#' @source Download from
#'   <https://worldpopulationreview.com/state-rankings/cost-of-living-index-by-state>,
#'   <https://worldpopulationreview.com/state-rankings/cost-of-living-index-by-state>, and
#'   <https://www.laborlawcenter.com/state-minimum-wage-rates>.
#'
#' @docType data
"us_cost_of_living"
