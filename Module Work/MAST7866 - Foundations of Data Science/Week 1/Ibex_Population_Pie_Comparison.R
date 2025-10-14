ibex_1956 <- c(681, 680, 233, 352)
ibex_2016 <- c(895, 1122, 206, 478)
names(ibex_1956) <- c("Males", "Females", "Yearlings", "Kids")
names(ibex_2016) <- c("Males", "Females", "Yearlings", "Kids")

par(mfrow = c(1,2))
pie(ibex_1956, col=rainbow(4), main="1956")
pie(ibex_2016, col=rainbow(4), main="2016")
