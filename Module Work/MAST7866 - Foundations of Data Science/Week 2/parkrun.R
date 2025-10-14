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
