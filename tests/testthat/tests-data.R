test_df <- function(df_in) {
  expect_true(nrow(df_in) > 0)
  expect_true(ncol(df_in) > 0)
  expect_false(any(is.na(df_in)))

  return(invisible(TRUE))

}

test_that("data functions", {

  test_df(classtools::get_ibov_data())
  test_df(classtools::get_SP500_data())
  test_df(classtools::get_SP500_yearly_data())
  test_df(classtools::get_TD_data())

})
