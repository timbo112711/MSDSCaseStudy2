#Print bar graph by year
ALt <- ggplot(data = US1990, aes(x=Year, y= FTemp)) +geom_bar(stat="identity", alpha=0.25) +guides(fill = FALSE) +xlab("Years") + ylab("Average US Temps F") +geom_line(colour="red", size=1.5)
print(ALt)
ggsave("altplot.png")
