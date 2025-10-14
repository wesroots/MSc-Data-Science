dev.off()

my_cols <- c("orange", "blue", "green")
pairs(iris[,1:4], pch = 19, cex = 0.5, col = my_cols[iris$Species], lower.panel=NULL)
par(xpd = TRUE, oma = c(1,1,1,1))
legend("bottomleft", fill = unique(my_col[iris$Species]), legend=c("S1","S2", "S3"), horiz=TRUE)