---
Module: Foundations of Data Science
Week Beginning: 2025-10-06
Note Type:
  - Lecture
tags:
---
> [!info] Purpose  
> **This note breaks down syntax and coding logic from the weekly PC session.**  
> - It focuses on understanding specific R functions were used and how they connect to the week’s lecture material.  
> - Each section corresponds to a script in the GitHub repository.

# PC1 ([[PC1.R]])
## 1. Data Import and Viewing
```R
parkrun <- read.table("data/parkrun.txt", header = TRUE)
View(parkrun)
```
- `read.table()` -> imports a tabular text file
	- `header = TRUE` -> sets first row as column names
- Result stored in `parkrun` object
- `View(parkrun)` -> opens the dataset in a spreadsheet-style viewer
## 2. Accessing Columns and Object Context
```R
PRmale <- parkrun$Male
attach(parkrun)
Male
detach(parkrun)
```
- `$` operator extracts a specific column (`Male`) from a data frame
- `attach(parkrun)` -> makes DataFrame's columns accessible directly by name
- `detach(parkrun)` -> reverses the above function
(Using `attach()` is generally discouraged in large scripts; direct referencing usually safe and clearer)
## 3. Importing Excel Files
```R
library(readxl)
birdexample <- read_excel("data/birdexample.xls")
temperature <- read_excel("data/temperature.xlsx")
View(birdexample)
View(temperature)
```
- `library(readxl)` -> loads `readxl` package
- `read_excel()` -> automatically detects file type (`xls` or `.xlsx`)
- Imported datasets are assigned to objects for later manipulation
## 4. Challenge 1 - Vector Replication
```R
x <- c(12, 3, 2, 6)
rep(x, 2)
rep(x, c(2, 2, 2, 2))
rep(x, times = c(1, 2, 3, 3))
```
- `c()` -> creates a numeric vector
- `rep()` -> repeats elements in a vector
    - `rep(x, 2)` -> repeats the whole vector twice
    - `rep(x, c(2, 2, 2, 2))` -> repeats each element twice
    - `rep(x, times = c(1, 2, 3, 3))` -> repeats each element a different number of times
## 5. Challenge 2 - Vector Arithmetic and Functions
```R
x <- c(1, 2, 3)
y <- c(0, 1, 2, 3)

x + 1
x + 1:4
```
R performs vectorised operations
- `x + 1` -> adds 1 to every element of `x`
- `x + 1:4` -> adds the sequence `1, 2, 3, 4` to `x` element-wise; shorter vectors are recycled if needed
```R
v <- c(3, 6, 9, 6)
1 / v
max(v)
min(v)
sum(v)
prod(v)
sort(v)
order(v)
```
- `1 / v` → element-wise reciprocal
- `max()`, `min()`, `sum()`, `prod()` → basic descriptive functions
- `sort()` → returns elements in ascending order
- `order()` → returns the index order that would sort `v`

# PC2 ([[PC2.R]])
## 1. Basic Plotting
```R
birds <- c(3, 7, 5, 8, 9, 4, 6, 5, 7, 8, 2, 8)
time.of.day <- 8:19

plot(time.of.day, birds, type = "o", col = "blue",
     xlab = "Time of Day", ylab = "Number of Birds")
title(main = "Number of Birds Observed Feeding",
      col.main = "purple", font.main = 3)
```
- `c()` -> creates numeric vectors
- `8:19` -> generates a sequence from 8 to 19
- `plot()` -> creates a scatter or line plot
    - `type = "o"` -> combines points and lines
    - `col`, `xlab`, `ylab` -> customise appearance
- `title()` -> adds a main title; `font.main = 3` italicises it
## 2. Adding Multiple Series to a Plot
```R
cats <- c(9, 10, 14, 5, 10, 18, 17, 16, 9, 8, 6, 12)

plot(time.of.day, birds, type = "o", col = "blue",
     ylim = c(0, 20),
     ylab = "Number of Animals", xlab = "Time of Day")
lines(time.of.day, cats, type = "o", pch = 22, lty = 2, col = "red")
legend(8, 20, c("birds", "cats"), cex = 0.8,
       col = c("blue", "red"), pch = 21:22, lty = 1:2)
```
- `lines()` -> adds another series to an existing plot
- `pch` -> sets point shape; `lty` sets line type
- `legend()` -> adds labels for each dataset
    - Coordinates specify legend position
    - `col`, `pch`, and `lty` match each series’ style
## 3. Challenge 1 – Ibex Population Plot
```R
ibex <- read.table("data/ibex_counts.txt", header = TRUE)
View(ibex)

plot(ibex$Year, ibex$Males, type = "o", col = "blue",
     ylim = c(0, max(ibex[, 2:3])),
     xlab = "Year", ylab = "Number of Ibex",
     main = "Ibex Population – Males and Females (1956–2016)")
lines(ibex$Year, ibex$Females, type = "o", col = "red")
legend("topleft", legend = c("Males", "Females"),
       col = c("blue", "red"), pch = 1, lty = 1)
```
- `read.table()` -> imports tabular data
- `max(ibex[, 2:3])` -> sets the y-axis limit to the largest value in columns 2–3
- Adds two data series (Males, Females) to the same plot with a legend
## 4. Task 3 – Pie Charts
```R
BirdFluCases <- read.table("data/BirdFluCases.txt", header = TRUE)
Cases <- rowSums(BirdFluCases[, 2:16])
names(Cases) <- BirdFluCases[, 1]
```
- `rowSums()` -> computes totals across columns
- `names()` -> assigns labels for pie slices
```R
par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
pie(Cases, main = "Ordinary Pie Chart")
pie(Cases, col = gray(seq(0.4, 1.0, length = 6)),
    clockwise = TRUE, main = "Grey Colours")
pie(Cases, col = rainbow(6),
    clockwise = TRUE, main = "Rainbow Colours")
```
- `par(mfrow = c(2,2))` -> splits plotting area into 2×2 grid
- `mar` -> adjusts margins
- `pie()` -> draws pie charts with colour and direction options
```R
library(plotrix)
pie3D(Cases, labels = names(Cases), explode = 0.1,
      main = "3D Pie Chart", labelcex = 0.6)
```
- `plotrix` -> package enables `pie3D()` for 3D pie charts
- `explode` -> separates slices slightly for emphasis
## 5. Challenge 2 – Ibex 1956 vs 2016
```R
ibex_1956 <- c(681, 680, 233, 352)
ibex_2016 <- c(895, 1122, 206, 478)
names(ibex_1956) <- c("Males", "Females", "Yearlings", "Kids")
names(ibex_2016) <- c("Males", "Females", "Yearlings", "Kids")

par(mfrow = c(1, 2))
pie(ibex_1956, main = "Ibex 1956", col = rainbow(4))
pie(ibex_2016, main = "Ibex 2016", col = rainbow(4))
```
- Two vectors store population breakdowns by age group
- `mfrow = c(1,2)` -> plots side-by-side pies for comparison
## 6. Task 4 – Bar Charts
```R
BirdFluDeaths <- read.table("data/BirdFluDeaths.txt", header = TRUE)
Deaths <- rowSums(BirdFluDeaths[, 2:16])
names(Deaths) <- BirdFluDeaths[, 1]
```
- Same logic as earlier, but for deaths instead of cases
```R
par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
barplot(Cases, main = "Bird Flu Cases")
Counts <- cbind(Cases, Deaths)
barplot(Counts, main = "Cases and Deaths Combined")
barplot(t(Counts), col = gray(c(0.5, 1)), main = "Stacked Bars")
barplot(t(Counts), beside = TRUE, main = "Side-by-Side Bars")
```
- `barplot()` -> visualises categorical data
- `cbind()` -> combines vectors as columns
- `t()` -> transposes matrices for different bar orientations
```R
barplot(t(Counts), beside = TRUE, col = c("red", "blue"),
        main = "Bird Flu Cases vs Deaths",
        xlab = "Year", ylab = "Counts")
legend("topright", legend = c("Cases", "Deaths"),
       fill = c("red", "blue"))
```
- `beside = TRUE` -> separates bars instead of stacking
- `legend()` -> labels colour-coded bars
## 7. Challenge 3 – Births by Maternal Age
```R
births_maternal_age <- read.table("data/births_maternal_age.txt",
                                  header = TRUE, sep = "\t")

age1 <- c(births_maternal_age$Under.20)
age2 <- c(births_maternal_age$X20.to.24)
names(age1) <- births_maternal_age$Year
names(age2) <- births_maternal_age$Year
ages <- cbind(age1, age2)

barplot(t(ages),
        beside = TRUE,
        col = c("red", "blue"),
        ylim = c(0, 300000),
        main = "Maternal Age of Mothers",
        xlab = "Year",
        ylab = "Number")
legend("topright", legend = c("aged under 20", "aged 20–24"),
       fill = c("red", "blue"))
```
- Reads tab-separated data with `sep = "\t"`
- Extracts age-specific columns
- Combines vectors for comparative bar plot with legend
