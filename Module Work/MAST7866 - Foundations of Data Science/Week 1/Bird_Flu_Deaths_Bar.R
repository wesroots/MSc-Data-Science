Deaths <- rowSums(BirdFluDeaths[,1:15])
names(Deaths) <- rownames(BirdFluDeaths)
Deaths

# Plotting charts - not all of these are useful
par(mfrow=c(2,2), mar=c(3,3,2,1))
barplot(Cases, main="Bird flu cases")
Counts <- cbind(Cases,Deaths)
barplot(Counts)
barplot(t(Counts), col=gray(c(0.5,1)))
barplot(t(Counts), beside=TRUE)        

# Plotting the most suitable graph
par(mfrow = c(1,1), mar = c(5,5,5,5))
barplot(t(Counts), beside=TRUE, col = c("red","blue"))
title(main="Bird FLu", xlab = "Year", ylab="Counts")
legend("topright", legend = c("Cases", "Deaths"), fill= c("red", "blue"))
