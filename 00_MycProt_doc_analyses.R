##### ##### ##### APLICAÇÃO DE BIOLOGIA DE SISTEMAS NO PROETO DE DOUTORADOA ##### ##### #####

###### Bibliotecas e pacotes importantes #####
library(dplyr)

###### ###### ###### Etapa 1 ##### ###### ###### Centralidades (Degree and Betweennes)

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

##### ###### ###### FIM ###### ###### ##### B. A. R. T.

##### ##### ##### APLICAÇÃO DE BIOLOGIA DE SISTEMAS NO PROETO DE DOUTORADOA ##### ##### #####

###### Bibliotecas e pacotes importantes #####
library(dplyr)
library(igraph)

###### ###### ###### Etapa 2 ###### ###### ##### Comunidades e Modularidade (algoritmo walktrap)

# Imporantando rede
string_interaction_short <- read.delim("03_string_interactions_short.tsv")

# Selecionando a rede de interesse
network <- string_interaction_short[,c(1,2,13)]
network_igraph <- graph_from_data_frame(network, directed = FALSE, vertices = NULL)
plot(network_igraph)

# Rede de análise de comunidades usando o algoritmo walktrap
network_igraph_walktrap <- walktrap.community(network_igraph, weights = E(network_igraph)$weight, steps = 4, merge = TRUE)

network_igraph_walktrap.names <- as.data.frame(network_igraph_walktrap$names)
network_igraph_walktrap.membership <- as.data.frame(network_igraph_walktrap$membership)

network_igraph_walktrap.bind <- cbind(network_igraph_walktrap.names, network_igraph_walktrap.membership)

# Arrumando a nomenclatura das colunas do dataframe
names(network_igraph_walktrap.bind) [names(network_igraph_walktrap.bind) == "network_igraph_walktrap$names"] <- "Nodes"
names(network_igraph_walktrap.bind) [names(network_igraph_walktrap.bind) == "network_igraph_walktrap$membership"] <- "Module"

### - Adaptação do código - testspace

# Importando dados de centraliade obtidos no Cytoscape

network_centrality_01 <- as.data.frame(node_centrality$name)
network_centrality_02 <- as.data.frame(node_centrality$Betweenness.unDir)
network_centrality_03 <- as.data.frame(node_centrality$Degree.unDir)
network_centrality_04 <- as.data.frame(node_centrality$Centrality)

network_centrality <- cbind(network_centrality_01, network_centrality_02, network_centrality_03, network_centrality_04)

# Arrumando nomes das colunas do dataframe
names(network_centrality) [names(network_centrality) == "node_centrality$name"] <- "Nodes"
names(network_centrality) [names(network_centrality) == "node_centrality$Betweenness.unDir"] <- "Betweennes"
names(network_centrality) [names(network_centrality) == "node_centrality$Degree.unDir"] <- "Degree"
names(network_centrality) [names(network_centrality) == "node_centrality$Centrality"] <- "Centrality"

# Combinando a análises de comunidade e centralidades gerando um dataframe concatenado
network_combined.df <- merge(network_igraph_walktrap.bind, network_centrality, by = "Nodes")
write.table(cbind(rownames(network_combined.df), network_combined.df), file = '05_Network_centrality_modularity.txt', sep ='\t',row.names = F, quote = F)

# Comando para selecionar uma comunidade de nós de interesse

network_combined.df %>% group_by('Module') %>% count('Centrality')
Cluster_8_wtc <- subset(network_igraph_walktrap.bind, Module == "8" )
Cluster_4_wtc <- subset(network_igraph_walktrap.bind, Module == "4" )

##### FIM ##### B. A. R. T.

#Bioconductor
#cluster profile
#redução de similararidade semâtica


#Rrvigo