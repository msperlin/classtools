
#' Get path of data file
#'
#' @param f_in
#'
#' @return a path
#' @export
#'
#' @examples
#' data_dir_get('B3-stocks.rds')
data_dir_get <- function(f_in) {

  dir_pkg <- system.file("extdata/data", package = 'classtools')

  f_out <- fs::path(dir_pkg,
                    f_in)

  if (!fs::file_exists(f_out)) {
    cli::cli_abort("File {f_in}  does not exists..")
  }

  return(f_out)

}

#' returns data for stocks br
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' get_stock_br_file()
get_stock_br_file <- function() {
  my_f <- data_dir_get('B3-stocks.rds')

  return(my_f)
}

#' Get reliable data for yf-BR
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' get_stock_br_data()
get_stock_br_data <- function() {

  my_f <- get_stock_br_file()
  df <- readr::read_rds(my_f)

  #copy_data_file_to_exam_folder(my_f)

  return(df)
}

#' Returns ibovespa file
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' get_ibov_file()
get_ibov_file <- function() {
  my_f <- data_dir_get('ibovespa.rds')
  return(my_f)
}

#' returns data for ibovespa
#'
#' @return dataframe
#' @export
#'
#' @examples
#' get_ibov_data()
get_ibov_data <- function() {

  my_f <- get_ibov_file()
  df <- readr::read_rds(my_f)

  #copy_data_file_to_exam_folder(my_f)

  return(df)
}

#' path of football file
#'
#' @return a path
#' @export
#'
#' @examples
#' get_football_file()
get_football_file <- function() {
  my_f <- data_dir_get('football-br.csv')
  return(my_f)
}

#' returns data for footballgames
#'
#' @return dataframe
#' @export
#'
#' @examples
#' get_football_games()
get_football_games <- function() {

  my_f <- get_football_file()
  df <- readr::read_csv(my_f, col_types = readr::cols(),
                        locale = readr::locale(encoding = 'Latin1'))

  #copy_data_file_to_exam_folder(my_f)

  return(df)

}

#' Returns path of td file
#'
#' @return a path
#' @export
#'
#' @examples
#' get_TD_file()
get_TD_file <- function() {
  my_f <- data_dir_get('TD-data.rds')

  return(my_f)
}


#' returns data for TD
#'
#' @return dataframe
#' @export
#'
#' @examples
#' get_TD_data()
get_TD_data <- function() {

  my_f <- get_TD_file()
  df <- readr::read_rds(my_f)

  #copy_data_file_to_exam_folder(my_f)

  return(df)

}

#' Returns path of file for sp500
#'
#' @return a path
#' @export
#'
#' @examples
#' get_SP500_file()
get_SP500_file <- function() {
  my_f <- data_dir_get('SP500-stocks.rds')
  return(my_f)
}

#' returns data for SP500
#'
#' @return dataframe
#' @export
#'
#' @examples
#' get_SP500_data()
get_SP500_data <- function() {

  my_f <- get_SP500_file()
  df <- readr::read_rds(my_f)

  #copy_data_file_to_exam_folder(my_f)

  return(df)
}

#' Returns path of file for sp500 yearly
#'
#' @return a path
#' @export
#'
#' @examples
#' get_SP500_yearly_file()
get_SP500_yearly_file <- function() {
  my_f <- data_dir_get('SP500-stocks-yearly.rds')
  return(my_f)
}

#' returns data for SP500 (yearly)
#'
#' @return dataframe
#' @export
#'
#' @examples
#' get_SP500_yearly_data()
get_SP500_yearly_data <- function() {

  my_f <- get_SP500_yearly_file()
  df <- readr::read_rds(my_f)

  #copy_data_file_to_exam_folder(my_f)

  return(df)
}


# copy_data_file_to_exam_folder <- function(my_f) {
#
#   my_dir <- file.path(getwd(), 'exam-data')
#
#   fs::dir_create(my_dir)
#
#   flag <- file.copy(my_f, my_dir,
#                     overwrite = TRUE)
#
#   if (!flag) stop('Cant copy ', my_f)
#
#   return(invisible(flag))
# }
