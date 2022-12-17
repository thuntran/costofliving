test_that("Testing avg_col_multiple_states_plot(c(\"MA\",\"TX\",\"IL\",\"AL\"))", {
  vdiffr::expect_doppelganger(
    "plot_test_3",
    avg_col_multiple_states_plot(c("MA","TX","IL","AL"))
  )
})

test_that("Testing avg_col_multiple_states_plot(c(\"MA\",\"tx\",\"illinois\",\"LA\"))", {
  expected_error_message <- "Please enter valid state abbreviations and check that the letters are capitalized."
  expect_error(avg_col_multiple_states_plot(c("MA","tx","illinois","LA")), expected_error_message)
})

test_that("Testing avg_col_multiple_states_plot(c(\"MA\",\"TX\", 999))", {
  expected_error_message <- "Please enter valid state abbreviations and check that the letters are capitalized."
  expect_error(avg_col_multiple_states_plot(c("MA","TX", 999)), expected_error_message)
})

test_that("Testing avg_col_multiple_states_plot(c(\"MA\",\"TX\",\"CA\", \"MA\"))", {
  expected_error_message <- "You might have entered the same state twice. Please try again."
  expect_error(avg_col_multiple_states(c("MA", "TX", "CA", "MA")), expected_error_message)
})
