# R Introduction
## Purpose
### Intro
- R = open source programming language for statistical computing and graphics
- Built around data frames, vectors and functions for statistical analysis
- Uses a command-line interface and packages
### Why useful
- Optimised for data manipulation, statistical modelling and visualisation
- Strong academic and research adoption
## Comparison to other languages (Python, MATLAB)
### R
- [p] Statistical analysis, visualisation (ggplot2, tidyverse)
- [c] Slower execution, less suited for large scale production
### Python
- [p] General-purpose, strong in ML (NumPy, Pandas, schikit-learn)
- [c] Weaker built-in stats tools
### MATLAB
- [p] Matrix operations, numerical analysis
- [c] Less flexible for DS
## Typical R Workflow
### 1. Import
- Load data using `read.csv()`, `readr::read_csv` or APIs
- E.g., `data <- read_csv("data.csv")`
### 2. Clean
- Handle missing values, rename columns (`dplyr` package)
- E.g., `data_clean <- na.omit(data)`
### 3. Analyse
- Perform descriptive or inferential statistics
- E.g., `summary(data_clean)`
### 4. Visualise
- Create plots (`ggplot2`, `plotly`)
- E.g., `ggplot(data_clean, aes(x,y)) + geom_point()`
### 5. Report
- Summarise results using `R Markdown`
# R Basics
## Syntax
### Comments and assignment
- `#` -> comment
- `<-` -> assigns values
### Operators
- Arithmetic: `+ - * / ^`
- Relational: `> < >= <= == !=`
- Logical: `& | !`
### Variables and naming
Names must start with a letter, can include `_` or `.` - **case sensitive**
### Built-in functions
- `print(x)` - show output
- `class(x)` - type of object (e.g., numerical, character)
- `typeof(x)` - how R stores it internally
- `help(function_name)` - open documentation

# Data Structures
## Scalars and Vectors
R doesn't have a true "scalar"; a single number is just a one-element vector
- `x <- c(1, 3, 2)`
- `x[2]` returns 2nd element (`[1] 3`)
## Matrices
2D collections of one data type (e.g., all numeric)
- `m <- matrix(1:6, nrow = 2, ncol = 3)`
	- Assigns matrix to `m` - 2 rows, 3 columns - data are `[1:6]`
	- R fills matrices by column by default
		- `byrow = TRUE` fills by row instead
- `m[1,2]` -> returns row 1, column 2 (`[1] 3`)
## Lists
Holds different data types or objects together - can be used similar to a dictionary in Python
- `mylist <- list(name = "Tom", age = 25, scores = c(80, 90, 85))`
- `mylist$age` -> returns element stored in `age` (`[1] 25`)
- `mylist[[3]][[2]]` -> returns second element (`[2]`) stored in vector (`[3]`) - i.e. `90`
## Factors
Can represent categories rather than text
- `sex <- factor(c("M", "F", "M"))`
	- `factor()` turns into factor object
	- R stores internally as integers with labels
		- "F" -> 1
		- "M" -> 2
- `levels(sex)` -> returns distinct categories (`[1] "F" "M"`)
### Example use case
Finding mean of two categories: "M" and "F":
```R
# Create data
sex <- factor(c("M", "F", "M", "F", "F"))
height <- c(180, 165, 175, 160, 170)

# Combine into data frame
data <- data.frame(sex, height)

# Summarise by category
tapply(height, sex, mean)
```

# Data Import and Cleaning
## Importing Data
"Reads" data into memory so that it can be worked with
- `read.csv("file.csv")` -> csv files
- `read.table(file.txt")` -> general text files
- `read_excel("file.xlsx")` -> excel files (needs readxl package)
- `readRDS("data.rds")` -> R's own saved format
## Exploring Data
Check structure, column types, and summary stats
- `str(data)` -> structure (type of each column)
- `glimpse(data)` -> compact view (from dplyr)
- `summary(data)` -> min, max, mean, etc.
## Handling Missing Values
Identify or remove NAs (missing entries)
- `is.na(data)` -> TRUE where value is missing
- `clean <- na.omit(data)` -> remove rows with any NAs
- `data[is.na(data)] <- 0` -> replace NAs with `0`
## Renaming Columns and Filtering Rows (dplyr data package)
`dplyr` makes data editing simple
```R
library(dplyr)
data <- data %>%
  rename(score = old_score) %>%   # rename column
  filter(score > 50) %>%          # keep certain rows
  mutate(grade = score / 10)      # create new column
```
- `%>%` is the **pipe operator** in dplyr - it passes the result of one function into the next - no need to create temporary variables or nest functions
## Merging and Joining Data Frames
Combine two datasets by a shared column
- `merged <- left_join(df1, df2, by ="id")`
- Used to consolidate information about unique rows using a shared column (usually an identifier such as `ID` or any other unique value)
## Reshaping and Pivoting
Convert between "long" and "wide" formats
- `pivot_longer(data, cols, c(a,b))` -> combine columns into rows
- `pivot_wider(data, names_from = type, values_from = value)`
# Visualisation with ggplot2
## Grammar of Graphics
- `ggplot` builds by layering parts: data -> aesthetics -> geometry -> style
- Each layer adds something (points, lines, labels,, themes, etc.)
## Basic Structure
`ggplot(data, aes(x=var1, y=var2)) + geom_*()`
- `data` -> the dataset
- `aes()` -> aesthetic mappings (x, y, colour, size, etc.)
- `geom_*()` -> type of plotting (e.g., point, line, bar)
## Common Geoms (Geometric Objects)
- `geom_point()` -> scatter point
- `geom_line()` -> line plot
- `geom_bar()` -> bar chart
- `geom_boxplot()` -> box plot
## Combining Plots
### Using `facet_wrap(~[variable])`
- Creates one small plot per category of a single variable
- Plots are arranged in a wrapping layout
```R
ggplot(df, aes(x = age, y = height)) +
  geom_point() +
  facet_wrap(~gender)
```
![[Pasted image 20251013095546.png]]
### Using `facet_grid(~[variable])`
- Makes structured grid of plots using two variables
- Rows represent one variable, columns represent another
```R
library(ggplot2)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(drv ~ cyl)
```
![[Pasted image 20251013095822.png]]
## Saving Plots (Iterable in Scripts)
### Default use
- `ggsave("plot.png", width = 6, height = 4)`
### Saving a specific plot object
- `p <- ggplot(mpg, aes(displ, hwy)) + geom_point()` -> stores plot in variable `p`
- `ggsave("scatter.png", plot = p, width = 6, height = 4)` -> saves the `p` object directly
# Statistical Analysis
## Descriptive Statistics
- `mean(x)`, `median()`, `var()`, `sd()`
- `cor(x,y)` -> correlation between variables
- `summary(df)` -> quick overview for all columns
## Inferential Tests
Used to check if patterns or differences are statistically significant
- `t.test(x,y)` -> compare means between 2 groups
- `aov(y ~ group, data)` -> ANOVA, compare >2 groups
- `chisq.test(table)` -> chi-square, test for independence
## Regression Models

## Checking Model Assumptions and Diagnostics
## Confidence
## Plotting Model Results
# Programming in R
![[Screenshot 2025-10-07 at 10.50.44.png]]
# Packages and Libraries
![[Screenshot 2025-10-07 at 10.50.52.png]]
# R Markdown and Reporting
![[Screenshot 2025-10-07 at 10.50.59.png]]
# ML in R
![[Screenshot 2025-10-07 at 10.51.05.png]]