#title: make-shots-data-script
#description: This script is to prepare data. The primary goal is to create a csv data file shots-data-.csv that will contain the required variables to be used in the visualization phase.
#inputs:  workout01/data/andre-iguodala.csv
#         workout01/data/draymond-green.csv
#         workout01/data/kevin-durant.csv
#         workout01/data/klay-thompson.csv
#         workout01/data/stephen-curry.csv
#outputs: workout01/output/andre-iguodala-summary.txt
#         workout01/output/draymond-green-summary.txt
#         workout01/output/kevin-durant-summary.txt
#         workout01/output/klay-thompson-summary.txt
#         workout01/output/stephen-curry-summary.txt
#         workout01/data/shots-data.csv
#         workout01/output/shots-data-summary.txt

library(dplyr)

column_types <- c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "factor", "real", "real")

iguodala <- read.csv("./workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE, header = TRUE, sep = ",", colClasses = column_types)
green <- read.csv("./workout01/data/draymond-green.csv", stringsAsFactors = FALSE, header = TRUE, sep = ",", colClasses = column_types)
durant <- read.csv("./workout01/data/kevin-durant.csv", stringsAsFactors = FALSE, header = TRUE, sep = ",", colClasses = column_types)
thompson <- read.csv("./workout01/data/klay-thompson.csv", stringsAsFactors = FALSE, header = TRUE, sep = ",", colClasses = column_types)
curry <- read.csv("./workout01/data/stephen-curry.csv", stringsAsFactors = FALSE, header = TRUE, sep = ",", colClasses = column_types)

iguodala$name <- "Andre Iguodala"
green$name <- "Draymond Green"
durant$name <- "Kevin Durant"
thompson$name <- "Klay Thompson"
curry$name <- "Stephen Curry"

change_flag <- function(vec){
  yes <- vec == 'y'
  vec[yes] <-  'shot_yes'
  vec[!yes] <-  'shot_no'
  return(vec)
}
iguodala$shot_made_flag <-  change_flag(iguodala$shot_made_flag)
green$shot_made_flag <- change_flag(green$shot_made_flag)
durant$shot_made_flag <- change_flag(durant$shot_made_flag)
thompson$shot_made_flag <- change_flag(thompson$shot_made_flag)
curry$shot_made_flag <- change_flag(curry$shot_made_flag)

iguodala <-  mutate(iguodala, minute = period * 12 - minutes_remaining)
green <-  mutate(green, minute = period * 12 - minutes_remaining)
durant <-  mutate(durant, minute = period * 12 - minutes_remaining)
thompson <-  mutate(thompson, minute = period * 12 - minutes_remaining)
curry <-  mutate(curry, minute = period * 12 - minutes_remaining)

sink(file = "workout01/output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "workout01/output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "workout01/output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "workout01/output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "workout01/output/stephen-curry-summary.txt")
summary(curry)
sink()

main_table <- rbind(iguodala, green, durant, thompson, curry)
write.csv(
  x = main_table,
  file = "workout01/data/shots-data.csv"
)

sink(file = "workout01/output/shots-data-summary.txt")
summary(main_table)
sink()