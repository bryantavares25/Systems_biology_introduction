# # # # # # # # # # R E G E N E R A # # # # # # # # # #

# Library import
library(dplyr)
library(readr)

# Data import
node_deg_bet <- read.csv("/home/regenera/Documents/BART_gitHub/Course_systems_biology_introduction/00_REG_node_bd.csv", stringsAsFactors = FALSE)

# Chart and average lines for quadrant definition
plot(node_deg_bet$Degree.unDir, node_deg_bet$Betweenness.unDir, xlab="Degree", ylab ="Betweenness", col = "black")
abline(h = median(node_deg_bet$Betweenness.unDir), v = median(node_deg_bet$Degree.unDir))

#

# # # # # # # # # # B. A. R. T. # # # # # # # # # #