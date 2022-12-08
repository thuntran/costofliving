test_that("Testing state_local_tax_owed(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3),
                         state_local_tax_owed=(1852.5))
  actual <- as.data.frame(state_local_tax_owed("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing state_local_tax_owed(\"Texas\")", {
  expected <- print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  actual <- state_local_tax_owed("Texas")

  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing state_local_tax_owed(\"MA\" dimensions)", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3),
                         state_local_tax_owed=(1852.5))
  actual <- as.data.frame(state_local_tax_owed("MA"))
  actual <- state_local_tax_owed("MA")
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_true(all_equal(actual,expected))
})


testthat::test_that("number of columns in state_local_tax_owed(\"MA\") df output is correct", {
  expect_equal(ncol(state_local_tax_owed("MA")), 6)
})

test_that("number of rows in Astate_local_tax_owed(\"MA\") df output is correct", {
  expect_equal(nrow(state_local_tax_owed("MA")), 1)
})
