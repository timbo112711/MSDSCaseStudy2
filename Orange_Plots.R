#Create plots
#Scatterplot of tree age vs. circumference
#install ggplot2 if not already installed
#install.packages("ggplot2")
#invoke library
library(ggplot2)
scatter <- ggplot(orange, aes(age,circumference)) + geom_point(aes(color=Tree, shape=Tree)) + xlab("Age (in days from 12/31/1968)")+ ylab("Circumference (mm)")
scatter
ggsave("scatter.png")

#Boxplot of tree circumferences by Tree
box <- ggplot(orange, aes(Tree,circumference))+geom_boxplot()
box
ggsave("box.png")