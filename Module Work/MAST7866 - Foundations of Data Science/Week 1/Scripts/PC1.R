parkrun <- read.table("data/parkrun.txt", header = TRUE)
View(parkrun)

PRmale <- parkrun$Male
attach(parkrun)
Male
detach(parkrun)

library(readxl)

birdexample <- read_excel("data/birdexample.xls")
temperature <- read_excel("data/temperature.xlsx")

View(birdexample)
View(temperature)

# --- Challenge 1 ---
x <- c(12, 3, 2, 6)
rep(x, 2)
rep(x, c(2, 2, 2, 2))
rep(x, times = c(1, 2, 3, 3))

# --- Challenge 2 ---
x <- c(1, 2, 3)
y <- c(0, 1, 2, 3)

x + 1
x + 1:4

v <- c(3, 6, 9, 6)
1 / v
max(v)
min(v)
sum(v)
prod(v)
sort(v)
order(v)