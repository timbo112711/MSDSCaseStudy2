## Question 3.i
# Part 1: Find the difference between the maximum and the minimum monthly average temperatures 
#   for each country
# Part 2: Report/visualize top 20 countries with the maximum differences 
#   for the period since 1900. 

setwd("C:\\Users\\TMccw\\OneDrive\\DataScience\\Intro_Doing_Data_Sicence\\CaseStudy2")

# Import libraries
library(plyr)
library(dplyr)
library(ggplot2)

# Import the csv file "TEMP"
temp <- read.csv("TEMP.csv", header = TRUE)

# Explore the data to see how data is structured, etc.
head(temp)
summary(temp)
str(temp)

# NOTE: there are some NA's present. Will find how many 
row.has.na <- apply(temp, 1, function(x){any(is.na(x))}) #  finds all rows with NA's
sum(row.has.na) # sums up the amount of NA's in dataset
# Drop all rows with NA's
temp2 <- temp[!row.has.na,]
str(temp2)

## The Date variable needs to be changed
#Remove all the dashes in the date column
temp2$Date <- gsub("-","",temp2$Date)
#Remove all the slashes in the date column
temp2$Date <- gsub("/","-",temp2$Date)

# Create a new column called Flag and fill w/1
temp2$Flag <- 1
#Check every row in the data set to see if the date starts w/ 18, if so set flag to 0
temp2$Flag [(substr (temp2$Date, start = 1, stop = 2)== "18" )] <-0
#Check every row in the data set to see if the date starts w/ 17, if so set flag to 0
temp2$Flag [(substr (temp2$Date, start = 1, stop = 2)== "17" )] <-0

# Create a data frame that holds all data where flag is equl to 1, date > 1900
temp3 <- subset(temp2, Flag == 1)

# Find the Max and Min monthly average temperatures for each country since 1900
Max <- ddply(temp3, .(Country), function(x) max(x$Monthly.AverageTemp))
Min <- ddply(temp3, .(Country), function(x) min(x$Monthly.AverageTemp))
  
# Merge Max and Min data frames (This way of mergeing is for when you need to merge more than two df's, 
# just trieing it out here)
Merged.data <- function(x,y){
  MonAvTempFinal <- merge(x, y, by="Country") # merge the 2 data frames by Country
  rownames(MonAvTempFinal) <- MonAvTempFinal$Row.names 
  MonAvTempFinal$Row.names <- NULL
  return(MonAvTempFinal)
}
MonAvTempFinal <- Reduce(Merged.data, list(Max, Min))

# Rename the variables to the correct names of Max and Min
names(MonAvTempFinal)[names(MonAvTempFinal)=="V1.x"] <- "Max"
names(MonAvTempFinal)[names(MonAvTempFinal)=="V1.y"] <- "Min"

# Add a new column to the df that holds the difference in Max and Min for all countires
MonAvTempFinal$Diff <- MonAvTempFinal$Max - MonAvTempFinal$Min

# Sort the df decending by Diff
MonAvTempFinal <- MonAvTempFinal[order(-MonAvTempFinal$Diff),]

# Check the df
head(MonAvTempFinal)
str(MonAvTempFinal)

## Plot the top 20 countires with the heightest difference
# Select the first 20 rows 
Top20 <- MonAvTempFinal[1:20,]

# Attach the df 
attach(Top20)
  
# Drop the colunms with the Max and Min, it's easier to plot this way
Max <- NULL
Min <- NULL

# Barplot
ggplot(Top20, aes(x=Country, y=Diff, fill=Country))+ # the fill argument colors in the bars by Country
  geom_bar(colour="black", position=position_dodge(), stat = "identity")+ # bars with black outline that are touching eachother. stat argument is for the Country varible since it is a factor
  geom_text(aes(label=Diff), vjust=1.6, color="white", position=position_dodge(0.9), size=3.5)+ # put value of Diff in top portion of the bar for each Country
  labs(x = "Country", y = "Difference", title = "Top 20 Countries with Maximum Differences for the Period Since 1900")+
  theme_minimal() # the type of theme of the graph layout

# Scatter plot
ggplot(Top20, aes(x=Country, y=Diff))+ 
  geom_point(aes(colour=factor(Country), size = Diff))+ # points that are colored by Country and are the size of their Diff values
  labs(x = "Country", y = "Difference", title = "Top 20 Countries with Maximum Differences for the Period Since 1900")+
  theme_dark()+ # the type of theme of the graph layout
  theme(legend.position = "none") # remove all legends from graph

detach(Top20)

