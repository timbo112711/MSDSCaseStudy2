#Order the temps in ascending order
City_Temp_Viz <- City_Temp_Output[order(-Diff)]

#take the top 20 deltas
City_Temp_Viz <- City_Temp_Viz[1:20]

#Print bar graph, sorted largest to smallest
Top20Cities <- ggplot(City_Temp_Viz, aes(x= reorder(City,-Diff), y= Diff, fill = Diff))+
                  geom_bar(colour="black", position=position_dodge(), stat = "identity")+ # bars with black outline that are touching eachother. stat argument is for the Country varible since it is a factor
                  scale_fill_gradient(low = "#FF8888", high = "#FF0000")+ # red gradient 
                  geom_text(aes(label=Diff), vjust=1.6, color="white", position=position_dodge(0.9), size=3.5)+ # put value of Diff in top portion of the bar for each Country
                  labs(x = "City", y = "Difference", title = "Top 20 Cities with Maximum Differences for the Period Since 1900")+
                  theme_minimal()+ # the type of theme of the graph layout
                  theme(legend.position = "none") # remove all leends from graph

print(Top20Cities)
ggsave("cityplot.png")

