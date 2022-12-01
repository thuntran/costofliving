
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
#> # A tibble: 50 × 8
#>    state       state_abbr cost_index grocery_c…¹ housi…² utili…³ trans…⁴ misc_…⁵
#>    <chr>       <chr>           <dbl>       <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#>  1 Alabama     AL               87.9        98.2    70.1   101.     92.7    94.1
#>  2 Alaska      AK              127.        134.    127.    155.    110.    114. 
#>  3 Arizona     AZ              103.        102.    108.    105.     98.8    99.7
#>  4 Arkansas    AR               90.9        93.1    79.1    92.3    92.3    97.4
#>  5 California  CA              142.        114.    202.    124.    132.    111. 
#>  6 Colorado    CO              105.         98.1   116.     88.4   106.    107. 
#>  7 Connecticut CT              122.        106.    135.    132.    111.    114. 
#>  8 Delaware    DE              108.        114     103.     96.5   113     114. 
#>  9 Florida     FL              100.        106.     99     105.     98.8    98.4
#> 10 Georgia     GA               88.8        95.9    74.4    90.5    92.6    96.6
#> # … with 40 more rows, and abbreviated variable names ¹​grocery_cost_index,
#> #   ²​housing_cost_index, ³​utilities_cost_index, ⁴​transportation_cost_index,
#> #   ⁵​misc_cost_index
```

Loading the `us_minimum_wage` data set:

``` r
us_minimum_wage
#> # A tibble: 50 × 3
#>    state       state_abbr minimum_wage
#>    <chr>       <chr>             <dbl>
#>  1 Alabama     AL                 7.25
#>  2 Alaska      AK                10.3 
#>  3 Arizona     AZ                12.8 
#>  4 Arkansas    AR                11   
#>  5 California  CA                15   
#>  6 Colorado    CO                12.6 
#>  7 Connecticut CT                14   
#>  8 Delaware    DE                10.5 
#>  9 Florida     FL                10   
#> 10 Georgia     GA                 7.25
#> # … with 40 more rows
```

Loading the `us_federal_tax_rate` data set:

``` r
us_federal_tax_rate
#> # A tibble: 7 × 4
#>   fed_tax_rate min_income max_income fed_tax_info                               
#>          <dbl>      <dbl>      <dbl> <chr>                                      
#> 1         0.1           0    1.03e 4 10% of taxable income                      
#> 2         0.12      10276    4.18e 4 1027.50 plus 12% of the amount over 10275  
#> 3         0.22      41776    8.91e 4 4807.50 plus 22% of the amount over 41775  
#> 4         0.24      89076    1.70e 5 15213.50 plus 24% of the amount over 89075 
#> 5         0.32     170051    2.16e 5 34647.50 plus 32% of the amount over 170050
#> 6         0.35     215951    5.40e 5 49335.50 plus 35% of the amount over 215950
#> 7         0.37     539901    1   e13 162718 plus 37% of the amount over 539900
```

Loading the `us_state_local_tax_rate` data set:

``` r
us_state_local_tax_rate
#> # A tibble: 50 × 5
#>    state       state_abbr state_tax_rate avg_local_tax_rate combined_tax_rate
#>    <chr>       <chr>               <dbl>              <dbl>             <dbl>
#>  1 Alabama     AL                   4                  5.14              9.14
#>  2 Alaska      AK                   0                  1.43              1.43
#>  3 Arizona     AZ                   5.6                2.77              8.37
#>  4 Arkansas    AR                   6.5                2.93              9.43
#>  5 California  CA                   7.25               1.31              8.56
#>  6 Colorado    CO                   2.9                4.73              7.63
#>  7 Connecticut CT                   6.35               0                 6.35
#>  8 Delaware    DE                   0                  0                 0   
#>  9 Florida     FL                   6                  1.05              7.05
#> 10 Georgia     GA                   4                  3.29              7.29
#> # … with 40 more rows
```

`gross_salary()` is used as a helper function that calculates the annual
gross salary of a single person earning minimum wage. It is mainly to
aid the functionality of other functions:

``` r
gross_salary("CA")
#> # A tibble: 1 × 4
#>   state      state_abbr minimum_wage gross_salary
#>   <chr>      <chr>             <dbl>        <dbl>
#> 1 California CA                   15        31200
```

This is an example of how to calculate the annual gross salary of a
single person earning minimum wage in a specific state/a few different
states:

``` r
gross_salary_multiple("MA")
#> # A tibble: 1 × 4
#>   state         state_abbr minimum_wage gross_salary
#>   <chr>         <chr>             <dbl>        <dbl>
#> 1 Massachusetts MA                 14.2        29640
```

``` r
gross_salary_multiple(c("MA","TX","IL","AL"))
#> # A tibble: 4 × 4
#>   state         state_abbr minimum_wage gross_salary
#>   <chr>         <chr>             <dbl>        <dbl>
#> 1 Massachusetts MA                14.2         29640
#> 2 Texas         TX                 7.25        15080
#> 3 Illinois      IL                12           24960
#> 4 Alabama       AL                 7.25        15080
```

This is an example of how to calculate the amount of federal tax owed by
a single person earning minimum wage in a specific state:

``` r
federal_tax_owed("TN")
#> # A tibble: 1 × 5
#>   state     state_abbr minimum_wage gross_salary federal_tax_owed
#>   <chr>     <chr>             <dbl>        <dbl>            <dbl>
#> 1 Tennessee TN                 7.25        15080            1604.
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
