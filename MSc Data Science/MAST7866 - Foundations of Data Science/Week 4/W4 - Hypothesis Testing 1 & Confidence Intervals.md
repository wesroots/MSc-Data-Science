---
Module: Foundations of Data Science
Week Beginning: 2025-10-27
Note Type:
  - Lecture
tags:
  - MAST7866
---
>[!note] Lecture Notes (Post-Lecture Checklist)
>**These points were written during the lectures + seminars throughout the week to capture key ideas and actions for review - the following notes expand on checklist items through post-lecture reflection and structured consolidation**
>### PC7/PC8
>- Interval estimation -> using sample data to estimate a parameter of the entire population - includes certain confidence level
>- $X \sim f(x,\theta)$
>	- $\theta$ - vector of parameters (e.g., $\mu$, $\sigma$) - role of $\theta$
>- $\pi$ notation -> population proportion
>	- Proportion of population with specific characteristic
>- Point estimate, margin of error, confidence interval
>- Confidence interval notation - $(1-\alpha)100\%$
>	- $\alpha$ = probability of being wrong
>- R behaviour -> treating data as sample, not population in `t.test(data1, conf.level=0.99)`
>- "$\sim$" notation -> "distributed as"
>- `t.test()` can run with/without $H_0$
>	- R assumes $N$ is infinitely large - standardised across testing
>- One tailed -> $H_0$ always includes equality ($=$)
>- Purpose of population proportion testing & significance
>- High $\alpha$ -> easier to call something significantly different
>	- $\alpha$ = cutoff for rejecting $H_0$
>### Lecture
>- Statistical inference - parametric conclusions
>- Hypothesis testing - relationship between $\alpha$ and $p$-value
>- Type I error -> $\alpha$ relevance
>	- Concluding effect exists when there isn't one -> reject a true $H_0$
>	- Determinants of Type II probability
>- $p$-value -> probability of observing test statistic as extreme as sample if $H_0$ were true
>	- $p\leq\alpha$ -> reject $H_0$ -> difference
>	- $p>\alpha$ -> fail to reject $H_0$ -> no difference
>- One- vs two-tailed tests
>	- $H_1$ -> $\mu \neq \mu_0$ -> two-tailed
>	- $H_1$ -> $\mu > \mu_0$ or $\mu < \mu_0$ -> one-tailed
>- Meaning of power ($\text{Power} = 1-\beta$)
>- General R syntax
>- $1 - \text{pnorm}(\hat{m}_{obs}, 30, (\tfrac{\hat{\sigma}}{\sqrt{50}})^2)$

---

# 1. Point vs Interval Estimation
## Definitions
- **Estimator** - formula used to calculate and unknown population value from sample data, e.g. $\bar{X}$ estimates $\mu$ ($\bar{x}$), $\hat{P}$ estimates $\pi$ ($\bar{p}$;estimating proportion from sample)
	- E.g., `prop.test()`
	- IMPORTANT DISTINCTION  - the output of an estimator *is* $\bar{x}$, $\hat{p}$, etc.
		- The output (sample parameter) acts as an estimation for the population parameter
- **Point estimate** - numerical value produced by estimator, e.g., $\bar{x} = 50$
- **Interval estimate (CI)** - $\text{estimate} \pm \text{margin of error}$, with stated confidence
	- CI only for two tailed tests
- **Critical value** - the cut-off point on a probability distribution that defines the edge of the region defined by the significance level
## Why Intervals?
Sampling varies -> a single point almost always misses true value - CIs express precision and also uncertainty
# 2. Confidence Intervals for Means
**Purpose:** CI gives an estimated range for the population mean $\mu$ based on a sample mean $\bar{x}$
- Reflects variability and desired confidence level $(1-\alpha)$
- Used to express uncertainty around an estimate - rather than single point
**Assumptions:**
- Random, independent, identically distributed sample
- Either population is Normal or sample size $n$ is large (CLT $\approx$ Normal - explained below)
- Each sample observation contributes equally to the mean
## Central Limit Theory
When random samples of size $n$ are taken from population, the distribution of sample means is approximately normal:
**Real data:**
![[Pasted image 20251031160235.png]]
![[Pasted image 20251031160238.png]]
**When population is normal:** $\bar{x}$ will be normally distributed
**When sample size $n$ is large:** unlikely random sampling will pick an extreme or one-sided group
### Why CLT is useful:
The CLT is what justifies why R can apply formulae such as:
$$
\bar{x} \pm t_{\alpha/2}\tfrac{s}{\sqrt{n}}
$$
Formulae calculating confidence intervals wouldn't be valid for non-Normal data
## When Population STDev $\sigma$ is Known (z-based CI; R Syntax)
If the population variance $\sigma^2$ is known:
$$
\begin{array}{c}
\bar{X} \sim \mathcal{N}(\mu, \tfrac{\sigma^2}{n}) \\
\text{CI}_{(1-\alpha)} : \bar{x} \pm z_{1-\alpha/2}\tfrac{\sigma}{\sqrt{n}}
\end{array}
$$
**First line:** describes how sample means behave across repeated samples from same population
**Second line:** CI (at confidence level $1-\alpha$): $\bar{x}$ $\pm$ the z score that cuts off the top and bottom $\alpha/2$ of the Normal curve
**In summation:** z-score multiplied with standard error $\tfrac{\sigma}{\sqrt{n}}$ to scale z-score into data's units. This result is subtracted and added to $\bar{x}$ to find CI
### R syntax
```R
xbar <- mean(x)
n <- length(x)
sigma <- 10          # known population SD
z <- qnorm(0.975)    # for 95% CI

lower <- xbar - z * sigma / sqrt(n)
upper <- xbar + z * sigma / sqrt(n)
c(lower, upper)
```
**Almost never used - population $\sigma$ rarely ever known**
## When Population STDev $\sigma$ is Unknown (t-based CI; R Syntax)
Replace $\sigma$ with sample STDev $s$ - test statistic now follows t-distribution with $n-1$ degrees of freedom
$$
\text{CI}_{1-\alpha} : \bar{x} \pm t_{1-\alpha/2, n-1} \tfrac{s}{\sqrt{n}}
$$
where:
- $t_{1-\alpha/2, n-1}$ -> t-critical value (estimate of z-score)
	- $1-\alpha/2$ -> parameter for significance level
	- $n-1$ -> degrees of freedom
		- DoF represent how much information the sample has to estimate $\sigma$
		- Using $n-1$ applies Bessel's correction -> removes small-sample bias in the sample variance $s$
### Notes
- Use t-distribution whenever $\sigma$ is unknown sample size $n$ sub 30
- As $n \rightarrow \infty, t_{1-\alpha/2, n-1} \rightarrow z_{1-\alpha/2}$
- Wider tails -> wider CI -> more conservative when sample size is small
## Worked Example + R
**Problem:** a random sample of 25 daily returns has $\bar{x}=0.6\%$ and $s=1.5\%$. Find the 95% CI for $\bar{X}$ return.
```R
# One-sample mean CI (t by default)
t.test(x, conf.level=0.95) # Where x is a vector of data

# same with explicit H_0: mu = 0
t.test(x, mu=0, conf.leve=0.95)

# example
ret <- c(0.3, 1.1, 0.4, -0.2, 1.7, 0.9)
t.test(ret)
```
When $\mu$ is not provided, R assumes $\mu=0$ and print $p$-value accordingly
## Calculating Sample Size Given $E$ (R Syntax)
$E$ is used to denote the half width of the CI
- To obtain a CI with half-width $E$:
$$
n = (\tfrac{z_{1-\alpha/2}\sigma}{E})^2
$$
```R
n <- (z * sigma / E)^2

# E.g.:
n <- (qnorm(1-alpha/2) * 1.5 / 0.4)^2
```
# 3. Confidence Intervals for a Proportion ($\pi$)
**Purpose:** Estimate the population proportion $\pi$ from a sample of $n$ Bernoulli trials using a $(1-\alpha)100\%$ CI around $\hat{p}$
- Bernoulli -> single experiment with two outcomes
- "Estimating $\pi$ from sample size $n$ using given CI around the sample proportion"
**Assumptions:**
- Random, independent trials - identical success $p$ between trials
- Can only use normal-based CI for a proportion when both number of expected successes $n\hat{p}$ and failures $n(1-\hat{p}) \geq 5$
	- Ensures sample is large enough for binom. distribution of $\hat{p}$ to be approximated by a normal distribution
## Sampling Distribution of $\hat{p}$
The distribution of all possible sample proportions
$$
\hat{p} \approx \mathcal{N} \begin{pmatrix} \pi , \tfrac{\pi(1-\pi)}{n} \end{pmatrix}
$$
Sample proportion $\hat{p}$ is approximately normally distributed around true population proportion $\pi$ when the sample is large
- $\tfrac{\pi(1-\pi)}{n}$ -> variance of sampling distribution
## Standard Error for $\hat{p}$
$SE(\hat{p})$ -> standard error of the sample proportion
- Measures how much sample proportion $\hat{p}$ varies from sample to sample
$$
SE(\hat{p}) = \sqrt{\tfrac{\hat{p}(1-\hat{p})}{n}}
$$
This states that $SE(\hat{p})$ is calculated as the mean of variance of sample distributions
- $\hat{p}$ used here as we don't know $\pi$
- Comes from theory, can yell you how accurate a sample size $n$ is
## CI Formula (z-based)
$$
\text{CI}_{1-\alpha/2} : \hat{p} \pm z_{1-\alpha/2} \cdot \sqrt{\tfrac{\hat{p}(1-\hat{p})}{n}}
$$
**Meaning:** CI for proportion = sample proportion $\hat{p}$ $\pm$ z -score of half the confidence level, multiplied by the standard error of $\hat{p}$ to scale z-score to data's units
## R Syntax (`prop.test()`) + Worked Example
### One-sample proportion CI and test:
```R
prop.test(x, n, conf.level=0.95, correct=TRUE) # corect=TRUE when sample size is small
```
- `x` = number of successes, `n` = trials
- Output includes CI and hypothesis test ($p$-value); by default continuity correction applied
### Worked Example
```r
prop.test(567, 1000, conf.level = 0.95)
```
Output 95% CI $\approx (0.536, 0.598)$ 
# 4. Hypothesis Testing
**Purpose:** decide if sample evidence contradicts a null claim about a population parameter at level $\alpha$. Output is a decision: reject $H_0$, or fail to reject $H_0$
**Assumptions:**
- Random, independent sample
- Mean tests: Normal population or large $n$, so $\bar{X}$ is approx Normal
- Proportion tests: large-sample rule $np$ and $n(1-p) \geq 5$
## Test Statistic
A number ($t$ or $z$) that measures how far your sample result such as $\bar{x}$ is from what $H_0$ claims, in standard error units
- Big values -> sample result unlikely under $H_0$
## Tails
Decide what kind of difference is being tested for:
- Two-tailed -> any difference
	- $H_1:\ \neq$ -> two-tailed ($\alpha/2$ in each tail)
- Right-tailed -> greater than
	- $H_1 :\ >$
- Left-tailed -> less than
	- $H_1: \ <$
## Significance Level and Decision Rule
Pick $\alpha$ (usually 0.05)
- If $p<\alpha$ -> reject $H_0$ -> there is a change
	- Probability of seeing data this extreme if $H_0$ were true is smaller than the threshold ($\alpha$) we're willing to accept
- If $p>\alpha$ -> fail to reject $H_0$ -> there is no change
	- The data are not rare enough under $H_0$ to conclude it's false
## $p$-value
Probability under $H_0$ of getting test statistic (or more extreme) if $H_0$ were true
- Low $p$ means data disagree with $H_0$
## Errors and Power
- **Type I error:** reject true $H_0$. Probability = $\alpha$
	- Probability is $\alpha$ as that is the probability data under $H_0$ falls in that interval
- **Type II error:** fail to reject false $H_0$. Probability $\beta$
- Power = $1- \beta$: probability of correctly rejecting $H_0$ when false

# Exercises
## Set 1
**1.** Create variables `xbar <- 50`, `sigma <- 8`, `n <- 25`, and compute the 95% z-based confidence interval manually using `qnorm()`.

**2.** You have a numeric vector `sample_data` of size 25.  
Write R code to test whether its mean differs from 0.5 at the 99% confidence level.  
Ensure the test is **two-tailed**.

**3.** A numeric vector `sample1` contains 40 values.  
Write R code to obtain its 99% CI using `t.test()`.

**4.** Using `prop.test()`, construct a 95% CI for 48 successes out of 80 trials.

**5.** Perform a one-sample $t$-test on vector `returns` to check if $\mu=0$.  
Include the argument to make it one-tailed ($\mu>0$).

**6.** Write a command to test if two independent samples `A` and `B` have equal means, assuming equal variances.

**7.** Use `t.test()` with `conf.level=0.90` on vector `height` and store only the CI in a variable called `ci_height`.

**8.** Compute required sample size for margin of error $E=1.5$, known $\sigma=6$, $\alpha=0.05$.  
Use `qnorm()` and show formula in code.

**9.** Use `prop.test()` to test whether 567 out of 1000 respondents prefer product A, assuming $p=0.5$.  
Set `alternative="greater"`.

**10.** Generate a 95% CI for mean of simulated data `x <- rnorm(30, mean=100, sd=15)` using `t.test()` and extract the lower limit only.

---

## Set 2
**1.** For two samples `x` and `y`, perform a two-tailed test for difference in means with unequal variances and 99% confidence.  
Write the full `t.test()` command.

**2.** Create a loop that repeats a one-sample $t$-test on 100 simulated vectors from `rnorm(25,0,1)` and stores the resulting $p$-values in a vector `pvals`.

**3.** Using `prop.test()`, run a 90% CI on 150 successes out of 300 trials **without** continuity correction.

**4.** Write code to compute the _power_ of a one-sample $t$-test with `power.t.test()` given: `delta=5`, `sd=10`, `sig.level=0.05`, `n=25`.

**5.** Find $t_{0.975,,24}$ using `qt()` and explain in a comment what this number represents.

**6.** Simulate 10,000 sample means from `rnorm(20,50,10)` and compute the empirical 95% quantiles using `quantile()`; compare to the theoretical CI formula.

**7.** Use `t.test()` on `returns` but specify both `mu=0.02` and `alternative="less"`.  
Add a comment explaining what hypothesis this represents.

**8.** Compute a 99% CI for a proportion where `x=34`, `n=60`, then extract only the upper bound using list indexing.

**9.** Use `qnorm()` to find the z-score that cuts off the top 2.5% of a standard normal distribution.  
Verify with `pnorm()`.

**10.** Create a small function `ci_mean <- function(x, conf=0.95)` that returns the mean and its $t$-based CI for any numeric vector `x`.