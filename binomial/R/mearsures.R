#' @title bin_mean
#' @description expected value of a binomial distribution
#' @param trials an integer
#' @param prob a probability value
#' @return expected value(i.e. mean)
#' @export
#' @examples
#' bin_mean(10, 0.3)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}

#' @title bin_variance
#' @description variance of a binomial distribution
#' @param trials an integer
#' @param prob a probability value
#' @return variance
#' @export
#' @examples
#' bin_variance(10, 0.3)
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}

#' @title bin_mode
#' @description the most likely number of success
#' @param trials an integer
#' @param prob a probability value
#' @return mode
#' @export
#' @examples
#' bin_mode(10, 0.3)
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}

#' @title bin_skewness
#' @description a measure of the asymmetry of the probability distribution
#' @param trials an integer
#' @param prob a probability value
#' @return skewness
#' @export
#' @examples
#' bin_skewness(10, 0.3)
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}

#' @title bin_kurtosis
#' @description a measure of the tailedness of the probability distribution of a RV
#' @param trials an integer
#' @param prob a probability value
#' @return kurtosis
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}
