#Calculate the one-year difference of average land temperature by year since 1990 
a <- US1990[US1990$Year == "1991", "FTemp"] - US1990[US1990$Year == "1990", "FTemp"]
b <- US1990[US1990$Year == "1992", "FTemp"] - US1990[US1990$Year == "1991", "FTemp"]
c <- US1990[US1990$Year == "1993", "FTemp"] - US1990[US1990$Year == "1992", "FTemp"]
d <- US1990[US1990$Year == "1994", "FTemp"] - US1990[US1990$Year == "1993", "FTemp"]
e <- US1990[US1990$Year == "1995", "FTemp"] - US1990[US1990$Year == "1994", "FTemp"]
f <- US1990[US1990$Year == "1996", "FTemp"] - US1990[US1990$Year == "1995", "FTemp"]  
g <- US1990[US1990$Year == "1997", "FTemp"] - US1990[US1990$Year == "1996", "FTemp"]
h <- US1990[US1990$Year == "1998", "FTemp"] - US1990[US1990$Year == "1997", "FTemp"]
i <- US1990[US1990$Year == "1999", "FTemp"] - US1990[US1990$Year == "1998", "FTemp"]
j <- US1990[US1990$Year == "2000", "FTemp"] - US1990[US1990$Year == "1999", "FTemp"]
k <- US1990[US1990$Year == "2001", "FTemp"] - US1990[US1990$Year == "2000", "FTemp"]
l <- US1990[US1990$Year == "2002", "FTemp"] - US1990[US1990$Year == "2001", "FTemp"]
m <- US1990[US1990$Year == "2003", "FTemp"] - US1990[US1990$Year == "2002", "FTemp"]
n <- US1990[US1990$Year == "2004", "FTemp"] - US1990[US1990$Year == "2003", "FTemp"]
o <- US1990[US1990$Year == "2005", "FTemp"] - US1990[US1990$Year == "2004", "FTemp"]
p <- US1990[US1990$Year == "2006", "FTemp"] - US1990[US1990$Year == "2005", "FTemp"]
q <- US1990[US1990$Year == "2007", "FTemp"] - US1990[US1990$Year == "2006", "FTemp"]
r <- US1990[US1990$Year == "2008", "FTemp"] - US1990[US1990$Year == "2007", "FTemp"]
s <- US1990[US1990$Year == "2009", "FTemp"] - US1990[US1990$Year == "2008", "FTemp"]
t <- US1990[US1990$Year == "2010", "FTemp"] - US1990[US1990$Year == "2009", "FTemp"]
u <- US1990[US1990$Year == "2011", "FTemp"] - US1990[US1990$Year == "2010", "FTemp"]
v <- US1990[US1990$Year == "2012", "FTemp"] - US1990[US1990$Year == "2011", "FTemp"]

# Merge all data frames
Merged.data <- function(x,y){
  YearDiff <- merge(x, y, by='FTemp')
  rownames(YearDiff) <- YearDiff$Row.names
  YearDiff$Row.names <- NULL
  return(YearDiff)
}
YearDiff <- Reduce(Merged.data, list(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v))