birds <- c(3, 7, 5, 8, 9, 4, 6, 5, 7, 8, 2, 8)
time.of.day <- 8:19

plot(time.of.day, birds, type = "o", col = "blue",
     xlab = "Time of Day", ylab = "Number of Birds")
title(main = "Number of Birds Observed Feeding",
      col.main = "purple", font.main = 3)

cats <- c(9, 10, 14, 5, 10, 18, 17, 16, 9, 8, 6, 12)

plot(time.of.day, birds, type = "o", col = "blue",
     ylim = c(0, 20),
     ylab = "Number of Animals", xlab = "Time of Day")
lines(time.of.day, cats, type = "o", pch = 22, lty = 2, col = "red")
legend(8, 20, c("birds", "cats"), cex = 0.8,
       col = c("blue", "red"), pch = 21:22, lty = 1:2)

# --- Challenge 1: Ibex population plot ---
ibex <- read.table("data/ibex_counts.txt", header = TRUE)
View(ibex)

plot(ibex$Year, ibex$Males, type = "o", col = "blue",
     ylim = c(0, max(ibex[, 2:3])),
     xlab = "Year", ylab = "Number of Ibex",
     main = "Ibex Population – Males and Females (1956–2016)")
lines(ibex$Year, ibex$Females, type = "o", col = "red")
legend("topleft", legend = c("Males", "Females"),
       col = c("blue", "red"), pch = 1, lty = 1)

# --- Task 3: Pie Charts ---
BirdFluCases <- read.table("data/BirdFluCases.txt", header = TRUE)
Cases <- rowSums(BirdFluCases[, 2:16])
names(Cases) <- BirdFluCases[, 1]

par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
pie(Cases, main = "Ordinary Pie Chart")
pie(Cases, col = gray(seq(0.4, 1.0, length = 6)),
    clockwise = TRUE, main = "Grey Colours")
pie(Cases, col = rainbow(6),
    clockwise = TRUE, main = "Rainbow Colours")

# 3D Pie (plotrix)
# install.packages("plotrix")
library(plotrix)
pie3D(Cases, labels = names(Cases), explode = 0.1,
      main = "3D Pie Chart", labelcex = 0.6)

# --- Challenge 2: Ibex 1956 vs 2016 pie charts ---
ibex_1956 <- c(681, 680, 233, 352)
ibex_2016 <- c(895, 1122, 206, 478)
names(ibex_1956) <- c("Males", "Females", "Yearlings", "Kids")
names(ibex_2016) <- c("Males", "Females", "Yearlings", "Kids")

par(mfrow = c(1, 2))
pie(ibex_1956, main = "Ibex 1956", col = rainbow(4))
pie(ibex_2016, main = "Ibex 2016", col = rainbow(4))

# --- Task 4: Bar Charts ---
BirdFluDeaths <- read.table("data/BirdFluDeaths.txt", header = TRUE)
Deaths <- rowSums(BirdFluDeaths[, 2:16])
names(Deaths) <- BirdFluDeaths[, 1]

par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
barplot(Cases, main = "Bird Flu Cases")
Counts <- cbind(Cases, Deaths)
barplot(Counts, main = "Cases and Deaths Combined")
barplot(t(Counts), col = gray(c(0.5, 1)), main = "Stacked Bars")
barplot(t(Counts), beside = TRUE, main = "Side-by-Side Bars")

# Final refined plot
par(mfrow = c(1, 1), mar = c(5, 5, 5, 5))
barplot(t(Counts), beside = TRUE, col = c("red", "blue"),
        main = "Bird Flu Cases vs Deaths",
        xlab = "Year", ylab = "Counts")
legend("topright", legend = c("Cases", "Deaths"),
       fill = c("red", "blue"))

# --- Challenge 3: Births by Maternal Age ---
births_maternal_age <- read.table("data/births_maternal_age.txt", header = TRUE, sep = "\t")

age1<-c(births_maternal_age$Under.20)
age2<-c(births_maternal_age$X20.to.24)
names(age1)<- births_maternal_age$Year
names(age2)<- births_maternal_age$Year
ages<-cbind(age1,age2)
barplot(t(ages),
        beside=TRUE,
        col = c("red","blue"),
        ylim = c(0,300000),
        main="Maternal Age of Mothers",
        xlab="Year",
        ylab="Number")
legend("topright", legend = c("aged under 20", "aged 20-24"), fill = c("red", "blue"))
       