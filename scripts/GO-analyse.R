#package inladen
BiocManager::install("goseq")
library(goseq)


#GO-analyse uitvoeren met hg19 als referentiegenoom
pwf=nullp(gene.vector,"hg19","geneSymbol")
GO.wall=goseq(pwf,"hg19","geneSymbol")

#Bekijken
class(GO.wall)
head(GO.wall)
nrow(GO.wall)

#filteren
enriched.GO=GO.wall$category[GO.wall$over_represented_pvalue<.05]
class(enriched.GO)
head(enriched.GO)
length(enriched.GO)
