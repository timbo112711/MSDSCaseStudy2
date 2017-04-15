####################################################################
## Case Study 2: Temperature Analysis
####################################################################
## Tim McWilliams, Joseph Denney, & Laurie Harris
## 24 April 2017
######################################################################

# Load libraries 
library(plyr)
library(dplyr)
library(ggplot2)

## Question 3i.##
#################

# import the datasets (Temp.csv & CityTemp.csv)
source("TempData.R")

# Tidy up the data
source("DataCleanUp.R")

# Calculate Max and Min for each country since 1900
source("MaxandMin.R")

# Merge the data together and perform some clean up
source("MergeData.R")

# Plot the top 20 countries with the maximum differences 
source("Top20_Plot.R")

## Question 3ii.##
##################


