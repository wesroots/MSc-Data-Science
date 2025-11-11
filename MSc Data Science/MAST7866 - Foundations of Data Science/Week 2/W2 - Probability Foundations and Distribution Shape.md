---
Module: Foundations of Data Science
Week Beginning: 2025-10-13
Note Type:
  - Lecture
tags:
  - MAST7866
---
>[!note] Lecture Notes (Post-Lecture Checklist)
>**These points were written during the lectures + seminars throughout the week to capture key ideas and actions for review - the following notes expand on checklist items through post-lecture reflection and structured consolidation**
>### PC3/4
>- Positive-negative skew meaning (mode)
>- Relationships between shapes/measures
>	- How types of skew relate to measures of location
>- Kurtosis of distributions
>	- Positive/negative excess kurtosis (platykurtic, leptokurtic)
>- Moments of distribution
>	- Obtaining moments in R
>	- Product moment correlation coefficient
>- Z score
>### Lecture
>- Kolmogorov's axioms
>	- Deductions of axioms
>- Conditional probability formula
>	- Conditional vs joint probabilities
>- Spearman rank correlation
>	- R syntax
>- Product moment

---

# 1. Probability Fundamentals
## Kolmogorov's Axioms
1. For any event $A$ -> $0 \leq P(A) \leq 1$
2. $P(\Omega) = 1$, where $\Omega$ is the sample space
3. For mutually exclusive events $A$, $B$ -> $P(A \cup B) = P(A) + P(B)$
## Derived Results of Kolmogorov's Axioms
- Complement -> $P(A^c) = 1-P(A)$
- Union (general) -> $P(A \cup B) = P(A) + P(B) - P(A \cap B)$
- Finite outcomes -> $P(A) = \tfrac{\text{favourable outcomes}}{\text{total outcomes}}$
## Interpretations - (Conditional, Joint, Independent)
### Conditional
Likelihood of $A$ given $B$
- Notation -> $P(A \mid B) = \tfrac{P(A \cap B)}{P(B)}$
### Joint
Both occur simultaneously
- $P(A \cap B)$
### Independent
One event doesn't affect the other
- Rule -> $P(A \cap B) = P(A) \cdot P(B)$
- Notation -> $A \bot B$

# 2. Shapes of Distributions
**Important Note:**
- $\bar{x}$ -> *sample* mean
- $\mu$ -> *population* mean
## Common Shapes
- Symmetric -> mirror image around mean (e.g., normal distribution)
- Uniform -> all values equally frequent
- Unimodal/bimodal -> one or two main peaks
## Skewness
$$
\text{Skewness} = \tfrac{\mathbb{E}[(X-\mu)^3]}{\sigma^3}
$$
Where:
- $X$ = random variable
	- Acts as a function on $\omega_i$
	- See bottom of note ("Additional: Random Variables")
- $\mu$ = mean of $X$
- $\sigma$ = STDev of $X$
- $\mathbb{E}[\cdot]$ = averages over all outcomes
- $X-\mu$ = distance from outcome $X$ from mean $\mu$
### Moments
**Moment** = a numerical measure that describes the shape of a probability distribution
- 1st moment ($\mathbb{E}[X]$) -> Mean (central location)
- 2nd moment about the mean ($\mathbb{E}[(X-\mu)^2]$) -> Variance (spread)
- 3rd moment about the mean ($\mathbb{E}[(X-\mu)^3]$) -> Skewness (assymetry)
- 4th moment about the mean ($\mathbb{E}[(X-\mu)^4]$) -> Kurtosis (tailedness/peakedness)
**Purpose**: quantitatively describe the shape of the distribution
### Interpretation of skewness

| Skew | Interpretation        | Relationship         |
| ---- | --------------------- | -------------------- |
| 0    | Symmetric             | mean = median = mode |
| > 0  | + skewed (right tail) | mean > median > mode |
| < 0  | - skewed (left tail)  | mean < median < mode |

## Kurtosis (4th Moment)
$$
\text{Kurtosis} = \tfrac{E[(X-\mu)^4]}{\sigma^4}
$$
- **Normal kurtosis** -> 3 (excess = 0)
- **Leptokurtic** (heavy tails) -> excess > 0
- **Platykurtic** (light tails) -> excess < 0
- **Mesokurtic** -> normal-like tails
**Excess** = how much the kurtosis differs from that of a normal distribution
- Kurtosis = 2 means excess is -1
- Excess is just relative to normal kurtosis of 3
![[Pasted image 20251017145752.png]]
### Purpose of the random variable $X$ in the kurtosis formula
As the random variable $X$ encodes outcomes as numbers, it allows us to derive kurtosis
- $\mathbb{E}$ represents average across all values
	- I.e., the average distance from the mean
$\tfrac{E[(X-\mu)^n]}{\sigma^n}$ does not equal 1 as:
- [p] $E[(X-\mu)^2]$ -> for every data point, take distance from mean, raise to $2$ then take the average
	- E.g., dataset $\{2,4,6\}$
		- $\mu$ = 4
		- Entire deviation from mean raised to $n$ = $\{(-2)^n, (0)^n, (2)^n\}= \{4,0,4\}$
		- $\therefore$ ->  $E[(X-\mu)^n] = \tfrac{8}{3} \neq 0$
- [c] $(E[X-\mu])^2$ -> average all deviations, raise to $2$
	- E.g., dataset $\{2,4,6\}$
		- $\mu$ = 4
		- Deviations from mean individually raised to $2$ = $-2,0,2$
			- Average deviations = $0$
			- Average deviations to the power of $2$ = $0$
		- $E[(X-\mu)]^n = 0$ (WRONG)
## R Code
```R
data <- c(2, 3, 5, 7, 11, 13, 13, 13)

install.packages("moments")
library(moments)
skew_value <- skewness(data)
kurt_value <- kurtosis(data)

> skew_value
# [1] 0.356789
> kurt_value
# [1] 2.845123
```
# 3. Standardisation
## Z-score
Tells you how many STDevs a single data point is from the mean of the distribution - mean of z-scores is therefore 0
$$
z = \tfrac{x-\mu}{\sigma}
$$
### Interpretation (relativity to mean)
- $z>0$ -> above mean
- $x<0$ -> below mean
- Used for comparison across different scales or variables
	- $\therefore$ , z-score is used for standardisation for comparison between spreads
# 4. Correlation Between Variables
## Visualisation (Scatter Plots)
- Shows a relationship strength and form between two continuous variables
- Outliers can distort correlation, so always visualise first
## Pearson (Product-Moment) Correlation
### Intro
Often written as Pearson's $r$, measures strength and direction of a linear relationship between two continuous variables
- **Linear** = straight line -> change in $X$ causes proportional change in $Y$
	- $y=a+bX$
- Product moment refers to the product of deviations (differences from mean) for each pair of values
$$
r = \frac{\sum (x_i - \bar{x})(y_i - \bar{y})}{\sqrt{\sum (x_i - \bar{x})^2 \sum (y_i - \bar{y})^2}}
$$
**Interpretation of $r$ value**:
- 1 -> perfect positive linear
- -1 -> perfect negative linear
- 0 -> no linear relationship
### R Syntax
```R
cor.test(x,y) # Pearson
```
## Spearman's Rank Correlation
### Intro
Measures strength and direction of a monotonic relationship
- **Monotonic** = where $X$ and $Y$ move together
	- If $X_1 < X_2 \Rightarrow Y_1 \leq Y_2$ 
	- Decreasing monotonic -> as $X$ ↓, $Y$ ↓
	- Increasing monotonic -> as $X$ ↑, $Y$ ↑
	- Not necessarily in a straight line
### R Syntax
```R
cor.test(x, y, method = "spearman")
```
## Uses Cases (Spearman or Pearson Correlation)
- **Linear relationship, normal data** -> Pearson
- **Non-linear but monotonic** -> Spearman
- **Outliers or ranked data** -> Spearman

# 5. Practical R Summary
## Tabled Summary

| Task                         | Function                             |
| ---------------------------- | ------------------------------------ |
| Compute Pearson correlation  | `cor.test(x,y)`                      |
| Compute Spearman correlation | `cor.test(x,y, method = "spearman")` |
| Compute skewness             | `skewness(data)`                     |
| Compute kurtosis             | `kurtosis(data)`                     |
| Compute z-scores             | `(x-mean(x)) / sd(x)`                |

# 6. Additional: Random Variables
## Pre-Reading Summary
$X$ is a function that maps physical outcomes (such as a die face outcome) to quantitative outputs
1. $\omega$ (raw outcome) is the input to the function $X$ ($X(\omega$))
2. Random variable (function) $X$ assigns a number to each outcome (like an index)
	- E.g., $X(\omega) \in {1,2,3,4,5,6}$
3. This way, each physical outcome is mapped to an "index" number for mathematical use

# Weekly Exercises
## ✅ Set 1
**1.** Define each of Kolmogorov’s three axioms and explain why they guarantee probabilities sum to 1.

**2.** If $P(A)=0.4$, $P(B)=0.3$, $P(A\cap B)=0.1$, compute $P(A\cup B)$ and $P(A\mid B)$, then state whether $A$ and $B$ are independent.

**3.** A die is rolled once.  
- (a) List $\Omega$
- (b) Find $P(\text{even or >4})$
- (c) Find $P(\text{even | >4})$

**4.** Describe in one sentence the difference between **joint**, **conditional**, and **independent** probabilities.

**5.** Explain what the **first four moments** of a distribution represent and how each relates to its shape.

**6.** Compute **skewness** and **kurtosis** for  
- `data <- c(1,2,3,4,6,9)` using `moments` package.
- Interpret both values qualitatively.
 
**7.** For a dataset with $\mu=50$, $\sigma=5$, $x=65$, compute the z-score and interpret its meaning.

**8.** Distinguish **Pearson** vs **Spearman** correlation in:  
- (a) type of relationship measured
- (b) sensitivity to outliers
- (c) R syntax.
## Set 2
**1.** Using Kolmogorov’s axioms, derive the **complement** and **general union** formulas for two events.

**2.** A trader’s alerts: $P(A)=0.3$ (price jump), $P(B)=0.4$ (news release), $P(A\cap B)=0.12$.
- Compute $P(A\cup B)$, $P(A^c \cap B)$, and $P(A\mid B)$.

**3.** Given a discrete sample space of equally likely outcomes, explain why $P(A)=\tfrac{\text{favourable}}{\text{total}}$ is consistent with the axioms.

**4.** Two funds show rank correlation 0.88 but Pearson 0.62. Explain what this reveals about their joint behaviour.

**5.** Write an R snippet that computes both Pearson and Spearman correlations and returns the $p$-values.

**6.** For dataset `c(2,3,5,7,11,13,13,13)`, run `skewness()` and `kurtosis()` then explain how each reflects the histogram shape.

**7.** Derive why the **mean of all z-scores** in a dataset equals 0 and the standard deviation equals 1.

**8.** If a variable’s distribution has excess kurtosis = 1.5, name its type and describe its tails relative to a Normal.

**9.** State two scenarios in which Spearman’s correlation is preferred to Pearson’s.

**10.** Describe how random variables enable mathematical operations on physical outcomes, referring to the mapping $X(\omega)$ concept.