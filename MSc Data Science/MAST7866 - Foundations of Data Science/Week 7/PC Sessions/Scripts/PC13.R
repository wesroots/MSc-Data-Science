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
# p value = 2.2e-16, coefficient is extremely small. Reject H_0
# There is very strong evidence that the effect of Size on Price =/= zero
# (b)
(cor(diamonds$Size, diamonds$Price))^2 
# (c)
newdata2 = data.frame(Size=c(0.15, 0.25))
predict(fit_diamonds, newdata2, interval="prediction")
# For 0.15 -> 233.1609 - 363.8947
# For 0.25 -> 605.4364 - 735.8242
# (d)
# fit = 670.6303
# 580 is on the lower end of the 95% prediction interval - cheaper than predicted
# Statistically speaking, likely to be good value
# (e)
plot(diamonds$Size, diamonds$Price,
     xlab = "Size",
     ylab = "Price",
     main = "Scatterplot of Size vs Price for diamonds")

fit_diamonds2 <- lm(Price~1, data=diamonds)
abline(fit_diamonds, col="blue")
abline(fit_diamonds2, col="red")

predict(fit_diamonds2, newdata, interval="prediction")
# As model becomes the mean, both 0.15 and 0.25 carats have a CI of 65.84 - 934.33

# --- 4. Port management ---
glakes <- read.table("PC Sessions/Data/glakes.txt", header=TRUE)
# (a)
fit_glakes <- lm(Time~Tonnage, data=glakes)
summary(fit_glakes)
# alpha = 12.345
# beta = 0.006518
# (b)
plot(glakes$Tonnage, glakes$Time,
     xlab = "Tonnage",
     ylab = "Time",
     main = "Scatterplot of Tonnage vs Time for glakes")
fit_glakes <- lm(Time~Tonnage, data=glakes)
abline(fit_glakes, col="blue")
par(mfrow = c(2,2))
plot(fit_glakes)
plot1 <- par(mfrow = c(1,1))
# 1. Resid. vs fitted -> slight curve pattern and increasing spread as values increase
# 2. Q-Q plot -> residuals deviate from straight line at both ends -> departures from normality
# 3. Scale-location plot -> heteroscedasticity
# 4. Resid. vs leverage -> one or two points have high leverage - strongly influence model
# THEREFORE: not suitable:
# 1. curved pattern, not random
# 2. QQ clear bend at both ends
# 3. strong upward trend -> heretoscedasticity
# 4. One point with very high leverage -> influence issues
# (c)
(cor(glakes$Time, glakes$Tonnage))^2
summary(fit_glakes) # 0.8386
# Model is good as R^2 is strong
# (d)
newdata3 = data.frame(Tonnage = 8000)
predict(fit_glakes, newdata3) # 64.48766