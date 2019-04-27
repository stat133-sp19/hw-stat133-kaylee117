#' @title bin_probability
#' @description compute the probability of a given successes value(s)
#' @param success integer(s)
#' @param trials an integer
#' @param prob a double denotes the probability of success in a single trial
#' @return computed probability(ies) of the given successes value(s)
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability <- function(success, trials, prob) {
  check_prob(prob)
  check_trials(trials)
  check_success(success, trials)
  bin_choose(trials, success) * prob ^ success * (1 - prob) ^ (trials - success)
}
