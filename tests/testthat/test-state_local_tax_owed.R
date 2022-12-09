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



test_that("columns names are correct in state_local_tax_owed", {
  col_names<-c("state","state_abbr", "minimum_wage", "gross_salary","federal_tax_owed", "state_local_tax_owed")
  actual <- names(state_local_tax_owed("MA"))
  expect_identical(actual, col_names)
})
