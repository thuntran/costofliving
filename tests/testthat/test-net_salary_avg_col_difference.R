test_that ("Testing net_salary_avg_col_difference(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.2999999999997),
                         state_local_tax_owed=(1852.5),
                         total_tax_owed=(5203.7999999999993),
                         net_salary=(24436.2),
                         net_salary_avg_col_difference=(-12332.8))
  actual <- as.data.frame(net_salary_avg_col_difference("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})
