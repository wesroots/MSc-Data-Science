# --- Task 1: Introducing Estimation ---
# --- Challenge 1 ---
x <- c(4, 7, 8, 4, 5, 6, 7, 3, 6, 7, 9, 8, 6, 4, 5, 7, 3, 6, 5, 8)
mean(x)

z <- sample(x,5, replace=FALSE)
mean(z)

# --- Task 2: Interval Estimation for the Population Mean ---
attach(parkrun)
t.test(Female, conf.level=0.95)

# --- Challenge 2 ---
install.packages("UsingR")
library(UsingR)
data1 <- ewr$AA

t.test(data1, conf.level=0.95)
t.test(data1, conf.level=0.90)
t.test(data1, conf.level=0.99)

# --- Task 3: Interval Estimation for the Population Proportion ---
# Example 3: Survey of 1000 people, 567 believe economy will grow
prop.test(567, 1000, conf.level=0.95)
# Output: [0.536, 0.598] -> true population believe lies within 53.6% and 59.8%

# --- Challenge 3 ---
# Notes: Sample 350 gives p = 0.42, sample 1000 gives the same p.
prop.test(0.42*350, 350, conf.level=0.95) # Output: [0.368, 0.474]
prop.test(0.42*1000, 1000, conf.level=0.95) # Output: [0.389, 0.451]
# Output smaller in 1000 sample due to sample size

