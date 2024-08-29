require(tidyverse)
require(ggplot2)
require(dplyr)
require(readxl)
require(stringr)
require(kableExtra)
library(worldfootballR)
require(fmsb)
require(plotly)
require(devtools)
require(knitr)
require(ggimage)
require(rvest)
require(xml2)
require(webshot2)


df <- read_excel("~/Desktop/English Leagues - CFs.xlsx")
df <- filter(df, `Market value` <= 3000000)

#variables to use

#Goals per 90, Successive defensive actions per 90, Successive attacking actions per 90, 
#Shots per 90, Shots on target %, Goal Conversion %, Market Value, Height, Weight, Aerial Duels per 90








df_prep <- subset(df, select = c("Player","Goals","Goals per 90","Successful defensive actions per 90",
"Successful attacking actions per 90","Shots per 90", "Shots on target, %", "Goal conversion, %", "Market value","Age", "Minutes played"))

# Define the Gaussian transformation function
gaussian_transform <- function(age, mu = 26, sigma = 4) {
  return (exp(-((age - mu)^2) / (2 * sigma^2)))
}
# Apply the Gaussian transformation to the Age column
df_prep$Age <- gaussian_transform(df_prep$Age)


df3 <- df_prep %>% mutate_at(c("Goals","Goals per 90","Successful defensive actions per 90",
                               "Successful attacking actions per 90","Shots per 90", 
                               "Shots on target, %", "Goal conversion, %","Market value", 
                               "Age", "Minutes played")
, ~(scale(.) %>% as.vector))


# Assign weights to each variable
weights <- c(
  goals = .2,
  goals_per_90 = 0.15,
  defensive_actions_per_90 = 0.05,
  attacking_actions_per_90 = 0.1,
  shots_per_90 = 0,
  shots_on_target_pct = 0.1,
  goal_conversion_pct = 0.2,
  market_value = 0.1,
  age = 0.15,
  minutes_played = 0.15
)

# Calculate the composite score
df3$composite_score <- rowSums(sweep(df3[,-1], 2, weights, `*`))

sum(weights)

mean(df$`Goal conversion, %`)

