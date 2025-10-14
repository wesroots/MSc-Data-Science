# Extract the years from row names
years <- as.numeric(rownames(ibex_counts))

# Base plot for Males
plot(years, ibex_counts$Males, type = "o", col = "blue",
     ylim = c(0, 2000),
     xlab = "Year",
     ylab = "Number of animals",
     main = "Ibex Population Over Time")

# Add Females as a second line
lines(years, ibex_counts$Females, type = "o", col = "red", lty = 2)

# Add a legend
legend(1955,2000,
       legend = c("Males", "Females"),
       col = c("blue", "red"),
       lty = 1:2, pch = 1) %>% 