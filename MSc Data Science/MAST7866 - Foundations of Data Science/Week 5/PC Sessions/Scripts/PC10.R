library("tidyverse")
library("rmarkdown")
library("tinytex")

# --- 1. R Markdown ---
render("rmd1.Rmd", output_format = "html_document")

# --- 2. Data Formats ---

# --- 3. Independent Data ---
x <- 6:10
set.seed(1)
sample(x)                # permutation
sample(x, size=2)        # subset
sample(x, replace=TRUE)  # with replacement (bootstrap)

# --- 4. Dependent Data ---

# 5. Mining data patterns
# Often collect data so we can find patterns in data such as relationships or trends

# 5.1. Visualising trends
# Detect overall inc./dec. patterns across time -> reveals long term behaviour and temporal dynamics in datasets
library(tidyverse)
library(seasonal)
library(fpp2)
GM_life <- read_csv("PC Sessions/Data/GM-Life Expectancy.csv")
head(GM_life)
ts.plot(ts(GM_life[,3],start=1800,end=2024),xlab="year",ylab="Expectancy",
        main = "Life Expectancy")
Fertility <- read_csv("PC Sessions/Data/Total fertility rate_simplified.csv")
head(Fertility)
x<-matrix(0,dim(Fertility)[2],4)
Fertility1<-Fertility[,1:dim(Fertility)[2]]
x<-t(Fertility1[,1:dim(Fertility)[2]])

# 5.2. Finding correlations
ts.plot(ts(cbind(x[,1],
                 x[,2],
                 x[,3],x[,4]),start=1800,end=2024),
        gpars = list(xlab = "Year",
                     ylab = "Fertility",
                     main = "Fertility in four regions",
                     lwd = rep(2,4),
                     lty = c(1:4),
                     col = c("darkred","darkblue","darkgreen","grey")))

legend("topright", c("Amr","Eur","Afr","Asi"), lwd = rep(2,4), lty = c(1:4), col = c("darkred","darkblue","darkgreen","grey"))

# 5.3. Data Analysis in finance
#Start by setting the Working directory
#Then install the packages below if not already installed (go to Tools on the main panel)
library(tseries)
ibm<-read.csv("PC Sessions/Data/IBM.csv",header=T)
names(ibm)
dim(ibm)
date1 <- ibm[,1]
date1 <- as.Date(date1, format = "%Y-%m-%d")
date <- ibm[2:dim(ibm)[1],1]
date <- as.Date(date, format = "%Y-%m-%d")
T<-nrow(ibm);
closepr<-ibm[,6];
#the command diff() allow you to calculate the log-price changes over two consective time poin
6
lreturn_IBM<-diff(log(closepr)); #log returns
T1<-length(lreturn_IBM);
lpreturn_IBM<-lreturn_IBM*100; #convert to rates
c(mean(lpreturn_IBM),var(lpreturn_IBM))
plot(closepr~date1, type="l")
plot(lpreturn_IBM ~ date, type="l")
plot(lpreturn_IBM^2 ~ date, type="l")
plot(lreturn_IBM ~ date, type="l")
plot(lpreturn_IBM ~ date, type="l", ylim=c(-16, 16))

amzn<-read.csv("PC Sessions/Data/AMZN.csv",header=T)
T<-nrow(amzn);
closepr<-amzn[,6];
lreturn_amzn<-diff(log(closepr)); #log returns
T1<-length(lreturn_amzn);
lpreturn_amzn<-lreturn_amzn*100; #convert to rates
plot(lpreturn_amzn ~ date, type="l", ylim=c(-16, 16))

# 5.4 
hist(lpreturn_IBM, 30, xlim=c(-16, 16), main="",freq=FALSE)
x<-seq(-10,+10,by=2)
curve(dnorm(x), add=TRUE)
hist(lpreturn_amzn, 30, xlim=c(-16, 16), main="",freq=FALSE)
x<-seq(-10,+10,by=2)
curve(dnorm(x), add=TRUE)