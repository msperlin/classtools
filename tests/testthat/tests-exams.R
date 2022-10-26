
test_that("test of exams fcts", {

  expect_true(check_answers(1:5))

  expect_error(check_answers(c(1)))

  expect_error(check_answers(c(1, Inf, 2, 3, 5)))

  expect_error(check_answers(
    c("3", "", "a", "b", "c")))
})


