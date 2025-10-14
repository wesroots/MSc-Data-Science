# Calculating mean and median ignoring NA values
Letters <- c(3,2,10,5,9,4,2,6,3,4,3)
mean(Letters, na.rm=TRUE)
median(Letters, na.rm=TRUE)

# --- Challenge 1 - employees' ages ---
Age <- c(53,32,61,27,39,44,49,57)
mean(Age)

# Taking random sample of 3 and calculating mean
x1 <- c(sample(Age, 3, replace = FALSE))
mean(x1)

# No function to compute mode, instead tabulate the data:
y <- table(Letters)
names(y)[which(y==max(y))]

