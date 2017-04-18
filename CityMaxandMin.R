#Calculate the min and max temps for each city using data.frame syntax
City_Temp_Output <- City_Temp_Output[,c(min=.SD[which.min(AvgTemp)],max=.SD[which.max(AvgTemp)]),by=City]

#Create diff variable and then assign value max-min to it
City_Temp_Output$Diff <- City_Temp_Output$max.AvgTemp - City_Temp_Output$min.AvgTemp
