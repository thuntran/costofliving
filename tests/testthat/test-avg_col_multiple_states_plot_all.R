test_that("Testing if avg_col_multiple_states_plot_all() works", {
  vdiffr::expect_doppelganger(
    "Difference in Average Cost of Living and Minimum Wage Net Salaries Across All U.S. States",
    avg_col_multiple_states_plot_all()
  )
})
