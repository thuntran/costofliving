test_that("Testing grossSalaryMultiple(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         stateAbbr=("MA"),
                         stateTaxRate=(6.25),
                         avgLocalTaxRate=(0),
                         combinedRate=(6.25),
                         costIndex=(135),
                         groceryCost=(119.3),
                         housingCost=(177.6),
                         utilitiesCost=(111.1),
                         transportationCost=(111.3),
                         miscCost=(116.1),
                         minimumWage=(14.25),
                         grossSalary=(29640))
  actual <- as.data.frame(grossSalaryMultiple("MA"))
  # We suspect that the "spec" and "problems" attributes are generated during
  # the CSv import, so for now we are attempting to set these attributes to NULL
  # to avoid errors (the actual and expected data frames look exactly the same though)
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing grossSalaryMultiple(\"MA\", \"TX\", \"IL\", \"AL\")", {
  expected <- data.frame(state=c("Massachusetts", "Texas", "Illinois", "Alabama"),
                         stateAbbr=c("MA", "TX", "IL", "AL"),
                         stateTaxRate=c(6.25, 6.25, 6.25, 4.00),
                         avgLocalTaxRate=c(0.00, 1.94, 2.49, 5.14),
                         combinedRate=c(6.25, 8.19, 8.74, 9.14),
                         costIndex=c(135.0, 92.1, 94.3, 87.9),
                         groceryCost=c(119.3, 90.8, 98.4, 98.2),
                         housingCost=c(177.6, 83.8, 86.6, 70.1),
                         utilitiesCost=c(111.1, 103.2, 96.5, 100.7),
                         transportationCost=c(111.3, 94.1, 105.8, 92.7),
                         miscCost=c(116.1, 97.0, 96.7, 94.1),
                         minimumWage=c(14.25, 7.25, 12.00, 7.25),
                         grossSalary=c(29640, 15080, 24960, 15080))
  actual <- as.data.frame(grossSalaryMultiple(c("MA","TX","IL","AL")))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})
