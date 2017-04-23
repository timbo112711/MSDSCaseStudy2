# Select the first 20 rows 
Top20 <- MonAvTempFinal[1:20,]

# Attach the df 
attach(Top20)

# Drop the colunms with the Max and Min, it's easier to plot this way
Max <- NULL
Min <- NULL

# Plot the top 20 countires with the heightest difference

# Barplot
Top20Contires <- ggplot(Top20, aes(x=reorder(Country,-Diff), y=Diff, fill = Diff))+ 
                  geom_bar(colour="black", position=position_dodge(), stat = "identity")+ # bars with black outline that are touching eachother. stat argument is for the Country varible since it is a factor
                  scale_fill_gradient(low = "#FF8888", high = "#FF0000")+ # red gradient 
                  geom_text(aes(label=Diff), vjust=1.6, color="white", position=position_dodge(0.9), size=3.5)+ # put value of Diff in top portion of the bar for each Country
                  labs(x = "Country", y = "Difference", title = "Top 20 Countries with Maximum Differences for the Period Since 1900")+
                  theme_minimal()+ # the type of theme of the graph layout
                  theme(legend.position = "none") # remove all leends from graph

print(Top20Contires)
ggsave("countryplot.png")
