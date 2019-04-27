library(ggplot2)

#' @title bin_distribution
#' @description Create an object of class *binomial distribution*
#' @param trials an integer
#' @param prob a double value
#' @return created object
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob) {
  probs <- bin_probability(success = 0:trials, trials = trials, prob = prob)
  df <- data.frame(success = 0:trials, probability = probs)
  class(df) <- c("bindis", "data.frame")
  df
}

#' @export
plot.bindis <- function(x, ...) {
  ggplot(data = x, aes(x = success, y = probability)) +
    geom_bar(stat = "identity") +
    theme_bw() +
    scale_x_continuous(name = "Success",
                       breaks = x$success,
                       labels = as.character(x$success)) +
    labs(title = "Distribution plot", x = "Success", y = "Probability")
}

