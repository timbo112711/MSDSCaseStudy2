####################################################################
## Case Study 2: Orange Tree Analysis
####################################################################
## Tim McWilliams, Joseph Denney, & Laurie Harris
## 24 April 2017
######################################################################


# Gather the datasets

source("Orange_Data.R")

# Calculate Mean and Medians of Tree Circumference

source("Orange_Calc.R")

# Prepare scatter and box plots

source("Orange_Plots.R")

# Markown file containing:
# 1) the introcution of the project,
# 2) code & brief explanations,
# 3) code to answer the 3 questions,
# 4) and the conclustion to the project.

# NOTE: You can't simply source an Rmd file, however you can knit it useing the knit() function.
# Must install the package "knitr" if not already installed. Load the package with the library() fucntion.
# Then call the knit() on the Rmd file.

library(knitr)
knit("Orange_Report.Rmd")

