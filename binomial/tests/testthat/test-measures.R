context("Test summary measures")

test_that("test aux_mean",
          {
            expect_equal(aux_mean(10, 0.3), 3)
            expect_equal(aux_mean(100, 0.75), 75)
            expect_length(aux_mean(100, 0.75), 1)
          })

test_that("test aux_variance",
          {
            expect_equal(aux_variance(10, 0.3), 2.1)
            expect_type(aux_variance(100, 0.75), "double")
            expect_length(aux_variance(100, 0.75), 1)
          })

test_that("test aux_mode",
          {
            expect_equal(aux_mode(10, 0.3), 3)
            expect_equal(aux_mode(100, 0.75), 75)
            expect_length(aux_mode(100, 0.75), 1)
          })

test_that("test aux_skewness",
          {
            expect_equal(aux_skewness(10, 0.3), (1 - 2 * .3) / sqrt(10 * .3 * (1 - .3)))
            expect_type(aux_skewness(10, 0.3), "double")
            expect_length(aux_skewness(100, 0.75), 1)
          })

test_that("test aux_kurtosis",
          {
            expect_equal(aux_kurtosis(10, 0.3), (1 - 6 * .3 * (1 - .3)) / (10 * .3 * (1 - .3)))
            expect_type(aux_kurtosis(100, 0.75), "double")
            expect_length(aux_kurtosis(100, 0.75), 1)
          })
