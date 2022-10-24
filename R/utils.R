#' Writes email message
#'
#' @inheritParams my_exams2moodle
#'
#' @return
#' @export
#'
#' @examples
get_email_text <- function(class_name,
                           exerc_name,
                           n_q,
                           my_deadline) {

  Sys.setlocale("LC_TIME", "pt_BR.UTF-8")
  subject <- stringr::str_glue('{class_name}: {exerc_name} disponível no Moodle')

  body <- stringr::str_glue('Caros alunos,\n\n',
                   'A {exerc_name} [{n_q} questões] já está disponível no Moodle. ',
                   '\nO prazo para entrega é {format(my_deadline, "%d/%m/%Y %H:%M")}',
                   ' ({weekdays(my_deadline)}).\n\n',
                   'At,')

  cli::cli_h1("Texto do email")

  message(subject, '\n\n',
          body)


  return(invisible(TRUE))
}
