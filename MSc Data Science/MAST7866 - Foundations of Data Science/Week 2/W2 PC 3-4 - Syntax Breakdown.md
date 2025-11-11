---
Module: Foundations of Data Science
Week Beginning: 2025-10-13
Note Type:
  - Lecture
tags:
  - MAST7866
---
> [!info] Purpose  
> **This note breaks down syntax and coding logic from the weekly PC sessions**  
> - It focuses on understanding specific R functions were used and how they connect to the week’s lecture material. 
> - Each section corresponds to a script in the GitHub repository

# PC3 ([[PC3.R]])
## 1. Distance Histogram
```R
hist(distance$dist,
     main = "Commute Distance",
     xlab = "Distance (Miles)",
     ylab = "Number of employees",
     breaks = 7,
     col = "orange",
     border = "blue",
     ylim = c(0, 10)
)
```
- `hist()` -> creates histogram
- `breaks = 7` -> number of bins
- `col`, `border` -> fill and outline colours
![[commute_distance.png]]
## 2. Challenge 1 – Parkrun Male & Female Histograms
```R
par(mfrow = c(1,2))

hist(parkrun$Male,
     col = "lightblue",
     main = "Male",
     xlab = "Time",
     ylim = c(0,100)
)

hist(parkrun$Female,
     col = "#FFCCCB",
     main = "Female",
     xlab = "Time",
     ylim = c(0,100)
)
```
- `par(mfrow = c(1,2))` -> displays two plots side by side
- `ylim` -> both plots use same y-axis scales for comparison
## 3. Task 2 – Scatter Plots (`mtcars` & `iris`)
```R
par(mfrow = c(1,1))
plot(mtcars$wt, mtcars$mpg,
     xlab = "Weight",
     ylab = "Mileage",
     xlim = c(2.5, 5),
     ylim = c(15, 30),
     main = "Weight vs Mileage"
)
```
- Scatterplot showing the negative relationship between vehicle weight and mileage
```R
pairs(~wt + mpg + disp + cyl, data = mtcars, main = "Scatterplot Matrix")
```
- `pairs()` -> creates matrix of scatterplots for **multivariate relationships**
	- Useful for identifying patterns or correlations between variables
```R
head(iris)
pairs(iris[,1:4], pch = 19)
pairs(iris[,1:4], pch = 23)
pairs(iris[,1:4], pch = 19, lower.panel = NULL)
```
- `pch` -> datapoint symbol style
- `lower.panel` -> hides mirrored plots
![[iris_scatterplot.png]]
## 4. Colour-Coded Iris Scatterplot
```R
dev.off()
my_cols <- c("orange", "blue", "green")
pairs(iris[,1:4], pch = 19, cex = 0.5, col = my_cols[iris$Species], lower.panel = NULL)
par(xpd = TRUE, oma = c(1,1,1,1))
legend("bottomleft",
       fill = unique(my_cols[iris$Species]),
       legend = c("S1", "S2", "S3"),
       horiz = TRUE
)
```
- `dev.off()` -> removes current plot
- `col = my_cols[iris$Species]` -> maps colours by species for visual grouping
- `par(xpd = TRUE)` -> plots legend outside plot area
![[iris_scatterplot_colour.png]]
## 5. Challenge 2 – Temperature Observations
```R
temp <- read.table("data/temp_obs.txt", header = TRUE, sep = "\t", fill = TRUE)
```
- `fill = TRUE` -> empty rows replaced with `NA`
	- Empty cells can cause errors

# PC4 ([[PC4.R]])
## 1. Measures of Location
```R
Letters <- c(3,2,10,5,9,4,2,6,3,4,3)
mean(Letters, na.rm = TRUE)
median(Letters, na.rm = TRUE)
```
- `na.rm = TRUE` -> removes missing values
## 2. Challenge 1 – Employees’ Ages
```R
Age <- c(53,32,61,27,39,44,49,57)
mean(Age)

x1 <- c(sample(Age, 3, replace = FALSE))
mean(x1)
```
- `sample()` -> creates a random subset without replacement
	- `Age` -> specifies population
	- `3` -> subset size
```R
y <- table(Letters)
names(y)[which(y == max(y))]
```
- R has no built-in `mode()` for categorical data -> `table()` counts frequencies
## 3. Measures of Dispersion
```R
attach(school)
par(mfrow = c(2,1))
hist(schoolA,
     breaks = 10,
     main = "Histogram showing students overall percentage (School A)",
     xlab = "overall percentage",
     xlim = c(0,100),
     ylim = c(0,8))
hist(schoolB,
     breaks = 10,
     main = "Histogram showing students overall percentage (School B)",
     xlab = "overall percentage",
     xlim = c(0,100),
     ylim = c(0,8))
```
- Compares distributions for two schools with identical means but differing spreads
- Visual differences -> differing dispersion![[iris_scatterplot_colour.png]]
![[school_histogram_comparison.png]]
```R
range_A <- max(schoolA) - min(schoolA)
range_B <- max(schoolB) - min(schoolB)
```
- Creates single-element vector of range
```R
par(mfrow = c(1,1))
fivenum(schoolA)
boxplot(schoolA,
        main = "School A",
        ylab = "Overall Percentage",
        xlab = "Students",
        horizontal = TRUE,
        col = "lightgray",
        border = "black")
```
- `fivenum()` -> returns Tukey’s five-number summary (min, Q1, median, Q3, max)
- `boxplot()` -> visualises median, IQR, and potential outliers
![[schoolA_boxplot_IQR.png]]
## 4. Challenge 2 – Car Boxplot Comparison
```R
boxplot(wt ~ cyl, data = mtcars,
        main = "Vehicle Weight",
        xlab = "Number of Cylinders",
        ylab = "Weight")
```
- `wt ~ cyl` -> plots weight by cylinder group
- Reveals spread differences by engine type
![[vehicle_weight_boxplot_comparison.png]]
```R
var(schoolA)
sd(schoolA)
sd(schoolB)
```
- `var()` and `sd()` -> variance and standard deviation
- Quantify dispersion numerically for both datasets
## 5. Challenge 4 – Skewness and Kurtosis
```R
install.packages("moments")
library(moments)
skewness(schoolA)
kurtosis(schoolB)
```
- The **moments** package measures shape of distributions
- `skewness()` -> assesses asymmetry
- `kurtosis()` -> measures tail heaviness (peakedness)
## 6. Association Between Variables
```R
attach(iris)
plot(Petal.Length, Petal.Width,
     main = "Petal length vs petal width",
     xlab = "Petal length",
     ylab = "Petal width")
cor.test(Petal.Length, Petal.Width)
```
- `plot()` -> visualises linear association between two continuous variables
- `cor.test()` -> Pearson’s correlation test - outputting correlation coefficient and $p$-value
## 7. Challenge 5 – Sepal Correlation
```R
plot(Sepal.Length, Sepal.Width,
     main = "Sepal length vs width",
     xlab = "Sepal length",
     ylab = "Sepal width")
```
- Scatterplot for sepal dimensions
