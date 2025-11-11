# --- 1. Production runs data ---
par(mfrow = c(2,2))
plot(fit_production)

# --- 2. The effect of salt on BP ---
# Q1
plot(fit_salt)
# Regression model is appropriate

# --- 3. Pricing diamond rings ---
# Regression module is appropriate

# --- 4. Advertising residuals
# Q1
adrevenue <- read.csv("PC Sessions/Data/AdRevenue.csv", header=TRUE)
fit_adrevenue <- lm(AdRevenue~Circulation, data=adrevenue)

# Q2
fit_adrevenue_log <- lm(log(AdRevenue) ~ log(Circulation), data = adrevenue)
plot(fit_adrevenue_log)
