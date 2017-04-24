################################################################################
## Case Study 2: Orange Tree Analysis & Temperature Analysis: countries & Cities
################################################################################
## Tim McWilliams, Joseph Denney, & Laurie Harris
## 24 April 2017
################################################################################
# Load libraries 
library(lubridate)
library(plyr)
library(dplyr)
library(ggplot2)
library(knitr)
library(readr)
library(pander)
library(data.table)

## Orange Tree Analysis ##
##########################

# Gather the datasets

source("Orange_Data.R")

# Calculate Mean and Medians of Tree Circumference

source("Orange_Calc.R")

# Prepare scatter and box plots

source("Orange_Plots.R")


## Temperature Analysis: Countries & Cities ##
##############################################

## Countries ##
###############

# Import the dataset (Temp.csv)
source("TempData.R")

# Tidy up the dataset
source("TempDataCleanUp.R")

# Calculate Max and Min for each country since 1900
source("MaxandMin.R")

# Merge the data together and perform some clean up
source("MergeData.R")

# Plot the top 20 countries with the maximum differences 
source("Top20Countries_Plot.R")

# Subset the Temp dataset for US land temperatures from 01/01/1990 
source("USTemp.R")

# Create new column that displays the monthly average land temperatures in Fahrenheit (°F). 
source("DegreeF.R")

# Calculate average land temperature by year
source("AnnualLandTemp.R")

# Plot average land temperature by year
source("ALT_Plot.R")

# Calculate the one year difference of average land temperature by year and provide the maximum difference (value) with corresponding two years. 
source("YearCalcDiff.R")

## Cities ##
############

# Import the dataset (CityTemp.csv)
source("CityTemperature.R")

# Tidy up the dataset
source("CityDataCleanUp.R")

# Calculate Max and Min for each major city since 1900
source("CityMaxandMin.R")

# Plot the top 20 countries with the maximum differences 
source("Top20Cities_Plot.R")


# Markown file containing:
# 1) the introcution of the project,
# 2) code & brief explanations,
# 3) code to answer the 3 questions,
# 4) and the conclustion to the project.
library(knitr)
knit("Report.Rmd")
# NOTE: You can't simply source an Rmd file, however you can knit it useing the knit() function.
# Must install the package "knitr" if not already installed. Load the package with the library() fucntion.
# Then call the knit() on the Rmd file.

knit("Final_Report.Rmd")
