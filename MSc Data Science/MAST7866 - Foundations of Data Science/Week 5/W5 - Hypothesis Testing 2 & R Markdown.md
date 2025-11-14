---
Module: Foundations of Data Science
Week Beginning: 2025-11-03
Note Type:
  - Lecture
tags:
  - MAST7866
---
 >[!note] Lecture Notes
>### PC9/PC10
>- Comparative testing
>	- R syntax -> `alternative=` arguments, `paired` boolean
>		-  Data arguments, mean, proportion etc
>- R Markdown
>	- Purpose, HTML
>	- Knit, YAML header
>- Regression (predictive analysis)
>	- Evaluate fit - $R^2$
>	- `geom_smooth(method="lm")` syntax or `pairs(df)`
>### Lecture
>- $y_i = \alpha + \beta x_i + e_i$
>	- $\alpha$: intercept
>	- $\beta$: gradient
>	- $e_i$ **random error** (??)
>- Least squares regression - minimise $\sum(y_i - (\alpha + \beta x_i))^2$
>- 

---

# Comparing Populations
**Purpose:** Decide if two groups differ in mean or population
## Intro

| Case              | Data Type           | R Function                                       | Example                |
| ----------------- | ------------------- | ------------------------------------------------ | ---------------------- |
| Independent means | Two separate groups | `t.test(x1, x2)` or `t.test(y ~ group, data=df)` | Caffeine vs placebo    |
| Paired means      | Same subjects twice | `t.test(pre, post, paired=TRUE)`                 | Weight before vs after |
| Proportions       | Binary outcomes     | `prop.test(c(success1, success2), c(n1, n2))`    | Drug A vs drug B       |
### Independent means:
```R
df <- data.frame(
  y     = c(10,12,9,11, 15,16,14,17),
  group = c("A","A","A","A","B","B","B","B")
)

A_values <- df$y[df$group=="A"]
B_values <- df$y[df$group=="B"]

# Splits up rows and compares between group A and group B (defined in "group" column)
```
## Logic
- Form $H_0$ and $H_1$
- Compute test statistic ($t$ or $\chi^2$)
	- Chi square test $\chi^2$ is for counts of categories, $t$ test is for distribution
	- $\chi^2$ measures difference in counts of categories
- Read $p$-value
	- $p < 0.05$ -> reject $H_0$
## Output pieces
- $t$ or $\chi^2$ value = how far group means differ, measured in $SE$ units
	- Formula essence = $\tfrac{\text{Difference in means}}{\text{Mean variation}}$
- df = degrees of freedom
- $p$-value = probability of seeing difference this large if $H_0$ were true
- 95% CI = range of likely true differences
# R Markdown
**Definition:** A plain-text file (`.Rmd`) that stores text, R code and outputs together, so you can re-run and re-create the same report at any time
**Benefits:**
- Keeps analysis reproducible and self-contained
- Integrates narrative + code + results
- Replaces copy-pasting tables and plots into Word/PDF
## Structure
### 1. YAML metadata header (top section between `---`)
```yaml
title: "Weekly performance report"
output: html_document
params:
	input_file: "week.csv"
```
The YAML header tells the renderer how to build the document and injects metadata into template slots
![[Screenshot 2025-11-09 at 18.32.23.png]]
### 2. Text sections (markdown headings, lists, math, etc.)
- For structure and explanation
### 3. Code chunks
Code chunks let analysis run inside the document
- Necessary to generate data visualisations
- Sourcing figures from R scripts is possible but not best practice, all R code working directly with raw data means the report is reproducible
- By default, renders in output unless specified otherwise using `echo = false:
```yaml
title: "Weekly performance report"
output: html_document
params:
	input_file: "week.csv"
knitr:
	opts_chunk:
		echo: false
```
## Workflow
- Create -> File -> New File -> R Markdown
- Save as `rmarkdown.Rmd`
- Click **Knit** or run `markdown::render("rmarkdown.Rmd")`
- Output HTML/PDF saved in same directory
# Regression (Linear Model Basics)
**Goal:** Quantify and predict how one variable ($y$) changes with another ($x$)
**Form**:
$$
y_i = \alpha + \beta x_i + e_i
$$
- $\alpha$ -> intercept
- $\beta$ -> gradient
- $e_i$ random error
## Key Idea + R  + $R^2$
Fit a line that minimises squared vertical errors between observed and predicted points
- Least squares regression
### R:
```R
df = data.frame(
	vec_y = c(1, 2, 3, 4, 5),
	vec_x = c(6, 7, 8, 9, 10)
)

fit <- lm(vec_y ~ vec_x, data=df)
summary(fit)
```
This prints the regression results:
- Intercept
- Gradient
- $p$-values
	- "Probability of seeing a difference this big under the assumption $H_0$ is true"
- $R^2$
### R-Squared
A measure of how close each data points fits to the regression line
- Tells us how well the regression line predicts actual values
$$
R^2 = 1 - \tfrac{SSR}{SST}
$$
Where:
- SSR = $\sum(\text{Squared distance from resgression line at each point})$
- SST = $\sum(\text{Squared distance from mean of }y)$
## Output
A standard `summary(lm(...))` output contains the following:
**Call** - shows exact formula used
**Residuals** - summary of residual distribution (Min, Q1, Median, Q3, Max). Indicates symmetry and presence of outliers
**Coefficients table** - estimates, standard errors, $t$-values, $p$-values for both intercepts and slope
**Residual standard error (RSE)** - Estimate of $\sigma$ (noise level). Smaller = tighter fit
**$R^2$ and Adjusted $R^2$** - proportion of variability explained by the model
**F-statistics** - overall significance test for regression
## Interpreting $\hat{\beta}$
$\hat{\beta}$ - gradient estimate
- Estimated average change is response variable for a one-unit increase in $x$
$$
\hat{\beta} = \tfrac{{\text{cov}}(x,y)}{\text{var}(x)}
$$
- Covariance of $x$ and $y$ divided by variance of $x$
### Interpretation principles
**1. Sign**
- $\hat{\beta} >0$ : as $x$ increases, mean of $y$ increases
- $\hat{\beta} <0$ : as $x$ increases, mean of $y$ decreases
**2. Magnitude**
- Absolute size tells how much $y$ changes per unit $x$
**3. $p$-value and $t$-value**
- "Is the slope real"
Hypothesis test is
$$
H_0 : \beta = 0 \quad \quad  H_1 : \beta \neq 0
$$
- Small $p$-value ($<0.05$) = strong evidence that $x$ is a real predictor of $y$
- Large $p$-value = cannot conclude $x$ affects $y$
**4. CI**
Indicates plausible values of the true slope
- If CI includes 0 -> slope might be zero
- If CI does not include 0 -> real non-zero effect
## Basic Diagnostics
Checks to see if the linear model assumptions roughly hold
- Linear regression model rules are not being violated
### 1. Residuals vs fitted
Residuals = diff. between real and predicted
Fitted = predicted
![[Screenshot 2025-11-14 at 11.08.40.png]]
- Plot = residuals on y-axis, fitted values on x-axis
- Goal: no clear pattern
- Pattern (curve, U-shape) -> relationship may not be linear
### 2. Normal Q-Q plot
Sort all residuals, compare to perfectly normally distributed errors would look like
![[Screenshot 2025-11-14 at 11.08.59.png]]
- Residuals should fall roughly on a straight line
- "Do the errors look normally distributed?"
# Finding Data Patterns (PC10)
## Visualising Trends
Used for time-ordered data
- Plot variable against time
- Look for a general direction
- Real data may have noise; trend is long-term movement
## Finding Correlations
Shows whether two quantities move together
### Pearson correlation
- Positive or negative correlation - direction
- $|r|$ close to 1 -> strong relationship
- $r \approx 0$ -> no linear association
### How to check
- Scatterplot
- `cor(x,y)`
- `cor.test(x,y)` for significance
