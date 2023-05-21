##### ##### ##### APLICAÇÃO DE BIOLOGIA DE SISTEMAS NO PROETO DE DOUTORADOA ##### ##### #####

###### Bibliotecas e pacotes importantes #####
library(dplyr)

###### Etapa 1 ##### Centralidades (Degree and Betweennes)

#Importando dados
node_deg_bet <- read.csv("04_string_cs_degree_betweenes.csv", stringsAsFactors = FALSE)

# Gráfico e linhas de média para definição dos quadrantes
plot(node_deg_bet$Degree.unDir, node_deg_bet$Betweenness.unDir, xlab="Degree", ylab ="Betweenness", col = "green")
abline(h = median(node_deg_bet$Betweenness.unDir), v = median(node_deg_bet$Degree.unDir))

# Classificação de Grupamentos e Gargalos(Hubs e Bottlenecks)
g_h_b <- node_deg_bet[node_deg_bet$Degree.unDir >= median(node_deg_bet$Degree.unDir)&(node_deg_bet$Betweenness.unDir >= median(node_deg_bet$Betweenness.unDir)),]
g_h_nb <- node_deg_bet[node_deg_bet$Degree.unDir > median(node_deg_bet$Degree.unDir)&(node_deg_bet$Betweenness.unDir < median(node_deg_bet$Betweenness.unDir)),]
g_nh_b <- node_deg_bet[node_deg_bet$Degree.unDir < median(node_deg_bet$Degree.unDir)&(node_deg_bet$Betweenness.unDir > median(node_deg_bet$Betweenness.unDir)),]
g_nh_nb <- node_deg_bet[node_deg_bet$Degree.unDir <= median(node_deg_bet$Degree.unDir)&(node_deg_bet$Betweenness.unDir <= median(node_deg_bet$Betweenness.unDir)),]

# Criando coluna e nomeando conforme classificação
g_h_b$Centrality <- "HB"
g_h_nb$Centrality <- "HnB"
g_nh_b$Centrality <- "nHB"
g_nh_nb$Centrality <- "nHnB"

node_centrality <- bind_rows(g_h_b, g_h_nb, g_nh_b, g_nh_nb)

##### FIM ##### B. A. R. T.

##### ##### ##### APLICAÇÃO DE BIOLOGIA DE SISTEMAS NO PROETO DE DOUTORADOA ##### ##### #####

###### Bibliotecas e pacotes importantes #####
library(dplyr)
library(igraph)

###### Etapa 2 ##### Agrupamento (walktrap)

