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
  expected <- print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  actual <- federal_tax_owed("AM")
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing federal_tax_owed(\"MA\" dimensions)", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3))
  actual <- as.data.frame(federal_tax_owed("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_true(all_equal(actual,expected))
})


testthat::test_that("Testing the number of columns in the federal_tax_owed df output is correct)", {
  expect_equal(ncol(federal_tax_owed("MA")), 5)
})

test_that("Testing the number of rows in the federal_tax_owed df output)", {
  expect_equal(nrow(federal_tax_owed("MA")), 1)
})

