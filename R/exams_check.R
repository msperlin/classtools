#' Checks whether answers make sense
#'
#' @param answers_in vector of single choice answers
#'
#' @return logical (TRUE/FALSE)
#' @export
#'
#' @examples
#' flag <- check_answers(1:5)
#' flag
check_answers <- function(answers_in) {

  n_answers <- 5
  if (length(answers_in) != n_answers) {
    stop('Found question with less or more than 5 answers..')
  }

  n_unique <- dplyr::n_distinct(answers_in)
  if (n_unique != n_answers) {
    stop('Found question with less or more than 5 UNIQUE answers..')
  }

  n_na <- sum(is.na(answers_in))
  if (n_na > 0){
    stop('Found NA in answers...')
  }

  flag <- any(stringr::str_trim(answers_in) == '')
  if (flag) {
    stop('Found question with empty answer..')
  }

  if (is.numeric(answers_in)) {
    flag <- any(!is.finite(answers_in))

    if (flag) {
      stop('Found numeric question with non finite number..')
    }

  }

  return(invisible(TRUE))

}
