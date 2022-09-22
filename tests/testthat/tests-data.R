test_that("data functions", {

  available_files <- classtools::data_list()

  for (i_file in available_files) {

    path_file <- classtools::data_path(i_file)
    path_ext <- fs::path_ext(path_file)

    df <- classtools::data_import(i_file)

    expect_true(nrow(df) > 0)
    expect_true(tibble::is_tibble(df))
  }

})
