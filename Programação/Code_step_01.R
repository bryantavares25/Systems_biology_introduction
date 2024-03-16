##### ##### ##### PROJETO DE APRENDIZADO DE PRATICAS DA BIOLOGIA DE SISTEMAS ##### ##### #####

###### Bibliotecas e pacotes importantes #####
library(dplyr)

###### Etapa 1 ##### Centralidades (Degree and Betweennes)

#Importando dados
nodes_deg_bet <- read.csv("02_Node_degree_and_betweeness_from_cytoscape.csv", stringsAsFactors = FALSE)

# Gráfico e linhas de média para definição dos quadrantes
plot(nodes_deg_bet$Degree.unDir, nodes_deg_bet$Betweenness.unDir, xlab="Degree", ylab ="Betweenness", col = "green")
abline(h = median(nodes_deg_bet$Betweenness.unDir), v = median(nodes_deg_bet$Degree.unDir))

# Classificação de Grupamentos e Gargalos(Hubs e Bottlenecks)
group_hb <- nodes_deg_bet[nodes_deg_bet$Degree.unDir > median(nodes_deg_bet$Degree.unDir)&(nodes_deg_bet$Betweenness.unDir > median(nodes_deg_bet$Betweenness.unDir)),]
group_hnb <- nodes_deg_bet[nodes_deg_bet$Degree.unDir > median(nodes_deg_bet$Degree.unDir)&(nodes_deg_bet$Betweenness.unDir < median(nodes_deg_bet$Betweenness.unDir)),]
group_nhb <- nodes_deg_bet[nodes_deg_bet$Degree.unDir < median(nodes_deg_bet$Degree.unDir)&(nodes_deg_bet$Betweenness.unDir > median(nodes_deg_bet$Betweenness.unDir)),]
group_nhnb <- nodes_deg_bet[nodes_deg_bet$Degree.unDir < median(nodes_deg_bet$Degree.unDir)&(nodes_deg_bet$Betweenness.unDir < median(nodes_deg_bet$Betweenness.unDir)),]

# Criando coluna e nomeando conforme classificação
group_hb$Centralities <- "HB"
group_hnb$Centralities <- "HNB"
group_nhb$Centralities <- "NHB"
group_nhnb$Centralities <- "NHNB"

nodes_centralities <- rbind(group_hb, group_hnb, group_nhb, group_nhnb)
#save.image("~/Downloads/Untitled.RData")

##### FIM ##### B. A. R. T.