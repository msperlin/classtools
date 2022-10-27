
testing_fct <- function(folder_exerc, testing_output) {

  dir_base <- basename(folder_exerc)
  cli::cli_alert_info("Testing {dir_base }")

  f_exerc <- fs::dir_ls(
    folder_exerc,
    type = 'file',
    recurse = TRUE,
    glob = "*.Rmd|Rnw")

  n_exerc <- length(f_exerc)
  cli::cli_alert("Found {n_exerc} exercises to test")

  if (n_exerc == 0) {
    cli::cli_alert_danger("No exercises to compile..")
    return(invisible(TRUE))
  }

  my_template <- fs::path(
    system.file('extdata/templates/plain8.html',
                package = 'classtools')
  )

  exams::exams2html(f_exerc,
                    n = 1,
                    name = glue::glue('TESTING-{dir_base}'),
                    template = my_template,
                    dir =testing_output)

  cli::cli_alert_success("Done, it works..")

  return(invisible(TRUE))

}

# FAF questions
folder_exerc <- '~/GDrive/02-UFRGS/01-classes/97-Banco Questoes (EXAMS)/01-LIVRO-FAF/'
testing_output <- fs::path("~/Desktop/TESTING-FAF")

all_dirs <- fs::dir_ls(folder_exerc, type = 'directory')

purrr::map(all_dirs, testing_fct,
           testing_output = testing_output)


# ADFER questions
folder_exerc <- '~/GDrive/02-UFRGS/01-classes/97-Banco Questoes (EXAMS)/02-ADFER/'
testing_output <- fs::path("~/Desktop/TESTING-ADFER")

all_dirs <- fs::dir_ls(folder_exerc, type = 'directory')

lan <- 'en'
purrr::map(all_dirs, testing_fct,
           testing_output = testing_output)
