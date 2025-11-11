# (a)
forbes <- read.table("/Users/wes/Desktop/GitHub - MSc-Data-Science/MSc Data Science Vault/MAST7866 - Foundations of Data Science/-- IMPORTANT --/Assignment 1/R Studio/forbes.txt", header=TRUE)
attach(forbes)

# (b)
# (i)
length(age)
length(salary)
length(degree)
# (ii)
sum(age<55)
sum(salary[age<55])/sum(age<55)
sum(salary|age<55)/sum(age<55)
# (iii)
salary/age

# (c)
min(age)
max(age)
mean(age)
min(salary)
max(salary)
mean(salary)

# (d)
deg <- table(tools::toTitleCase(degree))

# (e) - Bar and Pie charts
par(mfrow = c(1,2), mar = c(5,4,5,4))
pie(deg,
    main="Distribution of CEO Degrees",
    col = RColorBrewer::brewer.pal(length(deg), "Set3"),
    clockwise=TRUE,
)

axis1 <- barplot(deg,
        main="Number of CEOs by Degree",
        col = RColorBrewer::brewer.pal(length(deg), "Set3"),
        ylim = c(0,25),
        xlab = "Degree",
        ylab = "Frequency",
        xaxt="n"
)

text(x = axis1,
     y = -1,
     labels = names(deg),
     srt = 45,
     adj = .9,
     xpd = TRUE,
     cex = 0.9)

?barplot

# (f) - Scatter plot
par(mfrow=c(1,1), mar = c(5,5,5,5))
plot(forbes$salary, forbes$age,
     main = "CEO Age vs Salary",
     xlab = "Salary",
     ylab = "Age",
     pch = 21,
     bg = "lightblue",
     ylim = c(30,80),
     las = TRUE,
     bty = "l"
)
 grid()
 
 # (g)
 # Log transformations
 log_age <- log(forbes$age)
 log_salary <- log(forbes$salary)
 
 # Scatter plot of transformed data
 par(mfrow = c(1, 1), mar = c(5, 5, 5, 5))
 plot(log_salary, log_age,
      main = "Log-Transformed CEO Age vs Salary",
      xlab = "log(Salary)",
      ylab = "log(Age)",
      pch = 21,
      bg = "lightblue",
      las = 1,
      bty = "l")
 grid()