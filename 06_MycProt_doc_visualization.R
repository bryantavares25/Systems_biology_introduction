##### ##### ##### APLICAÇÃO DE BIOLOGIA DE SISTEMAS NO PROETO DE DOUTORADOA ##### ##### #####

###### Bibliotecas e pacotes importantes #####

#Pacotes instalados a partir do BiocManeger do pacote Bioconductor
library(GOSemSim)
library(clusterProfiler)

###### ###### ###### Etapa 3 ##### ###### ###### Análise funcional

# Eu tenho um arquivo com as features calculadas. Agora, então
#input: Network + data from 05_Network_centrality_modularity.txt
#library(AnnotationHub)

ego <- enrichGO(gene          = gene,
                universe      = names(geneList),
                OrgDb         = org.Hs.eg.db,
                ont           = "CC",
                pAdjustMethod = "BH",
                pvalueCutoff  = 0.01,
                qvalueCutoff  = 0.05,
                readable      = TRUE)