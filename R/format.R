#' Format cash
#'
#' @param x a number
#'
#' @return formatted string
#' @export
#'
#' @examples
#' format_cash(10)
format_cash <- function(x) {

  x_fmt <- scales::dollar(x,
                          prefix = 'R$ ',
                          decimal.mark = ',',
                          big.mark = '.',
                          largest_with_cents = Inf)

  return(x_fmt)
}


#' Formats percentage
#'
#' @param x a number
#'
#' @return formatted string
#' @export
#'
#' @examples
#' format_percent(0.55)
format_percent <- function(x) {

  x_fmt <- scales::percent(x,
                           accuracy = 0.01,
                           decimal.mark = ',',
                           big.mark = '.')

  return(x_fmt)
}

#' Formats date to BR standard (DD/MM/YYYY)
#'
#' @param x a date in ISO format (YYYY-MM-DD)
#'
#' @return formatted date
#' @export
#'
#' @examples
#' format_date("2010-01-01")
format_date <- function(x) {

  x <- as.Date(x)
  x_fmt <- format(x, '%d/%m/%Y')

  return(x_fmt)
}


#' Formats a number (used in plots)
#'
#' @param x a number
#' @param digits number of digits to use
#' @return formatted number (character)
#' @export
#'
#' @examples
#' format_number(1/3)
format_number <- function(x, digits = 4) {

  x <- format(x,
              digits = digits,
              nsmall = 2,
              decimal.mark = ",",
              big.mark = "."
              )

  return(x)
}

#' prints a pretty dataframe
#'
#' @param df a dataframe
#'
#' @return a pretty html table
#' @export
#'
#' @examples
#' print_pretty_df(dplyr::tibble(x = 1, y = 2))
print_pretty_df <- function(df) {

  knitr::kable(df, row.names = F,
               format.args = list(decimal.mark = ',',
                                  digits =5))

}

