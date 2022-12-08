test_that("Testing net_salary_avg_col_difference(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3),
                         state_local_tax_owed=(1852.5),
                         total_tax_owed=(5203.8),
                         net_salary=(24436.2),
                         net_salary_avg_col_difference=(-12332.8))
  actual <- as.data.frame(net_salary_avg_col_difference("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing net_salary_avg_col_difference(\"tx\")", {
  expected <- print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  actual <- net_salary_avg_col_difference("tx")

  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing net_salary_avg_col_difference(\"MA\" dimensions)", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3),
                         state_local_tax_owed=(1852.5),
                         total_tax_owed=(5203.8),
                         net_salary=(24436.2),
                         net_salary_avg_col_difference=(-12332.8))
  actual <- as.data.frame(net_salary_avg_col_difference("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_true(all_equal(actual,expected))
})


testthat::test_that("Testing the number of columns in the net_salary_avg_col_differencedf output is correct)", {
  expect_equal(ncol(net_salary_avg_col_difference("MA")), 9)
})

test_that("Testing the number of rows in the net_salary_avg_col_difference df output)", {
  expect_equal(nrow(net_salary_avg_col_difference("MA")), 1)
})
