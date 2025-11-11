# --- Task 1: Introductory Moodle video ---
# --- Task 2: Axioms of Probability Moodle video
# --- Task 3: Discrete Random Variables and Probability Distributions ---

# Task 4: Binomial Distribution ---
# Suppose: MCQ for class quiz, P(answering question correctly) = 1/5 = 0.2, 12 trials (questions)
# Finding prob of having exactly 4 correct answers by random attempts:
dbinom(4, size=12, prob=0.2)
# To find prob of having 4 or less correct answers by random attempts, we apply function dbinom with x=0:4
dbinom(0, size=12, prob=0.2)
dbinom(1, size=12, prob=0.2)
# ...
dbinom(4, size=12, prob=0.2)
# Alternatively we can use cumulative probability function for binomial dist. pbinom
pbinom(4, size=12, prob=0.2)
# We can use R to produce random samples from BD:
rbinom(20, 12, 0.2) # 20 samples, 12 trials, 0.2 success per trial

# --- Challenge 1 ---
# Notes: 30% too much time, sample of 6 students, assumed to represent population
dbinom(3, 6, 0.3) # Three students success
pbinom(2, 6, 0.3) # At most 2 students success
1 - pbinom(2, 6, 0.3) # At least three success

# --- Task 5: Poisson Distribution ---
# Suppose a washing machine breaks down on avg. 3x per month
# We want ti find prob of exactly two break downs next month - example of Poisson prob. dist.
# Each breakdown is an occurrence

# Example: Accounts opened per day at bank branch.
# (a) prob of exactly 6:
dpois(6,2)
# (b) prob of at most 3:
ppois(3,2)
# (c) prob of at least 7:
1-ppois(6,2)

# --- Challenge 2 ---
# Sells 1.4 policies per day
# Find prob of exactly 0 policies
dpois(0, 1.4)
# Find prob of at least 1 policy
1-ppois(0,1.4)
# Find prob of at least 2 over 2 days
1-ppois(2, 2.8)

# --- Task 6: Random Variables - Continuous Moodle video ---

# --- Task 7: Normal Distribution ---
# We can generate random samples from normal distribution
# Draw a sample of size 100 from normal distribution with mean 2 and STDev 5
norm <- rnorm(100, 2, 5)
# First 10 observations
norm[1:10]
mean(norm)
sd(norm)

# --- Task 8: Assessing Normality ---
# The dataset provides
qqnorm(trees$Height)
qqline(trees$Height)

# --- Challenge 3 ---
library(MASS)
attach(anorexia)

par(mfrow=c(1,2))
qqnorm(Prewt)
qqline(Prewt)

qqnorm(Postwt)
qqline(Postwt)
