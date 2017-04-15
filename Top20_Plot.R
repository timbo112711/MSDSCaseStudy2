# Attach the df 
attach(Top20)

# Select the first 20 rows 
Top20 <- MonAvTempFinal[1:20,]

# Drop the colunms with the Max and Min, it's easier to plot this way
Max <- NULL
Min <- NULL

# Plot the top 20 countires with the heightest difference

# Barplot
ggplot(Top20, aes(x=Country, y=Diff, fill=Country))+ # the fill argument colors in the bars by Country
  geom_bar(colour="black", position=position_dodge(), stat = "identity")+ # bars with black outline that are touching eachother. stat argument is for the Country varible since it is a factor
  geom_text(aes(label=Diff), vjust=1.6, color="white", position=position_dodge(0.9), size=3.5)+ # put value of Diff in top portion of the bar for each Country
  labs(x = "Country", y = "Difference", title = "Top 20 Countries with Maximum Differences for the Period Since 1900")+
  theme_minimal() # the type of theme of the graph layout

# Scatter plot
ggplot(Top20, aes(x=Country, y=Diff))+ 
  geom_point(aes(colour=factor(Country), size = Diff))+
  labs(x = "Country", y = "Difference", title = "Top 20 Countries with Maximum Differences for the Period Since 1900")+
  theme(legend.position = "none")