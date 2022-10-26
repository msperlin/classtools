test_df <- function(df_in) {
  expect_true(nrow(df_in) > 0)
  expect_true(ncol(df_in) > 0)
  expect_false(any(is.na(df_in)))

  return(invisible(TRUE))

}

test_file <- function(f_in) {
  expect_true(fs::file_exists(f_in))

  return(invisible(TRUE))

}

test_that("data path functions", {

  test_file(classtools::get_ibov_file())
  test_file(classtools::get_SP500_file())
  test_file(classtools::get_SP500_yearly_file())
  test_file(classtools::get_TD_file())

})


test_that("data functions", {

  test_df(classtools::get_ibov_data())
  test_df(classtools::get_SP500_data())
  test_df(classtools::get_SP500_yearly_data())
  test_df(classtools::get_TD_data())

})
