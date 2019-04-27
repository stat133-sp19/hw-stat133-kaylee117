context("Test checkers")

test_that("test check_prob",
          {
            expect_true(check_prob(0.1))
            expect_error(check_prob(-0.1))
            expect_error(check_prob(c(1, 2)))
            expect_error(check_prob("a"))
          })

test_that("test check_trials",
          {
            expect_true(check_trials(100))
            expect_error(check_trials(-1))
            expect_error(check_trials("a"))
          })

test_that("test check_success",
          {
            expect_true(check_success(2, 4))
            expect_error(check_success(5, 4))
            expect_error(check_success(5, -1))
          })
