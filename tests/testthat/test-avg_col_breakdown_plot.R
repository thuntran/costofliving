test_that("Testing if avg_col_breakdown_plot(\"MA\") works", {
  vdiffr::expect_doppelganger(
    "Average Cost of Living Breakdown in Massachusetts in 2022 (in dollars)",
    avg_col_breakdown_plot("MA")
  )
})
