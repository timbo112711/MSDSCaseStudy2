# Remove unneeded columns
CityTemp2[, c("Latitude","Longitude","Monthly AverageTemp Uncertainty","Country") := NULL]

# Remove all the dashes in the date column
CityTemp2$Date <- gsub("-","",CityTemp2$Date)

# Remove all the slashes in the date column
CityTemp2$Date <- gsub("/","-",CityTemp2$Date)

# Create a new column called Flag and fill w/1
CityTemp2$Flag <- 1

# Check every row in the data set to see if the date starts w/ 18, if so set flag to 0
CityTemp2$Flag [(substr (CityTemp2$Date, start = 1, stop = 2)== "18" )] <-0

# Check every row in the data set to see if the date starts w/ 17, if so set flag to 0
CityTemp2$Flag [(substr (CityTemp2$Date, start = 1, stop = 2)== "17" )] <-0

#Subset based on only dates after 12/31/1899
City_Temp_Sub <- subset(CityTemp2, Flag == 1)

#Convert Date from string to date using lubridate function
City_Temp_Sub$Date <- mdy(City_Temp_Sub$Date)

#Create new output data set and make into data.table
City_Temp_Output <- data.table(City_Temp_Sub)

#Rename variable from Monthly AverageTemp to AvgTemp
names(City_Temp_Output)[names(City_Temp_Output)=="Monthly.AverageTemp"] <- "AvgTemp"