years <- as.numeric(rownames(bird_population_counts))
plot(years, bird_population_counts$Sparrows, type = "o", col="blue",
     ylab = "Number of Birds",
     xlab = "Years",
     ylim = c(75,300))

lines(years, bird_population_counts$Robins,
      type = "o", col="red", lty=2)

legend(1980,295,
       legend = c("Sparrows", "Robins"),
       col = c("blue", "red"),
       lty = c(1,2), pch = 1)