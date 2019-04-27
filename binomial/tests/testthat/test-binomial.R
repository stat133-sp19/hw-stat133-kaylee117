context("Test binomial")

test_that("test bin_choose",
          {
            expect_equal(bin_choose(5, 2), choose(5, 2))
            expect_equal(bin_choose(5, 1:3), choose(5, 1:3))
            expect_length(bin_choose(5, 1:3), length(1:3))
          })

test_that("test bin_probability",
          {
            expect_equal(bin_probability(2, 5, 0.5), dbinom(2, 5, 0.5))
            expect_equal(bin_probability(0:2, 5, 0.5), dbinom(0:2, 5, 0.5))
            expect_length(bin_probability(0:2, 5, 0.5), 3)
          })

test_that("test bin_distribution",
          {
            expect_is(bin_distribution(10, 0.3), "data.frame")
            expect_is(bin_distribution(10, 0.3), "bindis")
            expect_error(bin_distribution(10, -0.75))
          })

test_that("test bin_cumulative",
          {
            expect_is(bin_cumulative(10, 0.3), "data.frame")
            expect_is(bin_cumulative(10, 0.3), "bincum")
            expect_error(bin_cumulative(10, -0.75))
          })
