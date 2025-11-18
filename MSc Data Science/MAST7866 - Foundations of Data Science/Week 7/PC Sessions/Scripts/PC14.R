# --- 1. NY food price data ---
nyc <- read.csv("PC Sessions/Data/nyc.csv", header=T)
names(nyc)
# (a)
fit_nyc <- lm(Price~Food + Food + Decor + Service, data=nyc)
summary(fit_nyc)
par(mfrow = c(2,2))
plot(fit_nyc)
par(mfrow = c(1,1))
# (b)
nyc_new = data.frame(Food=25, Decor=21, Service=22)
# (i)
nyc_FDS <- lm(Price ~ Food + Decor + Service, data=nyc)
predict(nyc_FDS, nyc_new, interval="prediction")
# (ii)
nyc_FD <- lm(Price ~ Food + Decor, data=nyc)
predict(nyc_FD, nyc_new, interval="prediction")
# (iii)
nyc_FS <- lm(Price~Food, data=nyc)
predict(nyc_FS, nyc_new, interval="prediction")
# (iv)
nyc_F <- lm(Price~Food, data=nyc)
predict(nyc_F, nyc_new, interval="prediction")

# --- 2. Strength of beams data ---
# (a)
beams <- read.table("PC Sessions/Data/beams.txt", header=T)
head(beams)
pairs(beams)
# (b)
# (i)
mod1 <- lm(Strength ~ SpecificGravity, data=beams)
summary(mod1) # R^2 = 0.8338
# (ii)
mod2 <- lm(Strength~Moisture, data=beams)
summary(mod2) # R^2 = 0.5764
# (iii)
mod3 <- lm(Strength~SpecificGravity + Moisture, data=beams)
summary(mod3) # R^2 = 0.9
# (iv)
# mod2 has a moderate fit, mod1 has a strong fit, mod3 has a very strong fit
# (c)
plot(mod1, main="Model 1, R^2 = 0.8338") # Strong fit, steady variance, QQ shows overshot at lower end
plot(mod2, main="Model 2, R^2 = 0.5764") # Moderate fit, less steady variance, QQ shows overshot at lower, undershot higher
plot(mod3, main="Model 3, R^2 = 0.9") # Moderate fit, 
