
Overview
--------

The `binomial` package implements functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.

Usage
-----

``` r
library(binomial)
library(ggplot2)

#create a binvar object
bin_variable(trials = 10, prob = 0.3)
#> "Binomial variable"
#> 
#> Parameters
#> -number of trials:  10 
#> -prob of success :  0.3

#summary
bin1 <- bin_variable(trials = 10, prob = 0.3)
summary(bin1)
#> "Summary Binomial"
#> 
#> Parameters
#> -number of trials:  10 
#> -prob of success :  0.3 
#> 
#> Measures
#> -mean    :  3 
#> -variance:  2.1 
#> -mode    :  3 
#> -skewness:  0.2760262 
#> -kurtosis: -0.1238095

#mean
bin_mean(10, 0.3)
#> [1] 3

#variance
bin_variance(10, 0.3)
#> [1] 2.1

#mode
bin_mode(10, 0.3)
#> [1] 3

#skewness
bin_skewness(10, 0.3)
#> [1] 0.2760262

#bin_kurtosis
bin_kurtosis(10, 0.3)
#> [1] -0.1238095
```
