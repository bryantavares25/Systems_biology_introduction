##### ##### ##### PROJETO DE APRENDIZADO DE PRATICAS DA BIOLOGIA DE SISTEMAS ##### ##### #####

###### Bibliotecas e pacotes importantes #####
library(dplyr)
library(igraph)

##### Etapa 2 ##### 

# Imporantando rede
interactome <- read.delim("01_Interactions_data_from_string.tsv", stringsAsFactors = TRUE)

# Selecionando dados de interesse
network <- interactome[,c(1,2,13)]
network_igraph <- graph_from_data_frame(network, directed = FALSE, vertices = NULL)
plot(network_igraph)

# Rede de análise de comunidades usando o algoritmo walktrap
network_igraph_walktrap <- walktrap.community(network_igraph, weights = E(network_igraph)$weight, steps = 4, merges = TRUE )

network_igraph_walktrap.names <- as.data.frame(network_igraph_walktrap$names)
network_igraph_walktrap.membership <- as.data.frame(network_igraph_walktrap$membership)
network_igraph_walktrap.bind <- cbind(network_igraph_walktrap.names, network_igraph_walktrap.membership)

# Arrumando a nomenclatura das colunas do dataframe
names(network_igraph_walktrap.bind) [names(network_igraph_walktrap.bind) == "network_igraph_walktrap$names"] <- "Nodes"
names(network_igraph_walktrap.bind) [names(network_igraph_walktrap.bind) == "network_igraph_walktrap$membership"] <- "WT_Cluster"

# Importando dados de centralidade obtido no Cytoscape e produzidos no Code_step_01.R
topologies <- merge(network_igraph_walktrap.bind, nodes_centralities)
write.table(cbind(rownames(topologies), topologies), file = 'Topologies.txt', sep = '\t', row.names = F, quote = F)

topologies %>% group_by('WT_Cluster') %>% count('Centralities')

#Comando para selecionar uma comunidade de nós de interesse
Cluster_8_wtc <- subset(network_igraph_walktrap.bind, WT_Cluster == "8" )
Cluster_4_wtc <- subset(network_igraph_walktrap.bind, WT_Cluster == "4" )

##### FIM ##### B. A. R. T.