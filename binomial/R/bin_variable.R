#' @title bin_variable
#' @description Create an object of class *binvar*
#' @param trials an integer
#' @param prob a numeric value
#' @return created object
#' @export
#' @examples
#' bin_variable(trials = 5, prob = 0.5)
#' bin_variable(100, 0.75)

bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bin <- list(
    trials = trials,
    prob = prob
  )
  class(bin) <- "binvar"
  bin
}

#' @export
print.binvar <- function(x, ...) {
  cat('"Binomial variable"\n')
  cat('\n')
  cat('Parameters\n')
  cat('-number of trials: ', x$trials, "\n")
  cat('-prob of success : ', x$prob, "\n")
}

#' @export
summary.binvar <- function(x, ...) {
  mean <- aux_mean(x$trials, x$prob)
  variance <- aux_variance(x$trials, x$prob)
  mode <- aux_mode(x$trials, x$prob)
  skewness <- aux_skewness(x$trials, x$prob)
  kurtosis <- aux_kurtosis(x$trials, x$prob)
  obj <- list(
    trials = x$trials,
    prob = x$prob,
    mean = mean,
    variance = variance,
    mode = mode,
    skewness = skewness,
    kurtosis = kurtosis
  )
  class(obj) <- "summary.binvar"
  obj
}

#' @export
print.summary.binvar <- function(x, ...) {
  cat('"Summary Binomial"\n')
  cat('\n')
  cat('Parameters\n')
  cat('-number of trials: ', x$trials, "\n")
  cat('-prob of success : ', x$prob, "\n")
  cat('\n')
  cat('Measures\n')
  cat('-mean    : ', x$mean, "\n")
  cat('-variance: ', x$variance, "\n")
  cat('-mode    : ', x$mode, "\n")
  cat('-skewness: ', x$skewness, "\n")
  cat('-kurtosis:', x$kurtosis, "\n")
}
