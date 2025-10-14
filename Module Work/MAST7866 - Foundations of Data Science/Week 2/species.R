?mtcars
par(mfrow = c(1,1))
plot(mtcars$wt, mtcars$mpg, xlab = "Weight", ylab = "Mileage", xlim=c(2.5,5), ylim = c(15,30), main="Weight vs Mileage")

pairs(~wt+mpg+disp+cyl, data=mtcars, main="Scatterplot Matrix")

head(iris)
pairs(iris[,1:4], pch = 19)
pairs(iris[,1:4], pch = 23)
pairs(iris[,1:4], pch = 19, lower.panel = NULL)

dev.off()

my_cols <- c("orange", "blue", "green")
pairs(iris[,1:4], pch = 19, cex = 0.5, col = my_cols[iris$Species], lower.panel=NULL)
par(xpd = TRUE, oma = c(1,1,1,1))
legend("bottomleft", fill = unique(my_col[iris$Species]), legend=c("S1","S2", "S3"), horiz=TRUE)