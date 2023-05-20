##### ##### ##### APLICAÇÃO DE BIOLOGIA DE SISTEMAS NO PROETO DE DOUTORADOA ##### ##### #####

###### Bibliotecas e pacotes importantes #####
library(dplyr)
library(igraph)
library(data.table)

###### Etapa 1 ##### Centralidades (Degree and Betweennes)

#Importando dados
network <- read.csv("04_string_cs_degree_betweenes.csv", stringsAsFactors = FALSE)
node_deg_bet <- network[,c(3,2,1)]


# Gráfico e linhas de média para definição dos quadrantes
plot(node_deg_bet$Degree.unDir, node_deg_bet$Betweenness.unDir, xlab="Degree", ylab ="Betweenness", col = "purple")
abline(h = median(node_deg_bet$Betweenness.unDir), v = median(node_deg_bet$Degree.unDir))

# Classificação de Grupamentos e Gargalos(Hubs e Bottlenecks)
g_h_b <- node_deg_bet[node_deg_bet$Degree.unDir > median(node_deg_bet$Degree.unDir)&(node_deg_bet$Betweenness.unDir > median(node_deg_bet$Betweenness.unDir)),]
g_h_nb <- node_deg_bet[node_deg_bet$Degree.unDir > median(node_deg_bet$Degree.unDir)&(node_deg_bet$Betweenness.unDir < median(node_deg_bet$Betweenness.unDir)),]
g_nh_b <- node_deg_bet[node_deg_bet$Degree.unDir < median(node_deg_bet$Degree.unDir)&(node_deg_bet$Betweenness.unDir > median(node_deg_bet$Betweenness.unDir)),]
g_nh_nb <- node_deg_bet[node_deg_bet$Degree.unDir < median(node_deg_bet$Degree.unDir)&(node_deg_bet$Betweenness.unDir < median(node_deg_bet$Betweenness.unDir)),]

# Criando coluna e nomeando conforme classificação
g_h_b$Centralities <- "HB"
g_h_nb$Centralities <- "HnB"
g_nh_b$Centralities <- "nHB"
g_nh_nb$Centrlities <- "nHnB"

node_centrality <- rbind(g_h_b, g_h_nb, g_nh_b, g_nh_nb)

#save.image("~/Downloads/Untitled.RData")

##### FIM ##### B. A. R. T.