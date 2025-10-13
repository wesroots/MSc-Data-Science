---
Module: Foundations of Data Science
Lecture Date: 2025-10-01
Note Type:
  - Lecture
---
>[!note] Lecture Notes (Post-Lecture Checklist)
>**These points were written during the lecture to capture key ideas and actions for review - the following notes expand on checklist items through post-lecture reflection and structured consolidation.**
>- Binomial coefficient - definition and formula
>- Random sampling notation ($N, n, x, X, P(X=x)$)
>- Capture-recapture method (last slide of intro) - lincoln petersen + reasoning
>
 2nd slides content:
>- Sorting in RStudio
>- Sample mean method + all methods and RStudio methods in 2nd slides
>- Histograms of data in RStudio
>- Interpret mean, median, variance results in R outputs
>- Difference between sample and population formulas (n vs n-1)

---

# Sampling and Populations  
**Purpose:** understand how samples represent populations and why we estimate.
**Why sample?**
- Populations often too large to measure fully
- Sampling allows estimation with known uncertainty using probability theory
- Random sampling avoids bias and allows statistical inference
## Definitions (Die Roll Example)
### Sample space $\Omega$
- The set of all possible outcomes of an experiment (probability theory)
- $\Omega$
### Population $N$
- The entire set of individuals or items we're interested in
- $N$
- E.g., $\Omega = {1,2,3,4,5,6}, N = 6$
### Sample $n$
- A subset selected from the population for study
- $n$
- E.g., $N=4$, sample outcomes $\{2,3,5,6\}$
### Parameter $\mu$, $\sigma^2$, etc.
- Numerical summary describing a population
- E.g., population mean $\mu$, population variance $\sigma^2$
- Mean $\mu = \tfrac{1+2+3+4+5+6}{6} = 3.5$, variance $\sigma^2=\tfrac{(1-3.5)^2+...+(6-3.5)^2}{6}=2.9167$
### Statistic $\bar{x}$, $s^2$, etc.
- Numerical summary calculated from a sample
- E.g., sample mean $\bar{x}$, sample variance $s^2$
- Sample mean $\bar{x}=\tfrac{2+3+5+6}{6}=4$, sample variance $s^2=\frac{(2 - 4)^2 + (3 - 4)^2 + (5 - 4)^2 + (6 - 4)^2}{3} = 2.6667$
## Random Sampling Notation
- $N$ -> population size
- $n$ -> sample size
- $X$ -> random variable (represents population value before observing data)
- $x$ -> observed value of $X$ (actual data point)
- $P(X=x)$ -> probability that $X$ takes the value $x$
## Population Mean vs Sample Mean
### Population mean
$$
\mu = \tfrac{1}{N} \sum^N_{i=1}X_i
$$
- $\sum^N_{i=1}X_i$ -> add up all the mean values
- Formal notation of "sum all $X_i$ and divide by $N$"
### Sample mean
$$
\bar{x} = \tfrac{1}{n}\sum^n_{i=1}x_i
$$
- Same as above, just for sample instead of entire population
# Binomial Coefficient  
**Purpose:** understand how to count the number of ways certain outcomes can occur - the foundation of probability and sampling.
## Definition
The **binomial coefficient** gives the number of combinations of choosing $k$ outcomes (or "**successes**") from $n$ trials:
$$
\binom{n}{k} = \tfrac{n!}{k!(n-k)!}
$$
where:
- $n! = n \times (n-1) \times (n-2) \times ... \times 1$
- $k$ and $(n-k)!$ adjust for repeated orderings
Reads as "n choose k"
## Interpretation
Each selection of $k$ successes can occur in multiple arrangements, but the order does not matter
- E.g., when counting how many ways to get 2 heads in 3 coin tosses, we care about amount of combinations, not sequence of outcomes
## Worked + R Examples
### Worked
**Coin tosses:**
- Number of ways to get 2 heads in 3 tosses
- $\binom{3}{2}=\tfrac{3!}{2!(3-2)!}=3$
- Result = 3 ways (HHT, HTH, THH)
**Sampling:**
- Choose 2 people from a group of 5
- $\binom{5}{2}=\tfrac{5!}{2!(5-2)!}=10$
- 10 combinations
### R syntax
`choose(n,k)`:
```R
choose(5,2)
# [1] 10
```
## Relevance to Probability
In a **binomial distribution**, the coefficient appears inside probability formula:
$$
P(X=k)=\binom{n}{k}p^k(1-p)^{n-k}
$$

# Capture–Recapture Method (Lincoln–Petersen Estimator)  
**Purpose:** estimate population size using samples.  
## Step-by-Step Process
### 1. Capture
- Capture $n_1$ individuals from the population
- Mark or tag each one uniquely
- Release them back into the population to mix randomly
### 2. Recapture
- Later, capture another sample of $n_2$ individuals
- Count how many of these $m_2$ are already tagged
### 3. Estimate
- Assume the proportion of tagged individuals in the second sample represents the overall tagging rate of the population
$$
\tfrac{m_2}{n_2} \approx \tfrac{n_1}{N}
$$
Rearranging gives the **Lincoln-Petersen** estimate:
$$
\hat{N} = \tfrac{n_1n_2}{m_2}
$$
## Worked + R Examples
### Worked
- A biologist captures and tags $n_1=80$ fish in a lake
- Later, $n_2=30$ fish are caught, and $m_2=2$ are tagged
$$
\hat{N}=\tfrac{80 \times 30}{2} =1200
$$
### R
**No built-in Lincoln-Peterson estimator function** - a function can be made from the above equation
## Reasoning (Proportionality)
The logic is based on equal likelihood of capture:
$$
\text{Proportion tagged in total population = Proportion tagged in sample 2}
$$
## Key Assumptions
For the estimate to be valid:
1. **Random mixing** - tagged individuals mix evenly before second capture
2. **Closed population** - no births, deaths, immigration, etc.
3. **Equal capture probability** - each individual has the same chance of being caught in both samples
4. **No tag loss or misidentification**

# Sorting and Summarising Data in RStudio  
**Purpose:** organise and explore data before analysis. 
**Interpretation:** These commands form first diagnostic stage before statistical analysis - confirming sample size, data range and repetition - preparatory steps for later measures such as mean, median, and variance
## Sorting
Used to arrange values for clearer inspection (e.g., find smallest or largest observations before computing statistics).
### Functions
```R
data <- c(3, 2, 10, 5, 9, 4, 2, 6, 3, 4, 3)

# -- Sort --
sort(data)
# [1] 2 2 3 3 3 4 4 5 6 9 10

# -- Order --
order(data)
# [1] 2 1 3

# -- Using with dataframes --
df[order(df$age), ]   # sort rows by "age" column
```
## Basic Exploration
Quick structure and overview checks before formal summary statistics
```R
summary(data)
# Min. 1st Qu. Median Mean 3rd Qu. Max.
# 2.00 3.00 4.00 4.64 5.00 10.00

length(data)
# [1] 11

unique(data)
# [1] 3 2 10 5 9 4 6
```

# Measures of Location (Central Tendency)  
**Purpose:** locate the centre of data - a single value that best represents the dataset as a whole.
## Mean ($\bar{x}$) - Balancing Point
The arithmetic average; every data value contributes equally:
$$
\bar{x} = \tfrac{1}{n}\sum^n_{i=1}x_i
$$
- Sensitive to outliers
- Best for symmetric data distributions
- `mean(x)`
## Median - Midpoint
The middle value when data are ordered
- $n$ = median (index)
	- If $n$ is odd -> middle value
	- If $n$ is even -> mean of two central values
- Resistant to outliers
- Preferred for **skewed** data or data with extreme outvalues
- `median(x)`
## Mode - Most Frequent Value
Value appearing most often
- Can be used for categorial or discrete data
- Some datasets may have **no/multiple** modes
- No built-in numeric mode function
## Choosing the Right Measure
- **Symmetric distribution** -> mean - uses all data values
- **Skewed distribution** -> median - robust to outliers
- **Categorical/discrete** -> mode - represents most common category

# Measures of Dispersion (Spread)  
**Purpose:** describe how data vary around the centre. 
**Example data:** `data <- c(3, 2, 10, 5, 9, 4, 2, 6, 3, 4, 3)'
## Range
Difference between the largest and smallest values
$$
\text{Range = max}(x_i) - \text{min}(x_i)
$$
### R syntax
- `range(data)` -> `[1] 2 10`
- `diff(range(data))` -> `[1] 8`
- `IQR(data)` -> `[1] 2`
## Quartiles and IQR
Quartiles divide ordered data into four equal parts:
- $Q_1$ -> 25th percentile
- $Q_2$ -> 50th percentile
- $Q_3$ -> 75th percentile
$$
IQR = Q_3 - Q_1
$$
- IQR measures the middle 50% spread of the data
- More robust to outliers than the range
### R syntax
```R
quantile(data)
#   0%  25%  50%  75% 100%
#  2.0  3.0  4.0  5.0 10.0

IQR(data)
# [1] 2
```
## Five-Number Summary
Summarises distribution shape concisely:
$$
\text{min}, \quad Q_1, \quad \text{median}, \quad Q_3, \quad \text{max}
$$
### R Syntax
- `fivenum(data)` -> `[1] 2 3 4 5 10`
## Boxplot Interpretation
Visualises dispersion, central tendency, and outliers
```R
boxplot(data, main="Boxplot of data", horizontal=TRUE)
```
- **Box** -> IQR ($Q_1$-$Q_3$)
- **Line in box** -> median
- **Whiskers** -> min and max within $1.5 \times IQR$
- **Points outside** -> potential outliers
## Variance and Standard Deviation
Describe average spread around the mean
$$
s^2 = \frac{1}{n - 1} \sum_{i=1}^{n} (x_i - \bar{x})^2, \quad s = \sqrt{s^2}
$$
### R Syntax
- `var(data)` -> `[1] 6.654545`
- `sd(data)` -> `[1] 2.57962`
## Why $n-1$ ?
The denominator $n-1$ is a **sample correction** (Bessel's correction)
- It adjusts for bias using the sample mean $\bar{x}$ instead of true population mean $\mu$ tends to underestimate variability
### Why does $\mu$ underestimate variability?
When a sample of a population is taken, variance is **on average** less than the variance of the population
- The denominator $n-1$ happens to accurately offset this underestimation of the population variance using a sample

**To learn:**  
- Range, quartiles, IQR, five-number summary  
- Boxplot interpretation (outliers, median, spread)  
- Variance and standard deviation formulas:  $s^2 = \frac{1}{n-1}\sum (x_i-\bar{x})^2, \quad s = \sqrt{s^2}$
- Why divide by $n - 1$ (sample correction)  
- R functions: `var()`, `sd()`, `fivenum()`, `boxplot()`  

# Visualising Data in RStudio  
**Purpose:** identify distribution shape and detect skewness, outliers, or clustering patterns before analysis.
## Histograms
Show how frequently values occur within intervals (bins)
- `hist(data, main="Histogram Title", xlab="Value")`
### Interpretation
- **Symmetric** -> mean $\approx$ median
- **Right-skewed** -> long tail to the right (few large values)
- **Left-skewed** -> long tail to the left (few small values)
- **Flat/wide** -> high variability
- **Narrow/peaked** -> low variability
## Boxplots
Summarise data using quartiles
- `boxplot(data, main="Boxplot Title", horizontal=TRUE)`
### Interpretation
- **Box width (IQR)** -> middle 50% spread
- **Line in box** -> median (central tendency)
- **Whiskers** -> expected range
- **Points beyond whiskers** -> outliers
## Combine
Histograms show frequency distribution, boxplots show summary and outliers. Together they confirm whether mean and median reflect data shape correctly.

# Interpretation of Results  
**Purpose:** link summary statistics and visualisations to meaning.  
## Variability
- **Small variance/SD**: data clustered closely -> consistent outcomes
- **Large variance/SD**: wide spread -> more variability or inconsistency
## Central Tendency
- **Mean $\approx$ median** -> roughly symmetric distribution
- **Mean > median** -> right-skewed (e.g., income data)
- **Mean < median** -> left-skewed (e.g., exam marks with few low outliers)
## Linking R Output to Theory
R functions (`mean()`, `median()`, `var()`, `sd()`) compute the same quantities as formulas shown above
- `var()` and `sd()` use $n-1$ by default
- Graphs and numerical summaries together validate assumptions before further inference
