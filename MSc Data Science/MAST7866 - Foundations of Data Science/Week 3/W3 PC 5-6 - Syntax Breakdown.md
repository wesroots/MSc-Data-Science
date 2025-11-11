---
Module: Foundations of Data Science
Week Beginning: 2025-10-20
Note Type:
  - Lecture
tags:
  - MAST7866
---
> [!info] Purpose  
> **This note breaks down syntax and coding logic from the weekly PC sessions**  
> - It focuses on understanding specific R functions were used and how they connect to the week’s lecture material
> - Each section corresponds to a script in the GitHub repository

# PC5 [[PC5.R]]
## 1. Summation Basics
```R
sum(1:4)
sum(1,4)
```
- `:` -> sequence operator; `1:4` creates (1, 2, 3, 4)
- `sum(1:4)` -> 10
- `sum(1,4)` -> 5
## 2. Loops and Vector Sums
```R
n <- c(10, 20, 30)
sum(n)
```
- Sums vector `n`
```R
sum_n <- 0
for (i in 1:3) sum_n <- sum_n + n[i]
```
- `for` -> loops 1:3
- `n[i]` -> i-th value of vector `n`
- "For each number in 1 through 3, assign existing value of `sum_n` plus `n[i]` to `sum_n`"
```R
x <- c(2,5,1,8,9,3,4)
sum(x[2], x[4], x[6])
```
- Summing using position (`x[i]`)
- Adds 2nd, 4th, 6th entries → 16
## 3. Nested Arithmetic in Loops
```R
y <- 0
for (x in 1:4) y <- y + x*(x+1)
y
```
- Iterates x -> 1 through 4
- Adds `x * (x + 1)` each time
	- Takes each value in `1:4` as input for $x \cdot (x+1)$-> sums to 40
```R
result <- 0
for (z in 1:8) result <- z*(z+2) + result
result
```
Computes $\sum_{z=1}^{8} z(z+2)$
Loop adds $z \cdot (z+2)$ to `result` variable
## 4. Conditional Statements
```R
install.packages("MASS")
library("MASS")
data(anorexia)
attach(anorexia)
```
- `install.packages()` → downloads package (run once)
- `library()` → loads it into session
- `data([dataset])` → loads specific dataset
- `attach([dataset])` → allows direct column access (e.g. `Prewt`)
```R
if (Postwt[15] > Prewt[15]) {
  print("Patient gained weight after treatment")
} else {
  print("Patient did not gain weight after treatment")
}
```
- `if` -> logical condition
- Runs first block if TRUE, `else` if FALSE
- Index `[15]` compares patient 15’s weights
- `attach([dataset)]` again is bad practice
	- `anorexia$Prewt` -> far less ambiguous
### Better alternative for `attach([dataset])`
```R
install.packages(dplyr)
library(dplyr)

df <- data.frame([dataset])

df %>% filter(column_name > 60)
```
- `dplyr` -> R packages that replaces clunky base R syntax with verbs
- `<dataframe> %>% <function that uses columns from dataframe>`
## 5. Writing Simple Functions
```R
sum.n <- function(n) {
  y <- 0
  for (i in 1:n) { y <- y + i }
  print(y)
}
```
- Defines a new function `sum.n()`
	- `function(n)` -> one argument `n`
- Inside function, adds numbers 1:n, assigns to `y`
## 6. Challenge - Sum of Squares
```R
sum.square.n <- function(n) {
  y <- 0
  for (i in 1:n) { y <- y + i * i }
  return(y)
}
```
- Computes $\sum_{i=1}^{n}i^2$
- `return()` passes value back to caller
- `sum.square.n(4)` -> `[1] 30`
## 7. Challenge - Power Function
```R
pow <- function(x, y) {
  result <- x^y
  print(paste(x, "raised to the power of", y, "is", result))
}
```
- `^` -> power operator
- `paste()` -> joins text and numbers into one string
	- Similar to Python's f-string
- `pow(3,2)` -> `3 raised to the power of 2 is 9`
## 8. Challenge - Sum Even-Indexed Elements
```R
x <- c(4,2,7,8,3,5,8,9,2,4,3,14)
sum_even_x <- function(x) {
  sum_x <- 0
  y <- length(x)/2
  for (i in 1:y) sum_x <- sum_x + x[2*i]
  print(sum_x)
}
```
- `2*i` -> selects even positions (2, 4, 6, …)
	- Adds only even-indexed values

# PC6 [[PC6.R]]
## 1. Binomial Distribution
```R
dbinom(4, size = 12, prob = 0.2)
```
- `dbinom(x, size, prob)` → PMF
- Returns $P(X = x)$ for a binomial variable with `size` trials and success probability `prob`
- Example: P(exactly 4 successes in 12 trials with p = 0.2)
```r
pbinom(4, size = 12, prob = 0.2)
```
- `pbinom(q, size, prob)` → CMF $P(X ≤ q)$
- Equivalent to `sum(dbinom(0:q, size, prob))`
- Use `1 - pbinom(k, …)` for $P(X > k)$
	- Best practice to use `lower.tail = FALSE`
		- Important to remember, lower tail assumes $x-1$ as an argument for $> x-1$, not $x$ as an argument for $\geq x$ 
		- So `lower.tail=FALSE` is used to find prob. of **more than $q$ successes**
```R
rbinom(20, 12, 0.2)
```
- `rbinom(n, size, prob)` → simulate `n` random draws from $X \sim \text{Bin}(n = \text{size}, p = \text{prob})$
### Challenge 1
```R
dbinom(3, 6, 0.3) # Exactly 3
pbinom(2, 6, 0.3) # At most 2 (cumulative binom)
pbinom(2, 6, 0.3, lower.tail=FALSE) # More than 2 (3 or more)
```
- Example application to survey data
- Demonstrates “exactly”, “at most”, and “at least” probabilities
## 2. Poisson Distribution
```R
dpois(6, 2)
ppois(3, 2)
1 - ppois(6, 2)
```
- `dpois(x, lambda)` → probability of $x$ occurrences given mean rate $\lambda$
- `ppois(q, lambda)` → $P(X ≤ q)$ - use `ppois(q, lambda, lower.tail=FALSE)` for $P(X ≥ q + 1)$
- Events per interval
### Challenge 2
```R
dpois(0, 1.4) # 
ppois(0, 1.4, lower.tail=FALSE)
ppois(2, 2.8, lower.tail=FALSE)
```
- Probabilities for $0$ events, $\geq 1$ event, and $\geq 2$ events over two days $(\lambda × 2)$
## 3. Normal Distribution.
```R
norm <- rnorm(100, 2, 5)
norm[1:10]
mean(norm)
sd(norm)
```
- `rnorm(n, mean, sd)` → random sample from $N(\mu, \sigma)$
## 4. Assessing Normality
```R
qqnorm(trees$Height)
qqline(trees$Height)
```
- `qqnorm()` → plots sample quantiles vs. theoretical quantiles from a standard normal distribution
- `qqline()` → adds reference line; points near line → data ≈ normal
- A QQ plot compares sample data to a theoretical normal distribution
	- Checks whether data is normally distributed
- Values along x-axis are z-scores. The QQ plot demonstrates that an actual value of ~65 has a z-score ~-2; similarly, actual value of ~85 has a z-score of ~2 around mean ~75
### Challenge 3
```R
library(MASS)
attach(anorexia)
par(mfrow = c(1, 2))
qqnorm(Prewt); qqline(Prewt)
qqnorm(Postwt); qqline(Postwt)
```
- Loads `anorexia` dataset from MASS package
- Displays QQ plots for pre/post treatment weights side-by-side
	- Visual check for normality of each variable
![[anorexia_QQ.png]]
## 5. Best Practice and Common Pitfalls
- Avoid `attach()` - instead use `data$column`
- Always check distribution assumptions using plots (especially normality)
- Confirm that discrete vs continuous functions match the data type
- For Poisson across multiple intervals, multiply $\lambda$ by number of intervals
