test_that("Testing federal_tax_owed(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3))
  actual <- as.data.frame(federal_tax_owed("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing federal_tax_owed(\"AM\")", {
  expected_error_message <- "Please enter valid state abbreviations and check that the letters are capitalized."
  expect_error(federal_tax_owed("AM"), expected_error_message)
})

test_that("Testing federal_tax_owed(38393)", {
  expected_error_message <- "Please enter valid state abbreviations and check that the letters are capitalized."
  expect_error(federal_tax_owed(38393), expected_error_message)
})

test_that("Testing federal_tax_owed(\"MA\") output dimensions", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3))
  actual <- as.data.frame(federal_tax_owed("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(dim(actual), dim(expected))
})


test_that("Testing whether columns names are correct in federal_tax_owed(\"MA\")", {
  expected <- c("state","state_abbr", "minimum_wage", "gross_salary","federal_tax_owed")
  actual <- names(federal_tax_owed("MA"))
  expect_identical(actual, expected)
})

