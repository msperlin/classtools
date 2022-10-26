
test_that("test of exams fcts", {

  x <- sample_cash()
  expect_true(class(x) == "numeric")

  r <- sample_yield_rate()
  expect_true(class(r) == "numeric")

  rnd_weights <- gen_rnd_vec()
  expect_true(rnd_weights[1] == 1)
  expect_true(length(rnd_weights) == 5)

})


