# Criar um Pacote de OrgDB de Mycoplasma hyopneumoniae para utilizar no rrvigo

library(AnnotationDbi)
library(AnnotationForge)
library(AnnotationHub)

# ?makeOrgPackageFromNCBI
#makeOrgPackageFromNCBI(version = "0.1", author = "BART <bryantavares25@gmail.com>", maintainer = "BART <bryantavares25@gmail.com>", outputDir = ".", tax_id = "2100", genus = "Mesomycoplasma", species = "hyorhinis",)

#hub = AnnotationHub()
#query(hub, c("Escherichia coli"))
#org.EcK12.eg.db

##### rrvgo

#library(rrvgo)
#go_analysis <- read.delim(system.file("05_Network_centrality_modularity.txt", package="rrvgo"))
#simMatrix <- calculateSimMatrix(go_analysis$ID, orgdb="org.EcK12.eg.db", ont="BP", method="Rel")

##### GOSemSim
#install
# if (!requireNamespace("BiocManager", quietly = TRUE))
#install.packages("BiocManager")
#BiocManager::install("GOSemSim")


##### clusterProfiler

#install
# if (!requireNamespace("BiocManager", quietly = TRUE))
#install.packages("BiocManager")
#BiocManager::install("clusterProfiler")


