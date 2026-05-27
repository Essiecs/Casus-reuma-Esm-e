#juiste kolommen selecteren
allt[1] <- NULL
allt[2:5] <- NULL
allt

#visualisatie
pathview(
  gene.data = allt,
  pathway.id = "hsa04612",  
  species = "hsa",          
  gene.idtype = "SYMBOL",     
  limit = list(gene = 5)    
)