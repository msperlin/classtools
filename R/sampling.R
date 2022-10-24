#' Sample a cash value
#'
#' @param min_value min value
#' @param max_value max value
#' @param n_bins number of bins to use
#'
#' @return a value
#' @export
#'
#' @examples
#' sample_cash()
sample_cash <- function(min_value = 0,
                        max_value = 100,
                        n_bins = 25) {

  this_vec <- seq(min_value, max_value, length.out = n_bins)

  this_value <- sample(this_vec, 1)

  return(this_value)
}

#' Samples a yield rate
#'
#' @inheritParams sample_cash
#'
#' @return a yield rate
#' @export
#'
#' @examples
#' sample_yield_rate()
sample_yield_rate <- function(min_value = 0.05,
                              max_value = 0.25,
                              n_bins = 10) {

  this_vec <- seq(min_value, max_value, length.out = n_bins)

  this_value <- sample(this_vec, 1)

  return(this_value)
}

#' Generates a random vector
#'
#' @return a vector
#' @export
#'
#' @examples
#' gen_rnd_vec()
gen_rnd_vec <- function(){
  rnd_vec_1 <- c(1, seq(stats::runif(1,0.1,0.2),
                        stats::runif(1,0.7,0.8), length.out = 4))
  rnd_vec_2 <- c(1, seq(stats::runif(1,1.1,1.2),
                        stats::runif(1,1.7, 1.8), length.out = 4))
  rnd_vec_3 <- c(1, seq(stats::runif(1,0.25,0.5),
                        stats::runif(1,0.6,0.8), length.out = 2),
                 seq(stats::runif(1,1.2,2), length.out = 2))

  rnd_l <- list(rnd_vec_1, rnd_vec_2, rnd_vec_3)

  rnd_vec <- sample(rnd_l,1)[[1]]

  return(rnd_vec)
}

#' Builds random solutions
#'
#' @param solution the solution
#' @param candidates all canditates for solution
#' @param is_cash if solution is cash
#'
#' @return a vector
#' @export
#'
#' @examples
#' make_random_answers(199.12, is_cash=TRUE)
make_random_answers <- function(solution,
                                candidates = NA,
                                is_cash = FALSE) {

  if (!any(is.na(candidates))) {

    candidates <- unique(candidates)
    candidates <- candidates[candidates != solution]

    if (length(candidates) < 4) {
      stop('Candidate vector is lower than 4!')
    }

    my_answers <- c(solution,
                    sample(candidates, 4))
  } else {
    # check if is numeric
    if (class(solution) %in% c('numeric', 'integer')) {
      # find number of decimais
      n_decimals <- decimal_places(solution)

      if (n_decimals ==0) {
        my_answers <- floor(solution*gen_rnd_vec())
      } else {
        if (n_decimals > 4) n_decimals <- 4
        my_answers <- format(solution*gen_rnd_vec(),
                             digits = n_decimals)
      }

      if (is_cash) {
        my_answers <- format_cash(
          as.numeric(my_answers))
      }

    }

  }

  return(my_answers)
}

decimal_places <- function(x) {
  if (abs(x - round(x)) > .Machine$double.eps^0.5) {
    nchar(strsplit(sub('0+$', '', as.character(x)), ".", fixed = TRUE)[[1]][[2]])
  } else {
    return(0)
  }
}
