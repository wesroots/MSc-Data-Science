# --- Task 1: Moodle video

# --- Task 2: examples from video ---
# Example 1
sum(1:4) # [1] 10
sum(1,4) # [1] 5

# --- Challenge 1: Calculate $\sum^100_{x=1}x$ ---
sum(1:100)

# Example 
n <- c(10, 20, 30)
sum(n)
# Dummy variable
sum_n <- 0
for (i in 1:3) sum_n <- sum_n+n[i]

# --- Challenge 2: summing nth elements of a vector --- 
x <- c(2,5,1,8,9,3,4)
sum(x[2], x[4], x[6])

# Example 3
y <- 0
for (x in 1:4) y <- y+x*(x+1)
y # [1] 40

# --- Challenge 3: calculate $\sum^8_{x=1}x(x+2)$ ---
result <- 0
for (z in 1:8) result <- z*(z+2) + result
result

# --- Task 3: Using if command ---
install.packages("MASS")
library("MASS")

data(anorexia)
attach(anorexia)

# Investigating gained weight after treatment 
if (Postwt[15] > Prewt[15]) {
  print("Patient gained weight after treatment")
} else {
  print("Patient did not gain weight after treatment")
}
# Repeat for 15
if (Postwt[15] > Prewt[15]) {
  print("Patient gained weight after treatment")
} else {
  print("Patient did not gain weight after treatment")
}

# --- Task 4 ---
sum.n <- function(n) {
  y<-0
  for (i in 1:n) {y<-y+i}
  print(y)
}

sum.n(5)
sum.n(10)
# --- Challenge 4 ---
sum.square.n <- function(n) {
  y <- 0
  for (i in 1:n) {y <- y + i * i}
  return(y)
}

sum.square.n(4)
sum.square.n(6)
sum.square.n(10)

# --- Challenge 6 ---
pow <- function(x,y) {
  result <- x^y
  print(paste(x,"raised to the power of", y, "is", reNsult))
}

pow(3,2)

# --- Challenge 5 ---
x <- c(4,2,7,8,3,5,8,9,2,4,3,14)
sum_even_x <- function(x) {
  sum_x <- 0
  y <- length(x)/2
  for (i in 1:y) sum_x <- sum_x+x[2*i]
}

print(sum_x)
