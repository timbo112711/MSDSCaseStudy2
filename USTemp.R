#Create a subset with just the US Readings
temp4 <- subset(temp2, Country == "United States")

#Subset based on only dates after 12/31/1899
USTemps <- subset(temp4, Flag == 1)