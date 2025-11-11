---
Module: Foundations of Data Science
Week Beginning: 2025-10-20
Note Type:
  - Lecture
tags:
  - MAST7866
---
>[!note] Lecture Notes (Post-Lecture Checklist)
>**These points were written during the lectures + seminars throughout the week to capture key ideas and actions for review - the following notes expand on checklist items through post-lecture reflection and structured consolidation**
>### PC5/6
>- Binomial distribution
>	- Conditions of BD
>	- Formula understanding
>- Mean/STDev of BD
>- Poisson distribution
>	- Conditions
>	- Formula understanding - role of $\lambda$
>- Difference between `pbinom`/`dbinom`/`rbinom` & `dpois`/`ppois`
>- `1-ppois()` ect. understanding
>### Lecture
>- X~U(a,b) notation - uniform distribution
>- Mean and variance of uniform notation
>- Normal distribution
>	- Conditions
>	- Range
>- Binomial notation - $\binom{n}{x}$

---

# 1. Binomial Distribution $X \sim \text{Bin}(n,p)$ (Discrete)
## Theory (Core)
Binom. dist. models the number of successes
**Conditions:** fixed $n$, independent trials, two outcomes, constant success prob $p$
### Example - coin flip 20 times
- $n$ -> number of trials
- $p$ -> probability of success per trial
- $X$ -> random variable containing number of successes
	- Can take values $0,1,2,...,n$
## Probability Formula (PMF)
PMF calculates $P(X=x)$ or height on a probability bar chart
**Example:**
![[Pasted image 20251025105021.png]]
$$
P(X=x)=\binom{n}{x}p^x(1-p)^{n-x} \quad x=0,...,n
$$
Where:
- $\binom{n}{x}$ -> **binomial coefficient** "number of ways to choose $x$ successes from $n$ trials"
	- Counts all possible combinations successes can appear in
- $p^x$ -> probability that $x$ trials succeed
	- $p$ is individual trial's success rate
- $(1-p)^{n-x}$ -> probability that remaining $n-x$ fail

**Everything is multiplied because they all must happen together**
So the formula means:
- Probability = (number of patterns with $x$ successes) $\times$ (probability of one such pattern)
## Moments (Important Formulae)
**Moments**: main numerical summaries that describe a distribution's shape
- For binomial distribution (moments calculated take these forms):
$$
\begin{array}
\mathbb{E}[X] = np \\ \\
\text{Var}(X) = np(1-p) \\ \\
\sigma = \sqrt{np(1-p)}
\end{array}
$$
Where:
- $\mathbb{E}[X]$ -> "expected value" or mean
- $\text{Var}(X)$ -> another form of mean of squared distances from the mean
- $\sigma$ -> STDev
## Binomial Coefficient (PMF Relation and R/Python Code)
The BC is a counting term - how many different ways to get $x$ in $n$ trials
$$
\binom{n}{x} = \tfrac{n!}{x!(n-x)!}
$$
- Appears in PMF as a multiplier, it scales up a single outcome's probability $p$ to include all possible orders of that pattern
	- One outcomes probability = $p^x(1-p)^{n-x}$
### Code:
**R**
```R
choose(n,x)
```
**Python**
```python
math.comb(n,x)
```
Rarely used in practice, functions below already include it inside the formula - usually no need to calculate on its own
## Worked Example - R Code
**Example:** $n=20$, $p=0.30$ - Compute $P(X=7)$ , $P(X \leq 7)$, $P(X \geq 7)$
```R
dbinom(7, size=20, prob=0.30) # P(X = 7)
pbinom(7, size=20, prob=0.30) # P(X <= 7)
1-pbinom(6, size =20, prob=0.30) # P(X >= 7)
```
- $P(X=7)$ -> probability of 7 successes
- $P(X\leq7)$ -> probability of at most 7 successes
- $P(X\geq7)$ -> probability of at least 7 successes

# 2. Poisson Distribution $X\sim\text{Pois}(\lambda)$ (Discrete)
## Theory (Core)
**PD:** How many times an event happens within a fixed interval (of time, space or area)
**Conditions:** counts in a fixed interval, independent events, constant average rate $\lambda$
## PMF
$$
P(X=x) = \tfrac{\lambda^xe^{-\lambda}}{x!}, \quad x \in \mathbb{N}
$$
where:
- $X$ -> random variable - e.g., number of emails per hour
- $x$ -> specific count we want probability for, e.g., exactly 3 emails
- $\lambda$ -> average rate of events per interval
## Worked Example - R Code
**Example:** $\lambda = 4.5$ - Find $P(X=0)$, $P(X \leq 3)$ $P(X\geq3)$
```R
dpois(0, lambda=4.5) # P(X = 0)
ppois(3, lambda=4.5) # P(X <= 3)
1 - ppois(2, lambda=4.5) # P(X >= 3)
```
## R Function Family Mapping (Binomial & Poisson)

| Prefix | Meaning                     | Example           | Description                                                              |
| ------ | --------------------------- | ----------------- | ------------------------------------------------------------------------ |
| `d*`   | PDF/PMF                     | `dbinom`, `dpois` | $P(X=x)$                                                                 |
| `p*`   | CDF (discrete & continuous) | `pbinom`, `ppois` | $P(X \leq x)$                                                            |
| `q*`   | Quantile                    | `qbinom`, `qpois` | Finds $x$ for given $p$ (reverse; opposite of CDF, not PDF or PMF)       |
| `r*`   | Random                      | `rbinom`, `rpois` | Generates `rbinom(n, size, p)`, `rpois(n, lambda)`, `rnorm(n, mean, sd)` |

# 3. Uniform Distribution $X\sim U(a,b)$ (Continuous)
**Note:** Discrete is not covered here as uniform distribution is a form of binomial distribution where $P(X=x)=\tfrac{1}{n}$
## PDF
$$
f(x) = \tfrac{1}{b-a}\ \text{for} \ a <x<b, \ \text{else} \ 0
$$
$\text{else} \ 0$ -> probability density is zero for any value outside range , $b$
- CB is bounded between $a$ and $b$
$\tfrac{1}{b-a}$ -> as total area under = $\text{height} \times \text{width}$
## CDF
$$
F(x) = \tfrac{x-a}{b-a} \ \text{on} \ [a,b]
$$
Tells you $P(X \leq x)$ - $X$ takes values up to $x$
## Worked Example - R Code
**Example:** $U(2,5)$ - $P(2.4 \leq X \leq 3.1)=(3.1-2.4)/(5-2)$
- Finding the probability that $X$ (can take values between 2 and 5) falls specifically between 2.4 and 3.1
```R
punif(x, min, max)
punif(3.1, 2, 5) - punif(2.4, 2, 5)

# Equal to (subrange)/(total range):
(3.1-2.4)/(5-2)
```
# 4. Normal Distribution $X\sim N(\mu, \sigma^2)$ (Continuous)
## Theory (Core)
### Support: $(-\infty, \infty)$. Symmetric about $\mu$
- $X$ can take any value in range $[-\infty, \infty]$
- Curve is symmetric around $\mu$
### Standardisation (Z-score)
Standardisation converts any normally distributed variable $X\sim N(\mu, \sigma^2)$
- Used to find the **Z-score**
![[Pasted image 20251025142222.png]]
$$
Z = \tfrac{X-\mu}{\sigma} \sim \mathcal{N}(0,1)
$$
- $\mathcal{N}$ -> shorthand for normal distribution
- E.g., if $X=175$, $\mu=170$, $\sigma=5$ -> $Z=\tfrac{175-170}{5}=1$
	- $\therefore$ ,  $X$ is 1 STDev above the mean $\mu$
### 68-95-99.7 rule
- ~68% of values lie $\mu \pm \sigma$
- ~95% of values lie $\mu \pm 2\sigma$
- ~99.7% of values lie $\mu \pm 3\sigma$
### Continuous: $P(X=c)=0$
$$
P(X=c)=0; \ \text{use intervals only}
$$
In continuous distributions, the probability of any exact value is zero because there are infinitely many possible values - probabilities expressed as intervals instead
## Worked Example - R Code
**Example:** $X \sim \mathcal{N}(100,15^2)$ - $P(90<X<110) = F(110) - F(90)$
- Find the prob. that $X$ normally distributed with $\mu=100$ and $\sigma=15$ falls between 90 and 110
```R
pnorm(110, 100, 15) - pnorm(90, 100, 15)
```
# 5. Quick Pitfalls
## Pitfalls
**Use MPF sums for discrete, integrals for continuous. Do not treat a PDF as a probability**
- For discrete variables (like Binomial), probabilities come from summing PMF values
- For continuous variables (like Normal), probabilities come from integrating the PDF over an interval
- A single PDF value is not a probability - it's a density
**For tails in R, use `lower.tail=FALSE` instead of `1-p*()` for extreme values
- When finding right-tail probabilities in R, you can use either
- The former is more numerically stable for very large or small values (less rounding error)
**Check Binomial conditions before applying, if $p$ not constant or trials are dependent, use another model
- If any of the Binomial conditions fail, another distribution must be used

# 6. Finance-Oriented Mini-Exercises
## Exercises
1. Binomial: 10 day window, $p=0.55$. Compute $P(X\geq 7)$
```R
pbinom(6, size=10, prob=0.55, lower.tail=FALSE)

# [1] 0.2660379
```
2. Poisson: order flow $\lambda = 12/\text{min}$. Find probability of at least one 5-second gap with zero orders in a minute
```R
ppois(0, 1)
(1-ppois(0,1))^12
1-(1-ppois(0,1))^12

# [1] 0.99593
```
3. Normal: if daily returns $R \sim \mathcal{N}(0.08\%, (1.2\%)^2)$, compute $P(R < -2\%)$
```R
pnorm(-2, mean=0.08, sd=1.2)

# [1] 0.04151822
```
4. A trader executes an average of 15 orders per hour. What is the probability that 5 or fewer occur in a 20-minute span? 
```R
ppois(5,5)

# [1] 0.6159607
```
5. Over 12 trading sessions, a short-term strategy has a 0.4 chance of profit each day. What is the probability of at least 8 profitable days?
```R
1-pbinom(7,12,0.4)

# [1] 0.05730992
```
6. A portfolio’s daily excess return has $\mu = 0.05\%$ and $\sigma = 0.9\%$. What is the probability of a loss worse than –1%?
```R
pnorm(-1,0.05,0.9)

# [1] 0.1216725
```

# Weekly Exercises
## ✅ Set 1
**1.** A factory tests light bulbs with failure probability $p=0.1$.  
Find $P(X=2)$ when 10 bulbs are tested. Explain what this probability means.

**2.** In a one-hour window an exchange averages 12 price updates.  
What is the probability that $X\geq 15$ in a 5-minute span?
(Adjust $\lambda$ first, then compute.)

**3.** A coin is flipped $n = 8$ times.  
Find the mean and standard deviation of $X\sim\mathrm{Bin}(8,0.6)$ and interpret them.

**4.** For $X\sim U(2,5)$, compute $P(2.8\leq X \leq 4.4)$ and explain the geometric meaning.

**5.** A variable $X\sim \mathcal{N}(100,15^2)$. Find $P(X<90)$, $P(90<X<110)$, and $P(X>110)$. 
Comment on symmetry.

**6.** A trader executes an average of 15 orders/hour.  
Find the probability of $\leq 3$ orders in a 20-minute window. Interpret $\lambda$.

**7.** Differentiate `dbinom`, `pbinom`, and `rbinom` in one sentence each.

**8.** Explain why $P(X=c)=0$ for continuous $X$ and what this means for R code using `pnorm`.

**9.** A binomial model assumes $p$ is constant and trials are independent.  
List one practical scenario where this fails and name a more appropriate model.

**10.** If a Normal variable $R$ has $\mu=0.08\%$, $\sigma=1.2\%$, find $P(R<-2\%)$ and state what this tells an investor.

___

## Set 2
**1.** A start-up reports 5 website crashes per day on average.  
(a) What is $\lambda$ for a 6-hour period?  
(b) Find $P(X\leq2)$ for that period and interpret.

**2.** Suppose $X\sim\mathrm{Bin}(20,0.25)$.
Compare $P(X\ge8)$ with the Normal approximation using continuity correction.

**3.** Why is the Poisson distribution often a limit of the Binomial?  
Explain in one paragraph referencing $n\rightarrow \infty$, $p\rightarrow 0$, $np = \lambda$

**4.** Compute $P(90<X<120)$ for $X\sim\mathcal{N}(100,15^2)$.
Convert the endpoints to Z and show the intermediate step.

**5.** For $U(0,10)$, find mean $\mu$ and variance $\sigma^2$; then derive the probability that $X>8$.

**6.** You simulate 1000 draws from $X\sim\mathrm{Bin}(10,0.4)$.
Estimate the sample mean and compare it to the theoretical $E[X]$.

`x <- rbinom(1000,10,0.4)` - `mean(x)`

**7.** A firm expects on average 3 errors per report.  
Find the probability of at least one error in five independent reports.  
State any assumptions made.

**8.** Write the R expression to get the 95th percentile of a Normal(0,1).  
Explain what that number means.

**9.** Describe how `lower.tail=FALSE` improves numerical stability for extreme tail probabilities.

**10.** Outline three key checks before applying a Binomial model to empirical data.
