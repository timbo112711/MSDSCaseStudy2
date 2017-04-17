#Calculate mean and median of the trunk circumferences by Tree
#install "plyr" and "pander" packages if not installed
#install.packages ("plyr")
#install.packages ("pander")
#invoke libraries
library(plyr)
library(pander)
#Compute mean circumference by Tree
mean <- ddply(orange, .(Tree), summarize, mean=mean(circumference))
mean$mean <- format(mean$mean,digits = 2)
sortmean <- format(mean[order(as.character(mean$Tree)),],2)
#Compute median circumference by Tree
median <- ddply(orange, .(Tree), summarize, median=median(circumference))
sortmedian <- median[order(as.character(median$Tree)),]
#Merge table and display results
meanmed <- merge(x=sortmean, y=sortmedian, by="Tree")
pander(meanmed)
