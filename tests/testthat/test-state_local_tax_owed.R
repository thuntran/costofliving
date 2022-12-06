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
