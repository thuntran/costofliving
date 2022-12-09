test_that("Testing avg_col_multiple_states(c(\"MA\", \"TX\", \"IL\", \"AL\"))", {
  expected <- data.frame(state=c("Massachusetts", "Texas", "Illinois", "Alabama"),
                         state_abbr=c("MA", "TX", "IL", "AL"),
                         minimum_wage=c(14.25, 7.25, 12.00, 7.25),
                         gross_salary=c(29640, 15080, 24960, 15080),
                         federal_tax_owed=c(3351.3, 1604.1, 2789.7, 1604.1),
                         state_local_tax_owed=c(1852.50, 1235.05, 2181.50, 1378.31),
                         total_tax_owed=c(5203.80, 2839.15, 4971.20, 2982.41),
                         net_salary=c(24436.20, 12240.85, 19988.80, 12097.59),
                         net_salary_avg_col_difference=c(-12332.80, -17002.15, -10528.20, -14602.41))
  actual <- as.data.frame(avg_col_multiple_states(c("MA", "TX", "IL", "AL")))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})

test_that("Testing avg_col_multiple_states(\"MA\")", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3),
                         state_local_tax_owed=(1852.5),
                         total_tax_owed=(5203.8),
                         net_salary=(24436.2),
                         net_salary_avg_col_difference=(-12332.8))
  actual <- as.data.frame(avg_col_multiple_states("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_identical(actual, expected)
})
test_that("Testing net_salary_avg_col_difference(\"MA\" dimensions)", {
  expected <- data.frame(state=("Massachusetts"),
                         state_abbr=("MA"),
                         minimum_wage=(14.25),
                         gross_salary=(29640),
                         federal_tax_owed=(3351.3),
                         state_local_tax_owed=(1852.5),
                         total_tax_owed=(5203.8),
                         net_salary=(24436.2),
                         net_salary_avg_col_difference=(-12332.8))
  actual <- as.data.frame(net_salary_avg_col_difference("MA"))
  attr(actual, "spec") <- NULL
  attr(actual, "problems") <- NULL
  expect_true(all_equal(actual,expected))
})



test_that("columns names are correct in avg_col_multiple_states", {
  col_names<-c("state","state_abbr", "minimum_wage", "gross_salary","federal_tax_owed", "state_local_tax_owed", "total_tax_owed", "net_salary", "net_salary_avg_col_difference")
  actual <- names(avg_col_multiple_states("MA"))
  expect_identical(actual, col_names)
})
