% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bin_probability.R
\name{bin_probability}
\alias{bin_probability}
\title{bin_probability}
\usage{
bin_probability(success, trials, prob)
}
\arguments{
\item{success}{integer(s)}

\item{trials}{an integer}

\item{prob}{a double denotes the probability of success in a single trial}
}
\value{
computed probability(ies) of the given successes value(s)
}
\description{
compute the probability of a given successes value(s)
}
\examples{
bin_probability(success = 2, trials = 5, prob = 0.5)
bin_probability(success = 0:2, trials = 5, prob = 0.5)
bin_probability(success = 55, trials = 100, prob = 0.45)
}
