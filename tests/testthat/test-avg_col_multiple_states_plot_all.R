test_that("Testing if avg_col_multiple_states_plot_all() works", {
  vdiffr::expect_doppelganger(
    "plot_test_2",
    avg_col_multiple_states_plot_all()
  )
})
