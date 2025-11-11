bill <- c(49,36,42,43,49,30,48,32,49,35,30,48)

sum(bill)
min(bill)
max(bill)

over_41 <- sum(bill > 41)
over_41 / length(bill) *100
