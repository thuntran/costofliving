test_that("Testing net_salary(\"MA\")", {
  expected <- data.frame(
    state = ("Massachusetts"),
    state_abbr = ("MA"),
    minimum_wage = (14.25),
    gross_salary = (29640),
    federal_tax_owed = (3351.3),
    state_local_tax_owed = (1852.5),
    total_tax_owed = (5203.8),
    net_salary = (24436.2)
  )
  actual <- as.data.frame(net_salary("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing net_salary(\"Massachusetts\")", {
  expected_error_message <- "Please enter valid state abbreviations and check that the letters are capitalized."
  expect_error(net_salary("Massachusetts"), expected_error_message)
})

test_that("Testing net_salary(12345)", {
  expected_error_message <- "Please enter valid state abbreviations and check that the letters are capitalized."
  expect_error(net_salary(12345), expected_error_message)
})

test_that("Testing net_salary(\"MA\") output dimensions", {
  expected <- data.frame(
    state = ("Massachusetts"),
    state_abbr = ("MA"),
    minimum_wage = (14.25),
    gross_salary = (29640),
    federal_tax_owed = (3351.3),
    state_local_tax_owed = (1852.5),
    total_tax_owed = (5203.8),
    net_salary = (24436.2)
  )
  actual <- as.data.frame(net_salary("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(dim(actual), dim(expected))
})

test_that("Testing whether columns names are correct in net_salary(\"MA\")", {
  expected <- c("state", "state_abbr", "minimum_wage", "gross_salary","federal_tax_owed", "state_local_tax_owed", "total_tax_owed", "net_salary")
  actual <- names(net_salary("MA"))
  expect_identical(actual, expected)
})
