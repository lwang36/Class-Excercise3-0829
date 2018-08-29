# Excercise 08292018
source("https://bioconductor.org/biocLite.R")
biocLite("affy")

# Install the package SpikeInSubset
biocLite("SpikeInSubset")
OR
source("https://bioconductor.org/biocLite.R")
biocLite("SpikeInSubset")

# Loading this package
library(SpikeInSubset)
library(affy)

# Load data
data(spikein95)

# check the chips
image(spikein95)

# collect the gene id from this dataset and put it into an object

ids <- geneNames(spikein95)

# perfrom Mas 5.0 normalization
Mas <- mas5(spikein95)

#Box plot for raw data, and boxplot for nomalized on log fold
boxplot(spikein95)
mas_log <- log2(exprs(Mas))
x11()
boxplot(mas_log)

# Density plot
density <- density(mas_log[,1])
plot(density, main="Mas normalization")

density2 <- density(mas_log[,2])
lines(density2, col="red")

density3 <- density(mas_log[,3])
lines(density3, col="blue")


# Making MA plot
# M: difference in average log intensity
# A: average log intensity

d <- rowMeans(mas_log[,1:3] - rowMeans(mas_log[,4:6]))
a <- rowMeans(mas_log)


# Plotting the data

plot(a, d, ylim = c(-5,5), main="MA 5.0 normalized MA plot",
xlab = "A", ylab = "M", pch = ".")

abline(h = c (-1,1))

abline(h = c(-1.5,1.5), col="red")











