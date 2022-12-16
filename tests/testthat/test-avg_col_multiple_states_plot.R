test_that("Testing if avg_col_multiple_states_plot(c(\"MA\",\"TX\",\"IL\",\"AL\")) works", {
  vdiffr::expect_doppelganger(
    "plot_test_3",
    avg_col_multiple_states_plot(c("MA","TX","IL","AL"))
  )
})
