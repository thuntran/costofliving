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

test_that("Testing net_salary_avg_col_difference(\"MA\") output dimensions", {
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
  expect_identical(dim(actual), dim(expected))
})


test_that("Testing whether columns names are correct in net_salary_avg_col_difference(\"MA\")", {
  expected <- c("state","state_abbr", "minimum_wage", "gross_salary","federal_tax_owed", "state_local_tax_owed","total_tax_owed", "net_salary", "net_salary_avg_col_difference")
  actual <- names(net_salary_avg_col_difference("MA"))
  expect_identical(actual, expected)
})
