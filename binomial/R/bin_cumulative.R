library(ggplot2)

#' @title bin_cumulative
#' @description Create an object of class *bincum*
#' @param trials an integer
#' @param prob a double value
#' @return created object
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)
bin_cumulative <- function(trials, prob) {
  probs <- bin_probability(success = 0:trials, trials = trials, prob = prob)
  cumu <- cumsum(probs)
  df <- data.frame(success = 0:trials, probability = probs, cumulative = cumu)
  class(df) <- c("bincum", "data.frame")
  df
}

#' @export
plot.bincum <- function(x, ...) {
  ggplot(data = x, aes(x = success, y = cumulative)) +
    geom_point() +
    geom_line() +
    theme_bw() +
    scale_x_continuous(name = "Success",
                       breaks = x$success,
                       labels = as.character(x$success)) +
    labs(title = "Cumulative probability plot", y = "Probability")
}
