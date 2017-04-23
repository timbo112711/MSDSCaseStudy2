#Convert Date column from character to Date format (YYYY-mm-dd)
USTemps$Date <- as.Date(USTemps$Date,"%m-%d-%Y")

#Create Year column to group by for average Calculations
USTemps$Year <- year(USTemps$Date)

#Delete partial year values for 2013
USTemps <- subset(USTemps,Year != 2013)

#Group by Year
Years_Group <- group_by(USTemps,Year)

#Summarize by year and calculate average temp in Farenheit
Years_Temp <- summarize(Years_Group, sum(FTemp)/12)

#Write value as a stored colum
Years_Temp$FTemp <- Years_Temp$`sum(FTemp)/12`

# Subset dataframe to show years => 1990
US1990 <- Years_Temp[which(Years_Temp$Year>=1990),]
