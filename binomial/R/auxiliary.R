# title: aux_mean
# description: expected value of a binomial distribution
# param: trials a non-negative integer
# param: prob a valid probability value
# return: expected value(i.e. mean)
aux_mean <- function(trials, prob) {
  trials * prob
}


# title: aux_variance
# description: variance of a binomial distribution
# param: trials a non-negative integer
# param: prob a valid probability value# return:
# return: variance
aux_variance <- function(trials, prob) {
  trials * prob * (1 - prob)
}

# title: aux_mode
# description: the most likely number of success
# param: trials a non-negative integer
# param: prob a valid probability value
# return: mode
aux_mode <- function(trials, prob) {
  as.integer(trials * prob + prob)
}

# title: aux_skewness
# description: a measure of the asymmetry of the probability distribution
# param: trials a non-negative integer
# param: prob a valid probability value
# return: skewness
aux_skewness <- function(trials, prob) {
  (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
}

# title: aux_kurtosis
# description: a measure of the tailedness of the probability distribution of a RV
# param: trials a non-negative integer
# param: prob a valid probability value
# return: kurtosis
aux_kurtosis <- function(trials, prob) {
  (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
}
