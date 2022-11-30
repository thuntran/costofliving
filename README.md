
<!-- README.md is generated from README.Rmd. Please edit that file -->

# costofliving

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/myspotify)](https://CRAN.R-project.org/package=costofliving)
<!-- badges: end -->

## Purpose

The goal of `costofliving` is to provide functions and data sets to
calculate the average cost of living for a single person earning a
minimum wage salary across different states in the United States in
2022. This package also contains data from The World Population Review
and the Missouri Economic Research and Information Center.

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
#>    state state…¹ state…² avg_l…³ combi…⁴ cost_…⁵ groce…⁶ housi…⁷ utili…⁸ trans…⁹
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
#> # … with 40 more rows, 2 more variables: misc_cost_index <dbl>,
#> #   minimum_wage <dbl>, and abbreviated variable names ¹​state_abbr,
#> #   ²​state_tax_rate, ³​avg_local_tax_rate, ⁴​combined_tax_rate, ⁵​cost_index,
#> #   ⁶​grocery_cost_index, ⁷​housing_cost_index, ⁸​utilities_cost_index,
#> #   ⁹​transportation_cost_index
```

Loading the `taxable_income` data set:

``` r
us_taxable_income
#> # A tibble: 7 × 4
#>   tax_rate min_income max_income tax_info                                   
#>      <dbl>      <dbl>      <dbl> <chr>                                      
#> 1     0.1           0    1.03e 4 10% of taxable income                      
#> 2     0.12      10276    4.18e 4 1027.50 plus 12% of the amount over 10275  
#> 3     0.22      41776    8.91e 4 4807.50 plus 22% of the amount over 41775  
#> 4     0.24      89076    1.70e 5 15213.50 plus 24% of the amount over 89075 
#> 5     0.32     170051    2.16e 5 34647.50 plus 32% of the amount over 170050
#> 6     0.35     215951    5.40e 5 49335.50 plus 35% of the amount over 215950
#> 7     0.37     539901    1   e13 162718 plus 37% of the amount over 539900
```

Here is a summary of the `us_cost_of_living` data set:

``` r
summary(us_cost_of_living)
#>     state            state_abbr        state_tax_rate  avg_local_tax_rate
#>  Length:50          Length:50          Min.   :0.000   Min.   :-0.0300   
#>  Class :character   Class :character   1st Qu.:4.463   1st Qu.: 0.0075   
#>  Mode  :character   Mode  :character   Median :5.975   Median : 1.1700   
#>                                        Mean   :5.085   Mean   : 1.4450   
#>                                        3rd Qu.:6.250   3rd Qu.: 2.4075   
#>                                        Max.   :7.250   Max.   : 5.1400   
#>  combined_tax_rate   cost_index    grocery_cost_index housing_cost_index
#>  Min.   :0.000     Min.   : 83.3   Min.   : 90.1      Min.   : 66.3     
#>  1st Qu.:6.008     1st Qu.: 91.3   1st Qu.: 95.6      1st Qu.: 80.0     
#>  Median :6.955     Median : 99.5   Median : 99.5      Median : 96.7     
#>  Mean   :6.530     Mean   :104.6   Mean   :102.7      Mean   :109.6     
#>  3rd Qu.:8.137     3rd Qu.:111.2   3rd Qu.:107.2      3rd Qu.:118.7     
#>  Max.   :9.470     Max.   :193.3   Max.   :152.9      Max.   :315.0     
#>  utilities_cost_index transportation_cost_index misc_cost_index 
#>  Min.   : 82.30       Min.   : 86.7             Min.   : 90.30  
#>  1st Qu.: 90.83       1st Qu.: 94.9             1st Qu.: 96.62  
#>  Median : 96.60       Median : 99.7             Median : 99.45  
#>  Mean   :101.28       Mean   :102.8             Mean   :102.51  
#>  3rd Qu.:104.78       3rd Qu.:108.4             3rd Qu.:108.30  
#>  Max.   :164.20       Max.   :133.7             Max.   :126.70  
#>   minimum_wage   
#>  Min.   : 7.250  
#>  1st Qu.: 7.250  
#>  Median : 9.910  
#>  Mean   : 9.885  
#>  3rd Qu.:12.188  
#>  Max.   :15.000
```

`gross_salary()` is used as a helper function that calculates the annual
gross salary of a single person earning minimum wage. It is mainly to
aid the functionality of other functions:

``` r
gross_salary("CA")
#> # A tibble: 1 × 13
#>   state  state…¹ state…² avg_l…³ combi…⁴ cost_…⁵ groce…⁶ housi…⁷ utili…⁸ trans…⁹
#>   <chr>  <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#> 1 Calif… CA         7.25    1.31    8.56    142.    114.    202.    124.    132.
#> # … with 3 more variables: misc_cost_index <dbl>, minimum_wage <dbl>,
#> #   gross_salary <dbl>, and abbreviated variable names ¹​state_abbr,
#> #   ²​state_tax_rate, ³​avg_local_tax_rate, ⁴​combined_tax_rate, ⁵​cost_index,
#> #   ⁶​grocery_cost_index, ⁷​housing_cost_index, ⁸​utilities_cost_index,
#> #   ⁹​transportation_cost_index
```

This is an example of how to calculate the annual gross salary of a
single person earning minimum wage in a specific state/a few different
states:

``` r
gross_salary_multiple("MA")
#> # A tibble: 1 × 13
#>   state  state…¹ state…² avg_l…³ combi…⁴ cost_…⁵ groce…⁶ housi…⁷ utili…⁸ trans…⁹
#>   <chr>  <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#> 1 Massa… MA         6.25       0    6.25     135    119.    178.    111.    111.
#> # … with 3 more variables: misc_cost_index <dbl>, minimum_wage <dbl>,
#> #   gross_salary <dbl>, and abbreviated variable names ¹​state_abbr,
#> #   ²​state_tax_rate, ³​avg_local_tax_rate, ⁴​combined_tax_rate, ⁵​cost_index,
#> #   ⁶​grocery_cost_index, ⁷​housing_cost_index, ⁸​utilities_cost_index,
#> #   ⁹​transportation_cost_index
```

``` r
gross_salary_multiple(c("MA","TX","IL","AL"))
#> # A tibble: 4 × 13
#>   state  state…¹ state…² avg_l…³ combi…⁴ cost_…⁵ groce…⁶ housi…⁷ utili…⁸ trans…⁹
#>   <chr>  <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#> 1 Massa… MA         6.25    0       6.25   135     119.    178.    111.    111. 
#> 2 Texas  TX         6.25    1.94    8.19    92.1    90.8    83.8   103.     94.1
#> 3 Illin… IL         6.25    2.49    8.74    94.3    98.4    86.6    96.5   106. 
#> 4 Alaba… AL         4       5.14    9.14    87.9    98.2    70.1   101.     92.7
#> # … with 3 more variables: misc_cost_index <dbl>, minimum_wage <dbl>,
#> #   gross_salary <dbl>, and abbreviated variable names ¹​state_abbr,
#> #   ²​state_tax_rate, ³​avg_local_tax_rate, ⁴​combined_tax_rate, ⁵​cost_index,
#> #   ⁶​grocery_cost_index, ⁷​housing_cost_index, ⁸​utilities_cost_index,
#> #   ⁹​transportation_cost_index
```

This is an example of how to calculate the amount of federal tax owed by
a single person earning minimum wage in a specific state:

``` r
federal_tax_owed("TN")
#> # A tibble: 1 × 14
#>   state  state…¹ state…² avg_l…³ combi…⁴ cost_…⁵ groce…⁶ housi…⁷ utili…⁸ trans…⁹
#>   <chr>  <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#> 1 Tenne… TN            7    2.47    9.47      89    94.7    79.3    92.5    88.8
#> # … with 4 more variables: misc_cost_index <dbl>, minimum_wage <dbl>,
#> #   gross_salary <dbl>, federal_tax_owed <dbl>, and abbreviated variable names
#> #   ¹​state_abbr, ²​state_tax_rate, ³​avg_local_tax_rate, ⁴​combined_tax_rate,
#> #   ⁵​cost_index, ⁶​grocery_cost_index, ⁷​housing_cost_index,
#> #   ⁸​utilities_cost_index, ⁹​transportation_cost_index
```

# Phase III Package Proposal

Our R package idea will remain the same, with additional functions and
further development for Phase III. We plan to implement two new
functions:

1)  A net_salary() function that calculates the take-home pay (in 2022)
    for an individual after deducting federal, state, and local taxes
    from gross salaries based on income tax brackets, per state.

2)  An avg_living_cost() function that calculates the difference between
    the net salary and average living cost per state (which includes the
    average cost of groceries, housing, utilities, transportation, and
    miscellaneous items). This is essentially the remaining amount of
    money (if there is) for an individual working minimum wage to
    financially support themselves in 2022.

Besides, we would like to include the following data visualizations:

1)  Scatter plots to view the average living costs and average net
    salaries in multiple states (that the user selects).

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
