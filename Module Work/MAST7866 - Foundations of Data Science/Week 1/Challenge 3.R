# Creating Births per Year vector
Births_Per_Year <- rowSums(births_maternal_age[,1:6])
names(Births_Per_Year) <- rownames(births_maternal_age)

Births_Per_AG <- colSums(births_maternal_age[1:6],)
names(Births_Per_AG) <- colnames(births_maternal_age)

options(scipen=999)

# Formatting plot area width
par(mfrow=c(1,2), mar = c(6,7,5,2), mgp = c(3,0.6,0))

# Bar chart 1 - births per age group
barplot(Births_Per_AG,
        col="blue",
        main="Births per Age Group",
        xlab= "Age Group",
        cex.names = 0.6,
        las = 2,
        ylim = c(0,800000))
title(ylab = "Number of Births", line = 5)

# Bar chart 2 - births per year
barplot(Births_Per_Year,
        col="blue",
        main="Births per Year",
        xlab= "Year",
        cex.names = 0.8,
        las = 2,
        ylim = c(0,400000))
title(ylab = "Number of Births", line = 5)