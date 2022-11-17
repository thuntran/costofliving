
<!-- README.md is generated from README.Rmd. Please edit that file -->

# costofliving

<!-- badges: start -->
<!-- badges: end -->

## Purpose

The goal of costofliving is to provide functions and data sets to
calculate the average cost of living to a single person making minimum
wage salaries in different states in the US in 2022.

## Target Audience

This package targets any working individuals in the US who would like to
learn more about whether they find a state livable if they earn minimum
wage in that state.

## Installation

You can install the development version of costofliving from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("thuntran/costofliving")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(costofliving)
## basic example code
```

Loading the `us_cost_of_living` data set:

``` r
summary(us_cost_of_living)
#>     state            stateTaxRate   avgLocalTaxRate    combinedRate  
#>  Length:50          Min.   :0.000   Min.   :-0.0300   Min.   :0.000  
#>  Class :character   1st Qu.:4.463   1st Qu.: 0.0075   1st Qu.:6.008  
#>  Mode  :character   Median :5.975   Median : 1.1700   Median :6.955  
#>                     Mean   :5.085   Mean   : 1.4450   Mean   :6.530  
#>                     3rd Qu.:6.250   3rd Qu.: 2.4075   3rd Qu.:8.137  
#>                     Max.   :7.250   Max.   : 5.1400   Max.   :9.470  
#>  federalTaxRate   costIndex      groceryCost     housingCost   
#>  Min.   :12     Min.   : 83.3   Min.   : 90.1   Min.   : 66.3  
#>  1st Qu.:12     1st Qu.: 91.3   1st Qu.: 95.6   1st Qu.: 80.0  
#>  Median :12     Median : 99.5   Median : 99.5   Median : 96.7  
#>  Mean   :12     Mean   :104.6   Mean   :102.7   Mean   :109.6  
#>  3rd Qu.:12     3rd Qu.:111.2   3rd Qu.:107.2   3rd Qu.:118.7  
#>  Max.   :12     Max.   :193.3   Max.   :152.9   Max.   :315.0  
#>  utilitiesCost    transportationCost    miscCost       minimumWage    
#>  Min.   : 82.30   Min.   : 86.7      Min.   : 90.30   Min.   : 7.250  
#>  1st Qu.: 90.83   1st Qu.: 94.9      1st Qu.: 96.62   1st Qu.: 7.250  
#>  Median : 96.60   Median : 99.7      Median : 99.45   Median : 9.910  
#>  Mean   :101.28   Mean   :102.8      Mean   :102.51   Mean   : 9.885  
#>  3rd Qu.:104.78   3rd Qu.:108.4      3rd Qu.:108.30   3rd Qu.:12.188  
#>  Max.   :164.20   Max.   :133.7      Max.   :126.70   Max.   :15.000
```

# Contributors

-   [Thu Tran](https://github.com/thuntran)
-   [Nina Hernandez](http://github.com/nhernandez3)
-   [My My Tran](http://github.com/puppehmama)
