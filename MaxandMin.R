# Find the Max and Min monthly average temperatures for each country
Max <- ddply(temp3, .(Country), function(x) max(x$Monthly.AverageTemp))
Min <- ddply(temp3, .(Country), function(x) min(x$Monthly.AverageTemp))