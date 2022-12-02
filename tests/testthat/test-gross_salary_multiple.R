test_that("Testing gross_salary(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640))
  actual <- as.data.frame(gross_salary("MA"))
  # We suspect that the "spec" and "problems" attributes are generated during
  # the CSV import, so for now we are attempting to set these attributes to NULL
  # to avoid errors (the actual and expected data frames look exactly the same though)
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing federal_tax_owed(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.2999999999997))
  actual <- as.data.frame(federal_tax_owed("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing state_local_tax_owed(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.2999999999997),
                         state_local_tax_owed=(1852.5))
  actual <- as.data.frame(state_local_tax_owed("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that ("Testing net_salary(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.2999999999997),
                         state_local_tax_owed=(1852.5),
                         total_tax_owed=(5203.7999999999993),
                         net_salary=(24436.2))
  actual <- as.data.frame(net_salary("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

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

test_that ("Testing avg_col_multiple_states(c(\"MA\", \"TX\", \"IL\", \"AL\"))", {
  expected <- data.frame(state=c("Massachusetts", "Texas", "Illinois", "Alabama"),
                         state_abbr=c("MA", "TX", "IL", "AL"),
                         minimum_wage=c(14.25, 7.25, 12.00, 7.25),
                         gross_salary=c(29640, 15080, 24960, 15080),
                         federal_tax_owed=c(3351.2999999999997, 1604.1, 2789.7, 1604.1),
                         state_local_tax_owed=c(1852.5, 1235.052, 2181.5040000000004, 1378.3120000000001),
                         total_tax_owed=c(5203.7999999999993, 2839.152, 4971.204, 2982.4120000000003),
                         net_salary=c(24436.20, 12240.848, 19988.796000000002, 12097.588),
                         net_salary_avg_col_difference=c(-12332.8, -17002.152000000002, -10528.203999999998, -14602.412))
  actual <- as.data.frame(avg_col_multiple_states(c("MA", "TX", "IL", "AL")))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that ("Testing avg_col_multiple_states(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.2999999999997),
                         state_local_tax_owed=(1852.5),
                         total_tax_owed=(5203.7999999999993),
                         net_salary=(24436.20),
                         net_salary_avg_col_difference=(-12332.8))
  actual <- as.data.frame(avg_col_multiple_states("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

