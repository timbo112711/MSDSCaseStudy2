i <- Years_Temp$Year[1]#Year variable
x <- 1 #Counter Variable
while (i <= 2011){
  #Insert Years being Calculated into Years_Temp
    Years_Temp$Diff.Year[x] <-  paste(Years_Temp$Year[x],"-", Years_Temp$Year[x+1])
    Years_Temp$Diff[x] <- abs(Years_Temp$FTemp[x] - (Years_Temp$FTemp[x+1]))
  #y <- paste(Years_Temp$Year[x],"-", Years_Temp$Year[x+1], " " , abs(Years_Temp$FTemp[x] - (Years_Temp$FTemp[x+1])))
    i = i +1
    x= x+ 1
}
Years_Temp_Sorted <- Years_Temp[ order(-Years_Temp[,5]), ]
Years_Out <- paste(Years_Temp_Sorted$Diff.Year[1], "-", Years_Temp_Sorted$Diff[1])
Years_Out