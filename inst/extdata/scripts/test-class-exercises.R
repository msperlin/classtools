testing_folder <- "~/Desktop/"

testing_fct <- function(folder_exerc, this_name) {

  f_exerc <- fs::dir_ls(
    folder_exerc,
    type = 'file',
    recurse = TRUE,
    glob = "*.Rmd|Rnw")

  cli::cli_alert("Found {length(f_exerc)} exercises to test")
  exams::exams2html(f_exerc,
                    n = 2,
                    name = glue::glue('TESTING-{this_name}'),
                    dir = fs::path(testing_folder, this_name))

  cli::cli_alert_success("Done, it works..")

}

# FAF questions
folder_exerc <- '~/GDrive/02-UFRGS/01-classes/97-Banco Questoes (EXAMS)/01-LIVRO-FAF/'
this_name <- "FAF-files"

testing_fct(folder_exerc, this_name)

# ADFER questions
folder_exerc <- '~/GDrive/02-UFRGS/01-classes/97-Banco Questoes (EXAMS)/02-ADFER/'
this_name <- "ADFER-files"

testing_fct(folder_exerc, this_name)
