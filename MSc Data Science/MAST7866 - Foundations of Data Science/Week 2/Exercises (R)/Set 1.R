# Question 1
# 1. Any event A 0 <= P(A) <= 1
# 2. P(\Omega) = 1
# 3. For mutually exclusive events A, B:
#    P(A u B) = P(A) + P(B)

# Question 2
# P(A u B) = 0.6
# P(A | B) = 0.33

# Question 3
# (a) \Omega = {1, 2, 3, 4, 5, 6}
# (b) 2/3
# (c) 1/2

# Question 4
# Joint: The chance of two occurring together
# Conditional: Probability of one event given another happens first
# Independent: The one outcome occurring does not affect the probability of another

# Question 5
# Moment 1: Mean -> average, central location
# Moment 2: Variance -> spread
# Moment 3: Skewness -> Left/right skew - asymmetry (tails of the distribution)
# Moment 4: Kurtosis -> Nature of the distribution's peak

# Question 6
data <- c(1,2,3,4,6,9)
install.packages("moments")
library("moments")
skewness(data) # -> 0.6601904
# Right tailed skew
kurtosis(data) # -> 2.228664 (negative excess)
# Leptokurtic -> light tails

# Question 7
(65-50) / 5 # -> 3
# or: 
scale(65, center=50, scale = 5)

# Question 8