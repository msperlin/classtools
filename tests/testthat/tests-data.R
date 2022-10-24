test_that("data functions", {

  df_ibov <- classtools::get_ibov_data()

  expect_true(nrow(df_ibov) > 0)

})
