## Question 3.i
# Part 1: Find the difference between the maximum and the minimum monthly average temperatures 
#   for each country
# Part 2: Report/visualize top 20 countries with the maximum differences 
#   for the period since 1900. 

setwd("C:\\Users\\TMccw\\OneDrive\\DataScience\\Intro_Doing_Data_Sicence\\CaseStudy2")

# Import libraries
library(plyr)
library(dplyr)

# Import the csv file "TEMP"
temp <- read.csv("TEMP.csv", header = TRUE)

# Explore the data to see how data is structured, etc.
head(temp)
summary(temp)
str(temp)

## Part 1 ##
##############
# NOTE: there are some NA's present. Will find how many 
row.has.na <- apply(temp, 1, function(x){any(is.na(x))}) #  finds all rows with NA's
sum(row.has.na) # sums up the amount of NA's in dataset
# Drop all rows with NA's
temp2 <- temp[!row.has.na,]
str(temp2)

# Find the Max and Min monthly average temperatures for each country
Max <- ddply(temp2, .(Country), function(x) max(x$Monthly.AverageTemp))
Min <- ddply(temp2, .(Country), function(x) min(x$Monthly.AverageTemp))
# Merge Max and Min data frames
Merged.data <- function(x,y){
  MonAvTemp <- merge(x, y, by="Country") # merge the two data frames by Country
  rownames(MonAvTemp) <- MonAvTemp$Row.names
  MonAvTemp$Row.names <- NULL
  return(MonAvTemp)
}
MonAvTemp <- Reduce(Merged.data, list(Max, Min))
# Rename the variables to the correct names of Max and Min
names(MonAvTemp)[names(MonAvTemp)=="V1.x"] <- "Max"
names(MonAvTemp)[names(MonAvTemp)=="V1.y"] <- "Min"

# Add a new column to the df that holds the difference in Max and Min for all countires
MonAvTemp$Diff <- MonAvTemp$Max - MonAvTemp$Min

#Check to see if everything is layed out the way we want it to be
head(MonAvTemp)
str(MonAvTemp)

## Part 2 ##
############

library(ggplot2)

## The Date variable needs to be changed
#Remove all the dashes in the date column
temp2$Date <- gsub("-","",temp2$Date)
#Remove all the slashes in the date column
temp2$Date <- gsub("/","-",temp2$Date)

#create a new column called Flag and fill w/1
temp2$Flag <- 1
#Check every row in the data set to see if the date starts w/ 18, if so set flag to 0
temp2$Flag [(substr (temp2$Date, start = 1, stop = 2)== "18" )] <-0
#Check every row in the data set to see if the date starts w/ 17, if so set flag to 0
temp2$Flag [(substr (temp2$Date, start = 1, stop = 2)== "17" )] <-0

# Create a data frame that holds all data where flag is equl to 1, date > 1900
temp3 <- subset(temp2, Flag == 1)

# Find the Max and Min monthly average temperatures for each country
Max2 <- ddply(temp3, .(Country), function(y) max(y$Monthly.AverageTemp))
Min2 <- ddply(temp3, .(Country), function(x) min(x$Monthly.AverageTemp))
# Merge Max and Min data frames
Merged.data2 <- function(x,y){
  MonAvTemp2 <- merge(x, y, by="Country") # merge the two data frames by Country
  rownames(MonAvTemp2) <- MonAvTemp2$Row.names
  MonAvTemp2$Row.names <- NULL
  return(MonAvTemp2)
}
MonAvTemp2 <- Reduce(Merged.data2, list(Max2, Min2))
# Rename the variables to the correct names of Max and Min
names(MonAvTemp2)[names(MonAvTemp2)=="V1.x"] <- "Max"
names(MonAvTemp2)[names(MonAvTemp2)=="V1.y"] <- "Min"

# Add a new column to the df that holds the difference in Max and Min for all countires
MonAvTemp2$Diff <- MonAvTemp2$Max - MonAvTemp2$Min






