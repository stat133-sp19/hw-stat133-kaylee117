#title:make-shot-charts-script
#description: This script is to create shot charts.There are five shot charts of each player and one facetted shot chart
#inputs: workout01/images/nba-court.jpg
#         workout01/data/andre-iguodala.csv
#         workout01/data/draymond-green.csv
#         workout01/data/kevin-durant.csv
#         workout01/data/klay-thompson.csv
#         workout01/data/stephen-curry.csv
#         workout01/data/shots-data.csv
#outputs: workout01/images/andre-iguodala-shot-chart.pdf
#         workout01/images/draymond-green-shot-chart.pdf
#         workout01/images/kevin-durant-shot-chart.pdf
#         workout01/images/klay-thompson-shot-chart.pdf
#         workout01/images/stephen-curry-shot-chart.pdf
#         workout01/images/gsw-shot-charts.pdf

library(ggplot2)
library(jpeg)
library(grid)
court_file <- "workout01/images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala(2016 season)') +
  theme_minimal()
ggsave(filename = "workout01/images/andre-iguodala-shot-chart.pdf",
       plot = iguodala_shot_chart, width = 6.5, height = 5, units = "in")

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green(2016 season)') +
  theme_minimal()
ggsave(filename = "workout01/images/draymond-green-shot-chart.pdf",
       plot = green_shot_chart, width = 6.5, height = 5, units = "in")

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant(2016 season)') +
  theme_minimal()
ggsave(filename = "workout01/images/kevin-durant-shot-chart.pdf",
       plot = durant_shot_chart, width = 6.5, height = 5, units = "in")

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson(2016 season)') +
  theme_minimal()
ggsave(filename = "workout01/images/klay-thompson-shot-chart.pdf",
       plot = thompson_shot_chart, width = 6.5, height = 5, units = "in")

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Steohen Curry(2016 season)') +
  theme_minimal()
ggsave(filename = "workout01/images/stephen-curry-shot-chart.pdf",
       plot = curry_shot_chart, width = 6.5, height = 5, units = "in")

gsw_shot_charts <- ggplot(data = main_table) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW(2016 season)') +
  theme_minimal() +
  facet_wrap(~name)

ggsave(filename = "workout01/images/gsw-shot-charts.pdf",
       plot = gsw_shot_charts, width = 8, height = 7, units = "in")

ggsave(filename = "workout01/images/gsw-shot-charts.png",
       plot = gsw_shot_charts, width = 8, height = 7, units = "in")