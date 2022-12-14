% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process_datasets.R
\docType{data}
\name{us_federal_tax_rate}
\alias{us_federal_tax_rate}
\title{US federal income tax rates data set}
\format{
\subsection{\code{us_federal_tax_rate}}{

A data frame with 7 rows representing 7 tax brackets and 4 columns
\describe{
\item{fed_tax_rate}{Federal tax rate, in percent}
\item{min_income}{Minimum income threshold for a tax rate}
\item{max_income}{Maximum income threshold for a tax rate}
\item{fed_tax_info}{Additional information regarding the tax owed for each bracket}
}
}
}
\source{
Download from
\url{https://www.nerdwallet.com/article/taxes/federal-income-tax-brackets}
}
\usage{
us_federal_tax_rate
}
\description{
A data set that contains information about US tax brackets and federal income
tax rates for a single filer.
}
\keyword{datasets}
