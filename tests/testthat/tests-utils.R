
test_that("test of utils fcts", {

  flag <- get_email_text("CLASSNAME", "EXERCICIO 01", 10, Sys.Date())
  expect_true(flag)

})

check_link <- function(link_in) {

  cli::cli_alert_info("Checking {link_in}")

  out_get <- list()

  try({
    out_get <- httr::GET(link_in)
  })

  status_code <- out_get$status_code

  expect_true(status_code == 200)

  return(invisible(TRUE))
}


test_that("test of github link", {

  link_github <- get_link_github()
  flag <- check_link(link_github)

  expect_true(flag)

})
