# TASK 1 / EXAMPLE – DISTANCE HISTOGRAM (distance.txt)
hist(distance$dist,
     main = "Commute Distance",
     xlab = "Distance (Miles)",
     ylab = "Number of employees",
     breaks = 7,
     col = "orange",
     border = "blue",
     ylim = c(0, 10)
)

# CHALLENGE 1 – PARKRUN MALE & FEMALE HISTOGRAMS (parkrun.txt)
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

# TASK 2 – SCATTER PLOTS (mtcars & iris)
par(mfrow = c(1,1))
plot(mtcars$wt, mtcars$mpg,
     xlab = "Weight",
     ylab = "Mileage",
     xlim = c(2.5, 5),
     ylim = c(15, 30),
     main = "Weight vs Mileage"
)

pairs(~wt + mpg + disp + cyl, data = mtcars, main = "Scatterplot Matrix")

# iris dataset
head(iris)
pairs(iris[,1:4], pch = 19)
pairs(iris[,1:4], pch = 23)
pairs(iris[,1:4], pch = 19, lower.panel = NULL)

# Colour-coded iris scatterplot by Species
dev.off()
my_cols <- c("orange", "blue", "green")
pairs(iris[,1:4], pch = 19, cex = 0.5, col = my_cols[iris$Species], lower.panel = NULL)
par(xpd = TRUE, oma = c(1,1,1,1))
legend("bottomleft",
       fill = unique(my_cols[iris$Species]),
       legend = c("S1", "S2", "S3"),
       horiz = TRUE
)

# CHALLENGE 2 – TEMP OBSERVATIONS
temp <- read.table("data/temp_obs.txt", header = TRUE, sep = "\t", fill = TRUE)
