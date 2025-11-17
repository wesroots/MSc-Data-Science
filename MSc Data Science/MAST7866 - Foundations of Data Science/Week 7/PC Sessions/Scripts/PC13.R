# --- 1. Production runs data ---
production <- read.table("PC Sessions/Data/production.txt", header = TRUE)

plot(production$RunSize, production$RunTime,
     xlab = "Run Size",
     ylab = "Run Time",
     main = "Scatterplot of Run Time against Run Size",
     col="black")

production_fit <- lm(RunTime~RunSize, data = production)
abline(production_fit, col="blue")

segments(
  x0 = production$RunSize,
  y0 = fitted(production_fit),
  x1 = production$RunSize,
  y1 = production$RunTime,
  col = "darkgrey"
)

# --- 2. The effect of salt on blood pressure ---
saltBP <- read.table("PC Sessions/Data/saltBP.txt", header = TRUE)
# (a)
# (i)
fit_saltBP <- lm(BP~salt, data=saltBP)
summary(fit_saltBP) # f = 54.59, t = 7.389
# (ii)
# No linear relationship
# (iii)
# Reject H_0
# (iv)
# Salt intake has a strong, significant effect on BP

# (b)
confint(fit_saltBP, level = 0.95)
# (c)
newdata = data.frame(salt=6)
predict(fit_saltBP, newdata, interval="confidence")
# (d)
# (i)
predict(fit_saltBP, newdata, interval="confidence")
# (ii)
# Yes, it is outside of the CI
# (e)
(cor(saltBP$BP, saltBP$salt))^2

# --- 3. Pricing diamond rings ---
# (a)
diamonds <- read.table("PC Sessions/Data/Diamonds.txt", header=TRUE)
fit_diamonds <- lm(Price~Size, data=diamonds)
summary(fit_diamonds)
