test_that("Testing if avg_col_breakdown_plot(\"MA\") works", {
  vdiffr::expect_doppelganger(
    "plot_test_1",
    avg_col_breakdown_plot("MA")
  )
})
