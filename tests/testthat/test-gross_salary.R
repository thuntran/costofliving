test_that("Testing gross_salary(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640))
  actual <- as.data.frame(gross_salary("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing gross_salary(\"AM\")", {
  expected <- print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  actual <- gross_salary("AM")
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})


test_that("Testing gross_salary(\"MA\" dimensions)", {
  expected <- data.frame(state=("Massachusetts"),
                                       state_abbr=("MA"),
                                       minimum_wage=(14.25),
                                       gross_salary=(29640))
  actual <- gross_salary("MA")
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_true(all_equal(actual,expected))
})


testthat::test_that("number of columns in gross salary df is correct", {
  expect_equal(ncol(gross_salary("MA")), 4)
})

test_that("number of rows in gross salary df is correct", {
  expect_equal(nrow(gross_salary("MA")), 1)
})
