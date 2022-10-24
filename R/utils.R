#' Writes email message
#'
#' @inheritParams my_exams2moodle
#' @param n_q number of questions in exam
#'
#' @return a text on screen
#' @export
#'
#' @examples
#' get_email_text("CLASSNAME", "EXERCICIO 01", 10, Sys.Date())
get_email_text <- function(class_name,
                           exerc_name,
                           n_q,
                           my_deadline) {

  # makes sure week days are correct
  Sys.setlocale("LC_TIME", "pt_BR.UTF-8")


  l_str <- readr::read_rds(
    fs::path(
      system.file('extdata/other-data', package = "classtools"),
      "email-str.rds"
  ))

  subject <- stringr::str_glue(l_str$subject)

  body <- stringr::str_glue(l_str$body)

  link_github <- "https://github.com/msperlin/classtools/tree/main/inst/extdata/data"

  links <- stringr::str_glue(l_str$links)

  cli::cli_h1("Texto do email")

  message(subject, '\n\n',
          body, '\n',
          links)


  return(invisible(TRUE))
}

