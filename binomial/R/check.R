# title: check_prob
# description: test if an input is a valid probability value
# param: prob a numeric value
# return: TRUE if it's valid
check_prob <- function(prob) {
  if (length(prob) != 1) {
    stop("p has to be a number between 0 and 1")
  }
  if (!is.numeric(prob)) {
    stop("p has to be a number between 0 and 1")
  }
  if (prob < 0 | prob > 1) {
    stop("p has to be a number between 0 and 1")
  }
  TRUE
}

# title: check_trials
# description: test if an input is a valid value for number of trials
# param: trials a numeric value
# return: TRUE if it's valid
check_trials <- function(trials) {
  if (!is.numeric(trials)){
    stop("trials have to be a non-negative integer!")
  } else if (as.integer(trials) != trials | trials < 0) {
    stop("trials have to be a non-negative integer!")
  }
  TRUE
}

# title: check_success
# description: test if an input is a valid value for number of successes
# param: success a vector of integers
# param: trials an integer
# return: TRUE if success is valid
check_success <- function(success, trials) {
  check_trials(trials)
  if (any(as.integer(success) != success) | any(success < 0)){
    stop("Success must be non-negative integer(s).")
  } else if (any(success > trials)) {
    stop("Success cannot be greater than trials!")
  }
  TRUE
}
