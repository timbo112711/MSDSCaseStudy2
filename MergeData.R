# Merge Max and Min data frames
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