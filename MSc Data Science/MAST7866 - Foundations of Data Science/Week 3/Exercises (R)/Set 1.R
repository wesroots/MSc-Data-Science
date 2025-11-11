# Question 1
dbinom(2, size=10, prob=0.1)
# When 10 bulbs tested -> 19.37% chance 2 of them are faulty

# Question 2
ppois(14, 1, lower.tail=FALSE)
# Prob = 0.00000000003000011%

# Question 3
n <- 8
p <- 0.6
mean1 = n*p # [1] 4.8
sd = sqrt(n*p*(1-p)) # Using binomial STDev momement formuala [1] ~1.39
# 8 trials -> expect 4.8 successes. No. of successes usually falls within 1.39 of mean

# Question 4
punif(4.4, 2, 5) - punif(2.8, 2, 5)
# 53.33% chance of falling between 2.8 and 4.4

# Question 5
pnorm(90, mean=100, sd=15) # [1] 0.2524925
pnorm(110, mean=100, sd=15) - pnorm(90, mean=100, sd=15) # [1] 0.4950149
pnorm(110, mean=100, sd=15, lower.tail=FALSE) # [1] 0.2524925
# Distribution is symmetric as P(X<90) = P(X>110)

# Question 6
ppois(3, 5) # [1] 0.2650259

# Question 7
# dbinom -> probability mass P(X=x) for binom dist.
# pbinom -> cumulative probability P(X<=x) for binom dist.
# rbinom -> creates binomially distributed data given p and n

# Question 8
# In a continuous distribution, the number of possible outcomes in continuous data is infinite
# The probability of any single exact value (P(X = c)) is 0 because it represents no measurable area under the curve
# In R, pnorm() gives cumulative probability P(X <= q), but for continuous data P(X < q) = P(X <= q), so it makes no difference.

# Question 9
# Example: the number of customers entering a supermarket
# As the probability of a customer entering the store is lower early in the morning than at midday, p is not constant
# This is poisson distribution

# Question 10
pnorm(-2, 0.08, 1.2)
# The probability of a 2% loss is 0.0415... or ~4.2%