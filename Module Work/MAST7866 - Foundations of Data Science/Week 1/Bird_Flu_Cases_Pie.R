# Finding total number of cases per year
Cases <- rowSums(BirdFluCases[,1:15])
names(Cases) <- rownames(BirdFluCases)
Cases

# Plotting 4 pie charts of this data
# First, split plotting area into 4 spaces
par(mfrow = c(2,2), mar=c(3,3,2,1))

# Then plot graphs
pie(Cases, main="Ordinary pie chart")
pie(Cases, col=gray(seq(0.4,1.0,length=6)), clockwise=TRUE, main="Grey colours")
pie(Cases, col=rainbow(6), clockwise=TRUE, main="Rainbow colours")

# Last one needs plotrix package to be installed
pie3D(Cases, labels=names(Cases), explode=0.1, main="3D pie chart", labelcex=0.6)