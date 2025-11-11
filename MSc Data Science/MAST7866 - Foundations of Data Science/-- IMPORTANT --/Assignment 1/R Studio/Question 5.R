suburban <- c(58.5, 60.8, 60.6, 64.3, 64.1, 40.7, 43.7, 48.6, 49.3, 49.5)
median(suburban)

urban <- c(97.8, 68.3, 109.2, 78.1, 113.7, 78.6, 122.0, 84.4, 125.5, 85.3)
round(IQR(urban))

sd(suburban)
sd(urban)

boxplot(suburban, urban,
        names = c("Suburban", "Urban"),
        main = "Car Insurance Costs (£)",
        xlab = "Cost (£)",
        col = c("lightblue", "lightgreen"),
        horizontal=TRUE
)
