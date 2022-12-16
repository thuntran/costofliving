test_that("Testing avg_col_multiple_states_plot_all()", {
  vdiffr::expect_doppelganger(
    "plot_test_2",
    avg_col_multiple_states_plot_all()
  )
})
