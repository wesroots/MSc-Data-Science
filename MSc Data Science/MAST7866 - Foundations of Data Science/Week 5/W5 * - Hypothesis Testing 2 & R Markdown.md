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
## Key Idea + R
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
## Interpreting $\hat{\beta}$
## Basic Diagnostics
## Typical Variations
# Finding Data Patterns (PC10)
