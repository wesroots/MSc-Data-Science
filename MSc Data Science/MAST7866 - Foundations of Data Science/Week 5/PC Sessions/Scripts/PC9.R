# --- Task 1: Introduction ---

# --- Task 2: Testing for differences between means (independent samples) ---
# Example 1: Effect of caffeine on muscle metabolism
# alpha = 0.05 by default
placebo <- c(105, 119, 100, 97, 96, 101, 94, 95, 98)
caffeine <- c(96, 99, 94, 89, 96, 93, 88, 105, 88)

t.test(placebo, caffeine, conf.level=0.95)
# as p > alpha -> fail to reject H_0

# --- Challenge 1 ---
t.test(mtcars$mpg~mtcars$am)
# Given alpha = 0.05, p < alpha.
# Therefore, we reject H_0 -> there is a difference between mpg and am

# --- Task 3: Testing for differences between means (dependent samples) ---
# Example 2: patient weight between trials
library(MASS)
data(anorexia)
attach(anorexia)
t.test(Postwt, Prewt, paired=TRUE, alternative="greater")
# t is large, p is 0.0022. Assuming alpha = 0.05, there is a significant difference

# --- Challenge 2 ---
sea_level = c(48.3, 47.9, 50.2, 51.7, 46.5, 44.9, 45.2, 47.7, 48.4, 49.1)
high_altitude = c(48.7, 49.2, 50.1, 51.9, 48.2, 45.8, 48.0, 47.3, 50.2, 51.5)

t.test(sea_level, high_altitude, paired=TRUE, alternative="greater")

# --- Task 4: Testing for differences between proportions ---
# Example 3: cancer drug effectiveness
prop.test(x = c(49,34), n = c(75, 60))

# --- Challenge 3 ---
# 500 male voters showed 57%
# 400 female voters showed 55%
prop.test(c(500*0.57, 400*0.55), c(500, 400), alternative="two.sided")
# Conclusion: p > alpha -> fail to reject H_0
# Size of p indicates groups are similar proportionally