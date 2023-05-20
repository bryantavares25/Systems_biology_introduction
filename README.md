# Systems_biology_introduction

**String**
Entrada: MHP_proteases_aa_seq.fasta (Sequência de aminoácidos de 27 proteases de M. hyopneumoniae 7448)
Mapping: M. hyopneumoniae 7448 -> M.hyopneumoniae 232

Configurações:
STRING Versão 11.5
Pontuação de interação: 0,4 → 1
Preditores: Experimentos, Bancos de dados, Co-expressão, Vizinhança, Fusão gênica, Co-ocorrência
Interactores: 1ª camada < 270 | 2ª Camada < 135

Saída: string_interactions_short.tsv
number of nodes: 428
number of edges: 7631
average node degree: 35.7
avg. local clustering coefficient: 0.497
expected number of edges: 7790
PPI enrichment p-value: 0.965

**Cytoscape**
Abri o arquivo 'string_interactions_short.tsv'
Selecionei para análise apenas as proteínas conectadas entre si numa grande rede. Proteínas isoladas foram descartadas: mhp335, mhp334, mhp332; mhp311, mhp312, mhp310; mhp444, mhp445; mhp336, mhp337. 426 Nodes -> 416 Nodes
Citiscape 2.2 -> Análise de Degree and Betweenes

