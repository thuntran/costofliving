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

test_that("Testing gross_salary(\"Massachusetts\")", {
  expected <- print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  actual <- gross_salary("Massachusetts")

  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing gross_salary(12345)", {
  expected <- print("Error: Please enter valid state abbreviations and check that the letters are capitalized.")
  actual <- gross_salary(12345)
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing gross_salary(\"MA\") output dimensions", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640))
  actual <- gross_salary("MA")
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(dim(actual), dim(expected))
})

test_that("Testing whether columns names are correct in gross_salary(\"MA\")", {
  expected <- c("state","state_abbr", "minimum_wage", "gross_salary")
  actual <- names(gross_salary("MA"))
  expect_identical(actual, expected)
})
