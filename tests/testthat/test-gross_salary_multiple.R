test_that("Testing gross_salary_multiple(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640))
  actual <- as.data.frame(gross_salary_multiple("MA"))
  # We suspect that the "spec" and "problems" attributes are generated during
  # the CSV import, so for now we are attempting to set these attributes to NULL
  # to avoid errors (the actual and expected data frames look exactly the same though)
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing gross_salary_multiple(\"MA\", \"TX\", \"IL\", \"AL\")", {
  expected <- data.frame(state=c("Massachusetts", "Texas", "Illinois", "Alabama"),
                         state_abbr=c("MA", "TX", "IL", "AL"),
                         minimum_wage=c(14.25, 7.25, 12.00, 7.25),
                         gross_salary=c(29640, 15080, 24960, 15080))
  actual <- as.data.frame(gross_salary_multiple(c("MA","TX","IL","AL")))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})
