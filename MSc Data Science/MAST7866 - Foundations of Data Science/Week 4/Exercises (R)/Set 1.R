# Question 1
xbar <- 50
sigma <- 8
n <- 25

z <- qnorm(0.975) # qnorm gives distance of CVs from bar{x} as a z-score

lower <- xbar - z * sigma / sqrt(n)
upper <- xbar + z * sigma / sqrt(n)

c(lower,upper)

# Question 2
t.test(sample_data, mu=0.5, conf.level=0.99)

# Question 3
set.seed(42)
sample1 <- rnorm(40)
t.test(sample1, conf.level=0.99)

# Question 4
prop.test(48, 80, conf.level=0.95)

# Question 5
returns <- rnorm(50)
t.test(returns, mu=0, alternative="greater")

# Question 6
A <- rnorm(50, mean=12)
B <- rnorm(65, mean=10)
t.test(A, B)

# Question 7
height <- rnorm(50)
ci_height <-
  t.test(height, conf.level=0.90)$conf.int

# Question 8
z8 <- qnorm(0.975)
n8 <- ((z8 * 6) / 1.5)^2
n8

# Question 9
prop.test(547, 1000, p=0.5, alternative="greater") # Difference exists

# Question 10
sample10 <- rnorm(30, mean=100, sd=15)
result10 <- t.test(sample10)
confidence_int10 = c(result10$conf.int[1], result10$conf.int[2])
confidence_int10[1]
