test_that("Testing grossSalaryMultiple", {
  expect <- data.frame(state = ("Massachusetts"),
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
              grossSalary = (29640))
  actual <- as.data.frame(grossSalaryMultiple("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(expect,actual)
})
