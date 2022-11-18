#' Produces moodle file from exercises
#'
#' @param exercise_files path of exercise files
#' @param n_ver number of versions
#' @param class_name name of class
#' @param exerc_name name of exercise
#' @param my_deadline deadline time
#'
#' @return nothing
#' @export
#'
#' @examples
#' \dontrun{
#'  my_exams2moodle()
#'  }
my_exams2moodle <- function(exercise_files,
                            n_ver,
                            class_name,
                            exerc_name,
                            my_deadline) {

  # makes sure no scientific notation is used
  options(scipen = 999)

  schoice = list(eval = list(partial = TRUE,
                             rule = 'none'))

  stitle <- glue::glue('MOODLE_{exerc_name}-Q_{sprintf("%02d",1:length(exercise_files))}')

  exams::exams2moodle(file = exercise_files,
               n = n_ver,
               schoice = schoice,
               stitle = stitle,
               name =  glue::glue('{class_name}-{exerc_name}'),
               iname = FALSE,
               quiet = TRUE)

  my_template <- fs::path(get_path_package(), 'templates',
                          'plain8.html')

  exams::exams2html(file = exercise_files,
                    n = 1,
                    solution = FALSE,
                    template = my_template)

  n_q <- length(exercise_files)

  get_email_text(class_name,
                 exerc_name,
                 n_q,
                 my_deadline)


  return(invisible(TRUE))
}


#' Creates text for random questions
#'
#' @param text1 tibble 1
#' @param text2 tibble 2
#' @param text3 tibble 3
#'
#' @return A list
#' @export
#'
#' @examples
#'
#' tibble1 <- dplyr::tibble(text = c("ABC1", "ABC2", "ABC3"), sol =  c(TRUE, FALSE, TRUE))
#' tibble2 <- dplyr::tibble(text = c("ABC1", "ABC2", "ABC3"), sol = c(TRUE, FALSE, TRUE))
#' tibble3 <- dplyr::tibble(text = c("ABC1", "ABC2", "ABC3"), sol = c(TRUE, FALSE, TRUE))
#' build_answers_text(tibble1, tibble2, tibble3)
build_answers_text <- function(text1,
                               text2,
                               text3) {

  text1_chosen <- text1[sample(1:nrow(text1), 1), ]
  text2_chosen <- text2[sample(1:nrow(text2), 1), ]
  text3_chosen <- text3[sample(1:nrow(text3), 1), ]

  right_answer <- paste0(c(text1_chosen$sol,
                           text2_chosen$sol,
                           text3_chosen$sol), collapse = ', ')

  other_answers <- tidyr::expand_grid(col1 = c('TRUE', 'FALSE'),
                                      col2 = c('TRUE', 'FALSE'),
                                      col3 = c('TRUE', 'FALSE')) |>
    dplyr::mutate(answer = glue::glue('{col1}, {col2}, {col3}') ) |>
    dplyr::filter(answer != right_answer)

  my_answers <- c(right_answer,
                  sample(other_answers$answer, 4))

  return(list(my_answers = my_answers,
              texts = c(text1_chosen$text,
                        text2_chosen$text,
                        text3_chosen$text)))

}
