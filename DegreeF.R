#Rename Monthly AverageTemp to get rid of spaces
names(USTemps)[names(USTemps)=="Monthly.AverageTemp"] <- "CTemp"

#Create new column FTemps - CTemp in Farenheit, calculate value and write
USTemps$FTemp <- (USTemps$CTemp *1.8) + 32