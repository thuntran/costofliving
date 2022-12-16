test_that("Testing avg_col_breakdown_plot(\"MA\")", {
  vdiffr::expect_doppelganger(
    "plot_test_1",
    avg_col_breakdown_plot("MA")
  )
})

test_that("Testing avg_col_breakdown_plot(\"Massachusetts\")", {
  expected_error_message <- "Please enter valid state abbreviations and check that the letters are capitalized."
  expect_error(avg_col_breakdown_plot("Massachusetts"), expected_error_message)
})

test_that("Testing avg_col_breakdown_plot(12345)", {
  expected_error_message <- "Please enter valid state abbreviations and check that the letters are capitalized."
  expect_error(avg_col_breakdown_plot(12345), expected_error_message)
})
