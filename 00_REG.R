# # # # # # # # # # R E G E N E R A # # # # # # # # # #

# Library import
library(dplyr)
library(readr)

# Data import
reg_node_db <- read.csv("/home/regenera/Documents/BART_gitHub/Course_systems_biology_introduction/00_REG_node_bd.csv", stringsAsFactors = FALSE)

# Chart and average lines for quadrant definition
plot(reg_node_db$Degree.unDir, reg_node_db$Betweenness.unDir, xlab="Degree", ylab ="Betweenness", col = "blue")
abline(h = median(reg_node_db$Betweenness.unDir), v = median(reg_node_db$Degree.unDir))

# Hubs and Bottleneck classification
g_h_b <- reg_node_db[reg_node_db$Degree.unDir >= median(reg_node_db$Degree.unDir)&(reg_node_db$Betweenness.unDir >= median(reg_node_db$Betweenness.unDir)),]
g_h_nb <- reg_node_db[reg_node_db$Degree.unDir > median(reg_node_db$Degree.unDir)&(reg_node_db$Betweenness.unDir < median(reg_node_db$Betweenness.unDir)),]
g_nh_b <- reg_node_db[reg_node_db$Degree.unDir < median(reg_node_db$Degree.unDir)&(reg_node_db$Betweenness.unDir > median(reg_node_db$Betweenness.unDir)),]
g_nh_nb <- reg_node_db[reg_node_db$Degree.unDir <= median(reg_node_db$Degree.unDir)&(reg_node_db$Betweenness.unDir <= median(reg_node_db$Betweenness.unDir)),]


# Criando coluna e nomeando conforme classificação
g_h_b$Centrality <- "HB"
g_h_nb$Centrality <- "HnB"
g_nh_b$Centrality <- "nHB"
g_nh_nb$Centrality <- "nHnB"

node_centrality <- bind_rows(g_h_b, g_h_nb, g_nh_b, g_nh_nb)

# # # # # # # # # # B. A. R. T. # # # # # # # # # #