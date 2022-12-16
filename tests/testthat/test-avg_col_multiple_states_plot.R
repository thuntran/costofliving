test_that("Testing if avg_col_multiple_states_plot(c(\"MA\",\"TX\",\"IL\",\"AL\")) works", {
  vdiffr::expect_doppelganger(
    "Difference in Average Cost of Living and Minimum Wage Net Salaries Across States",
    avg_col_multiple_states_plot(c("MA","TX","IL","AL"))
  )
})
