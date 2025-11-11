# --- 1. Production runs data ---
# Importing data and creating scatterplot
production <- read.table("PC Sessions/Data/production.txt", header = TRUE)
names(production)

plot(production$RunSize, production$RunTime,
     xlab = "Run Size", ylab = "Run Time",
     main = "Scatterplot of Run Time against Run Size")

# Fitting regression model
fit_production <- lm(RunTime ~ RunSize, data = production)
fit_production

# Plotting scatterplot again
plot(production$RunSize, production$RunTime,
     xlab = "Run Size", ylab = "Run Time",
     main = "Scatterplot of Run Time against Run Size")

# Adding regression line
abline(fit_production)

# ggplot equivalent:
library(ggplot2)
ggplot(production, aes(x = RunSize, y = RunTime)) +
  geom_point() +                                   # scatter points
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # regression line
  labs(
    x = "Run Size",
    y = "Run Time",
    title = "Scatterplot of Run Time against Run Size"
  )

# --- 2. The effect of salt on blood pressure ---
# Import saltBP.txt
saltBP <- read.table("PC Sessions/Data/saltBP.txt", header = TRUE)
names(saltBP)

# Q1. Plot scatterplot
plot(saltBP$salt, saltBP$BP,
     ylab = "BP", xlab = "Salt",
     main = "Scatterplot of BP against Salt")

# Q2. Regression model
fit_salt = lm(BP ~ salt, data = saltBP)
fit_salt

abline(fit_salt)

# * improved version with ggplot2:
library(ggplot2)
model_q2 <- lm(BP ~ salt, data = saltBP)
coeffs_q2 <- coef(model_q2)
coeffs_q2

q2_plot <- 
  ggplot(saltBP, aes(y = BP, x = salt)) +
  geom_point(size = 2) +
  geom_smooth(method="lm", col="red") +
  labs(
    y = "BP (mmHg)",
    x = "Salt (grams/day)",
    title = "Scatterplot of salt intake vs. BP",
    subtitle = paste(
      "r = ", round(cor(saltBP$BP, saltBP$salt),3),
      "| R squared = ", round(cor(saltBP$BP, saltBP$salt)^2,3),
      "\n| y-hat = ", round(coeffs_q2[1],3), "salt + ", round(coeffs_q2[2],3)
    )
  )

q2_plot
ggsave("PC Sessions/Output/saltBP_plot.png")

# Q3
# (a) Effect on BP of increasing salt by 1g
summary(fit_salt)
# 1.197 mmHg
# (b) Avg BP of 6h intake per day
coef(fit_salt)[1] + coef(fit_salt)[2]*6 # = 135.8 mmHg
# (c) 9g - reduce BP by 5 mmHg
BP_9g <- coef(fit_salt)[1] + coef(fit_salt)[2]*9
targetBP <- BP_9g - 5
# targetBP = coef(fit_salt)[1] + coef(fit_salt)[2]*target_salt
# (targetBP - coef(fit_salt)[1]) / coef(fit_salt)[2] = target_salt
target_salt = (targetBP - coef(fit_salt)[1]) / coef(fit_salt)[2]
salt_red = 9 - target_salt
salt_red # = 4.17

# --- 3. Pricing diamond rings ---
# Q1 and Q2
library(ggplot2)
diamonds <- read.table("PC Sessions/Data/diamonds.txt",header=TRUE)

q3_plot <- 
  ggplot(diamonds, aes(y = Price, x = Size)) + 
  geom_point(size = 2) +
  geom_smooth(method="lm", col="blue") +
  # ylim(0, 1100) +
  # xlim(0,0.4) +
  labs(
    x = "Size (carats)",
    y = "Price (USD)",
    title = "Scatterplot of diamond price vs size",
    subtitle = paste(
      "r =", round(cor(diamonds$Price, diamonds$Size),3),
      "| R squared = ", round(cor(diamonds$Price, diamonds$Size)^2,3),
      "\n| y-hat = ", round(coeffs[2],3), "size + ", round(coeffs[1],3)
    )
  )
q3_plot

ggsave("PC Sessions/Output/diamond_plot.png", plot = q3_plot)

(q2_plot | q3_plot)

# Q3
coeffs
coeffs[2]*0.25 + coeffs[1] # 670.6303
coeffs[2]*0.15 + coeffs[1] # 298.5278

# Q4
diamonds_model <- lm(Price ~ Size, data = diamonds)
summary(diamonds_model)$sigma

# Q5
# Regression line crosses intercept at -259.63.
#   Inaccurate when size gets too low:
(0-coeffs[1])/coeffs[2] # = 0.06977269 - x intercept is at 0.069 carats

# Assumes constant variance - no other factors such as cut, colour etc.
# Extrapolation produces unrealistic results