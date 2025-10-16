---
Module: Foundations of Data Science
Week Beginning: 2025-10-13
Note Type:
  - Lecture
tags:
---
> [!info] Purpose  
> This note breaks down syntax and coding logic from the weekly PC session.  
> - It focuses on understanding specific R functions were used and how they connect to the week’s lecture material.  
> - Each section corresponds to a script in the GitHub repository.

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
## 5. Challenge 2 – Temperature Observations
```R
temp <- read.table("data/temp_obs.txt", header = TRUE, sep = "\t", fill = TRUE)
```
- `fill = TRUE` -> empty rows replaced with `NA`
	- Empty cells can cause errors

# PC2

