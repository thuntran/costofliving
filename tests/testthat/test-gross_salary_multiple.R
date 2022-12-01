test_that("Testing gross_salary_multiple(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         cost_index=(135),
                         grocery_cost_index=(119.3),
                         housing_cost_index=(177.6),
                         utilities_cost_index=(111.1),
                         transportation_cost_index=(111.3),
                         misc_cost_index=(116.1),
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
                         cost_index=c(135.0, 92.1, 94.3, 87.9),
                         grocery_cost_index=c(119.3, 90.8, 98.4, 98.2),
                         housing_cost_index=c(177.6, 83.8, 86.6, 70.1),
                         utilities_cost_index=c(111.1, 103.2, 96.5, 100.7),
                         transportation_cost_index=c(111.3, 94.1, 105.8, 92.7),
                         misc_cost_index=c(116.1, 97.0, 96.7, 94.1),
                         minimum_wage=c(14.25, 7.25, 12.00, 7.25),
                         gross_salary=c(29640, 15080, 24960, 15080))
  actual <- as.data.frame(gross_salary_multiple(c("MA","TX","IL","AL")))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})
