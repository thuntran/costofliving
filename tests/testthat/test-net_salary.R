test_that("Testing net_salary(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3),
                         state_local_tax_owed=(1852.5),
                         total_tax_owed=(5203.8),
                         net_salary=(24436.2))
  actual <- as.data.frame(net_salary("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing net_salary(\"Massachusetts\")", {
  expected <- print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  actual <- net_salary("Massachusetts")

  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing net_salary(\"MA\" dimensions)", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3),
                         state_local_tax_owed=(1852.5),
                         total_tax_owed=(5203.8),
                         net_salary=(24436.2))
  actual <- as.data.frame(net_salary("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_true(all_equal(actual,expected))
})


testthat::test_that("Testing the number of columns in the net_salary df output is correct)", {
  expect_equal(ncol(net_salary("MA")), 8)
})

test_that("Testing the number of rows in the net_salary df output)", {
  expect_equal(nrow(net_salary("MA")), 1)
})
