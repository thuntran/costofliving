test_that("Testing state_local_tax_owed(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         state_local_tax_owed=(1852.5))
  actual <- as.data.frame(state_local_tax_owed("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing state_local_tax_owed(\"Texas\")", {
  expected_error_message <- "Please enter valid state abbreviations and check that the letters are capitalized."
  expect_error(state_local_tax_owed("Texas"), expected_error_message)
})

test_that("Testing state_local_tax_owed(12345)", {
  expected_error_message <- "Please enter valid state abbreviations and check that the letters are capitalized."
  expect_error(state_local_tax_owed(12345), expected_error_message)
})

test_that("Testing state_local_tax_owed(\"MA\") output dimensions", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         state_local_tax_owed=(1852.5))
  actual <- as.data.frame(state_local_tax_owed("MA"))
  actual <- state_local_tax_owed("MA")
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(dim(actual), dim(expected))
})

test_that("Testing whether columns names are correct in state_local_tax_owed(\"MA\")", {
  expected <- c("state","state_abbr", "minimum_wage", "gross_salary", "state_local_tax_owed")
  actual <- names(state_local_tax_owed("MA"))
  expect_identical(actual, expected)
})
