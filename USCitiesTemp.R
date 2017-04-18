#Create a subset with just the US Readings
temp4 <- subset(temp2, Country == "United States")

#Subset based on only dates after 12/31/1899
USTemps <- subset(temp4, Flag == 1)

#Rename Monthly AverageTemp to get rid of spaces
names(USTemps)[names(USTemps)=="Monthly.AverageTemp"] <- "CTemp"

#Create new column FTemps - CTemp in Farenheit, calculate value and write
USTemps$FTemp <- (USTemps$CTemp*1.8) + 32

#Convert Date column from character to Date format (YYYY-mm-dd)
USTemps$Date <- as.Date(USTemps$Date,"%m-%d-%Y")

#Create Year column to group by for average Calculations ???
USTemps$Year <- year(USTemps$Date)

#Delete partial year values for 2013
USTemps <- subset(USTemps,Year != 2013)

#Group by Year
Years_Group <- group_by(USTemps,Year)

#Summarize by year and calculate average temp in Farenheit
Years_Temp <- summarize(Years_Group, sum(FTemp)/12)

#Write value as a stored colum
Years_Temp$FTemp <- Years_Temp$`sum(FTemp)/12`

#Print bar graph by year
ggplot(data = Years_Temp, aes(x=Year, y= FTemp)) +geom_bar(stat="identity", alpha=0.25) +guides(fill = FALSE) +xlab("Years") + ylab("Average US Temps F") +geom_line(colour="red", size=1.5)

#Another possible chart, I think this is better showing the changes
#Will work on smoothing this a bit, probably using a running average to smooth out annualize variations
ggplot(data=Years_Temp, aes(x=Year, y= FTemp)) + geom_line() 