###### Atividade prática de Introdução a Biologia de Sistemas #####

#### Comandos e bibliotecas utilizados para análise de comunidades ####

# Comando para converter o arquivo .tsv do String e importar no R como dataframe
string_interactions_short <- read.delim("~/string_interactions_short.tsv")

# Bibliotecaso para converter um dataframe em grafo
library(dplyr)
library(igraph)
rede <- string_interactions_short[,c(1,2,13)]
rede_igraph <- graph_from_data_frame(rede, directed = FALSE, vertices = NULL)
plot(rede_igraph)

# Rede de análise de comunidades usando o algoritmo walktrap
rede_igraph_walktrap <- walktrap.community(rede_igraph, weights = E(rede_igraph)$weight, steps = 4, merge = TRUE)

rede_igraph_walktrap.df1 <- as.data.frame(rede_igraph_walktrap$names)
rede_igraph_walktrap.df2 <- as.data.frame(rede_igraph_walktrap$membership)
rede_igraph_walktrap.mdf <- cbind(rede_igraph_walktrap.df1, rede_igraph_walktrap.df2)

# Arrumando nomes das colunas do dataframe
names(rede_igraph_walktrap.mdf) [names(rede_igraph_walktrap.mdf) == "rede_igraph_walktrap$names"] <- "Nodes"
names(rede_igraph_walktrap.mdf) [names(rede_igraph_walktrap.mdf) == "rede_igraph_walktrap$membership"] <- "Module"

# Importando dados de centraliade obtidos no Cytoscape
#string_centralities <- read.csv("~/bad.csv")

rede_completa.1 <- as.data.frame(rede_completa$Betweenness.unDir)
rede_completa.2 <- as.data.frame(rede_completa$Degree.unDir)
rede_completa.3 <- as.data.frame(rede_completa$name)
rede_completa.4 <- as.data.frame(rede_completa$centralidades)
rede_completa_nova <- cbind(rede_completa.3, rede_completa.1, rede_completa.2, rede_completa.4)

# Arrumando nomes das colunas do dataframe
names(rede_completa_nova) [names(rede_completa_nova) == "rede_completa_nova$Betweenness.unDir"] <- "Betweennes"
names(rede_completa_nova) [names(rede_completa_nova) == "rede_completa_nova$Degree.unDir"] <- "Centralities"
names(rede_completa_nova) [names(rede_completa_nova) == "rede_completa_nova$name"] <- "Nodes"
names(rede_completa_nova) [names(rede_completa_nova) == "rede_completa$centralidades"] <- "Class"

# Combinando a análises de comunidade e centralidades gerando um dataframe concatenado
combined.df <- merge(rede_igraph_walktrap.mdf, rede_completa_nova, by="Nodes")
write.table(cbind(rownames(combined.df), combined.df), file = 'Combinadas.txt', sep ='\t',row.names = F, quote = F)

# Selecionando a comunidade com maior número de hubs gargalos
