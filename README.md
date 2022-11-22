
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
```

Loading the `us_cost_of_living` data set:

``` r
us_cost_of_living
#> # A tibble: 50 × 12
#>    state state…¹ state…² avgLo…³ combi…⁴ costI…⁵ groce…⁶ housi…⁷ utili…⁸ trans…⁹
#>    <chr> <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#>  1 Alab… AL         4       5.14    9.14    87.9    98.2    70.1   101.     92.7
#>  2 Alas… AK         0       1.43    1.43   127.    134.    127.    155.    110. 
#>  3 Ariz… AZ         5.6     2.77    8.37   103.    102.    108.    105.     98.8
#>  4 Arka… AR         6.5     2.93    9.43    90.9    93.1    79.1    92.3    92.3
#>  5 Cali… CA         7.25    1.31    8.56   142.    114.    202.    124.    132. 
#>  6 Colo… CO         2.9     4.73    7.63   105.     98.1   116.     88.4   106. 
#>  7 Conn… CT         6.35    0       6.35   122.    106.    135.    132.    111. 
#>  8 Dela… DE         0       0       0      108.    114     103.     96.5   113  
#>  9 Flor… FL         6       1.05    7.05   100.    106.     99     105.     98.8
#> 10 Geor… GA         4       3.29    7.29    88.8    95.9    74.4    90.5    92.6
#> # … with 40 more rows, 2 more variables: miscCost <dbl>, minimumWage <dbl>, and
#> #   abbreviated variable names ¹​stateAbbr, ²​stateTaxRate, ³​avgLocalTaxRate,
#> #   ⁴​combinedRate, ⁵​costIndex, ⁶​groceryCost, ⁷​housingCost, ⁸​utilitiesCost,
#> #   ⁹​transportationCost
```

Here is a summary of the `us_cost_of_living` data set:

``` r
summary(us_cost_of_living)
#>     state            stateAbbr          stateTaxRate   avgLocalTaxRate  
#>  Length:50          Length:50          Min.   :0.000   Min.   :-0.0300  
#>  Class :character   Class :character   1st Qu.:4.463   1st Qu.: 0.0075  
#>  Mode  :character   Mode  :character   Median :5.975   Median : 1.1700  
#>                                        Mean   :5.085   Mean   : 1.4450  
#>                                        3rd Qu.:6.250   3rd Qu.: 2.4075  
#>                                        Max.   :7.250   Max.   : 5.1400  
#>   combinedRate     costIndex      groceryCost     housingCost   
#>  Min.   :0.000   Min.   : 83.3   Min.   : 90.1   Min.   : 66.3  
#>  1st Qu.:6.008   1st Qu.: 91.3   1st Qu.: 95.6   1st Qu.: 80.0  
#>  Median :6.955   Median : 99.5   Median : 99.5   Median : 96.7  
#>  Mean   :6.530   Mean   :104.6   Mean   :102.7   Mean   :109.6  
#>  3rd Qu.:8.137   3rd Qu.:111.2   3rd Qu.:107.2   3rd Qu.:118.7  
#>  Max.   :9.470   Max.   :193.3   Max.   :152.9   Max.   :315.0  
#>  utilitiesCost    transportationCost    miscCost       minimumWage    
#>  Min.   : 82.30   Min.   : 86.7      Min.   : 90.30   Min.   : 7.250  
#>  1st Qu.: 90.83   1st Qu.: 94.9      1st Qu.: 96.62   1st Qu.: 7.250  
#>  Median : 96.60   Median : 99.7      Median : 99.45   Median : 9.910  
#>  Mean   :101.28   Mean   :102.8      Mean   :102.51   Mean   : 9.885  
#>  3rd Qu.:104.78   3rd Qu.:108.4      3rd Qu.:108.30   3rd Qu.:12.188  
#>  Max.   :164.20   Max.   :133.7      Max.   :126.70   Max.   :15.000
```

This is an example of how to calculate the annual gross salary of a
single person earning minimum wage in a specific state/a few different
states:

``` r
grossSalaryMultiple("MA")
#> # A tibble: 1 × 13
#>   state  state…¹ state…² avgLo…³ combi…⁴ costI…⁵ groce…⁶ housi…⁷ utili…⁸ trans…⁹
#>   <chr>  <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#> 1 Massa… MA         6.25       0    6.25     135    119.    178.    111.    111.
#> # … with 3 more variables: miscCost <dbl>, minimumWage <dbl>,
#> #   grossSalary <dbl>, and abbreviated variable names ¹​stateAbbr,
#> #   ²​stateTaxRate, ³​avgLocalTaxRate, ⁴​combinedRate, ⁵​costIndex, ⁶​groceryCost,
#> #   ⁷​housingCost, ⁸​utilitiesCost, ⁹​transportationCost
```

``` r
grossSalaryMultiple(c("MA","TX","IL","AL"))
#> # A tibble: 4 × 13
#>   state  state…¹ state…² avgLo…³ combi…⁴ costI…⁵ groce…⁶ housi…⁷ utili…⁸ trans…⁹
#>   <chr>  <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#> 1 Massa… MA         6.25    0       6.25   135     119.    178.    111.    111. 
#> 2 Texas  TX         6.25    1.94    8.19    92.1    90.8    83.8   103.     94.1
#> 3 Illin… IL         6.25    2.49    8.74    94.3    98.4    86.6    96.5   106. 
#> 4 Alaba… AL         4       5.14    9.14    87.9    98.2    70.1   101.     92.7
#> # … with 3 more variables: miscCost <dbl>, minimumWage <dbl>,
#> #   grossSalary <dbl>, and abbreviated variable names ¹​stateAbbr,
#> #   ²​stateTaxRate, ³​avgLocalTaxRate, ⁴​combinedRate, ⁵​costIndex, ⁶​groceryCost,
#> #   ⁷​housingCost, ⁸​utilitiesCost, ⁹​transportationCost
```

# Phase III Package Proposal

Our R package idea will remain the same, with additional functions and
further development for Phase III. We plan to implement two new
functions:

1)  A netSalary() function that calculates the take-home pay (in 2022)
    for an individual after deducting federal, state, and local taxes
    from gross salaries based on income tax brackets, per state.

2)  An avgLivingCost() function that calculates the difference between
    the net salary and average living cost per state (which includes the
    average cost of groceries, housing, utilities, transportation, and
    miscellaneous items). This is essentially the remaining amount of
    money (if there is) for an individual working minimum wage to
    financially support themselves in 2022.

Besides, we would like to include the following data visualizations:

1)  Boxplots to view the average living costs and average net salaries
    in multiple states (that the user selects).

2)  An interactive USA map where the user can view the average living
    costs per state using the R leaflet package.

If there is additional time, we would like to calculate the average
living costs per state based on a median household (family of four)
where two parents earn minimum wage.

If our package is published, since we are currently using data from 2022
(minimum wage, average living costs, etc) we would expect to make a
yearly update.

# Contributors

-   [Thu Tran](https://github.com/thuntran)
-   [Nina Hernandez](http://github.com/nhernandez3)
-   [My My Tran](http://github.com/puppehmama)
