setwd("C:/Users/esmee/OneDrive/School/biotechnologie/Jaar2/Periode 4/Casus/")
install.packages('BiocManager')
BiocManager::install('Rsubread')
library(Rsubread)

#indexeren
buildindex(
  basename = 'ref_human',
  reference = 'GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)

#mappen
align.norm1 <- align(index = "ref_human", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2="SRR4785819_2_subset40k.fastq", output_file = "norm1.BAM")
align.norm2 <- align(index = "ref_human", readfile1 = "SRR4785820_1_subset40k.fastq", readfile2="SRR4785820_2_subset40k.fastq", output_file = "norm2.BAM")
align.norm3 <- align(index = "ref_human", readfile1 = "SRR4785828_1_subset40k.fastq", readfile2="SRR4785828_2_subset40k.fastq", output_file = "norm3.BAM")
align.norm4 <- align(index = "ref_human", readfile1 = "SRR4785831_1_subset40k.fastq", readfile2="SRR4785831_2_subset40k.fastq", output_file = "norm4.BAM")
align.reu1 <- align(index = "ref_human", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2="SRR4785979_2_subset40k.fastq", output_file = "reu1.BAM")
align.reu2 <- align(index = "ref_human", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2="SRR4785980_2_subset40k.fastq", output_file = "reu2.BAM")
align.reu3 <- align(index = "ref_human", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2="SRR4785986_2_subset40k.fastq", output_file = "reu3.BAM")
align.reu4 <- align(index = "ref_human", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2="SRR4785988_2_subset40k.fastq", output_file = "reu4.BAM")

BiocManager::install('Rsamtools')
library(Rsamtools)

#count matrix
#vector maken

alles <- c("norm1.BAM", "norm2.BAM", "norm3.BAM", "norm4.BAM", "reu1.BAM", "reu2.BAM", "reu3.BAM", "reu4.BAM")
count_matrix <- featureCounts(
  files = alles,
  annot.ext = "genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE, 
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE)

#filteren op counts
str(count_matrix)
counts <- count_matrix$counts
head(counts)

#kolomnamen verandseren
colnames(counts) <- c("norm1", "norm2", "norm3", "norm4", "reu1", "reu2", "reu3", "reu4")
#bestand maken
write.csv(counts, "reumasubset_countmatrix.csv")

#groot bestand openen
data=read.table(file = "count_matrix_RA.txt", header = TRUE, row.names=1)
head(data)

#packages inladen
BiocManager::install("DESeq2")
library(DESeq2)
BiocManager::install("KEGGREST")
library(KEGGREST)
BiocManager::install("EnhancedVolcano")
library(EnhancedVolcano)
BiocManager::install("pathview")
library(pathview)

#groot bestand de juiste kolomnamen geven
colnames(data)=c("norm1", "norm2", "norm3", "norm4", "reu1", "reu2", "reu3", "reu4")

#metadata tabel maken
status = c("Normaal", "Normaal", "Normaal","Normaal", "Reuma", "Reuma", "Reuma", "Reuma")
status_table = data.frame(status)
status_table
#rijnamen veranderen
rownames(status_table) = c("norm1", "norm2", "norm3", "norm4", "reu1", "reu2", "reu3", "reu4")
head(status_table)

#statistiek
ddsr <- DESeqDataSetFromMatrix(countData = data,
                               colData = status_table,
                               design = ~ status)
ddsr <- DESeq(ddsr)
resultatenR <- results(ddsr)
resultatenR

#document maken
write.table(resultatenR, file = 'ResultatenReu.csv', row.names = TRUE, col.names = TRUE)

#resultaten bekijken
sum(resultatenR$padj < 0.05 & resultatenR$log2FoldChange > 1, na.rm = TRUE)
sum(resultatenR$padj < 0.05 & resultatenR$log2FoldChange < -1, na.rm = TRUE)

hoogste_fold_changeR <- resultatenR[order(resultatenR$log2FoldChange, decreasing = TRUE), ]
laagste_fold_changeR <- resultatenR[order(resultatenR$log2FoldChange, decreasing = FALSE), ]
laagste_p_waardeR <- resultatenR[order(resultatenR$padj, decreasing = FALSE), ]
hoogste_fold_changeR
head(laagste_fold_changeR, n=10)
laagste_p_waardeR

#vulcanoplot maken
EnhancedVolcano(resultatenR,
                lab = rownames(resultatenR),
                x = 'log2FoldChange',
                y = 'padj')

#plot opslaan
dev.copy(png, 'VolcanoplotCasus.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()

#go analyse
BiocManager::install("goseq")
library(goseq)
BiocManager::install("geneLenDataBase") 
library(geneLenDataBase)
BiocManager::install("org.Dm.eg.db") 
library(org.Dm.eg.db)
library("magrittr")
library(dplyr)

#tabellen maken  
All=rownames(resultatenR)
allt=as.data.frame(resultatenR)

#tabel maken met gefilterde resultaten
DEG=allt%>%filter(padj<0.05, log2FoldChange<=-1 | log2FoldChange>=1)

DEGG=rownames(DEG)
class(DEGG)
DEGG

#kijken welke genen significant verschillen
gene.vector=as.integer(All%in%DEGG)
names(gene.vector)=All
gene.vector

BiocManager::install("tidyverse")
library(tidyverse)

#opties bekijken van humaan genoom
supportedOrganisms() %>% filter(str_detect(Genome, "hg"))

#GO-analyse uitvoeren met hg19 als referentiegenoom
pwf=nullp(gene.vector,"hg19","geneSymbol")
GO.wall=goseq(pwf,"hg19","geneSymbol")

class(GO.wall)
head(GO.wall)
nrow(GO.wall)

enriched.GO=GO.wall$category[GO.wall$over_represented_pvalue<.05]
class(enriched.GO)
head(enriched.GO)
length(enriched.GO)


library(dplyr)
library(ggplot2)

# Selecteer de 10 meest significante GO-termen
top10 <- GO.wall %>%
  arrange(over_represented_pvalue) %>%
  slice(1:10)

# Maak een kolom met -log10(p-waarde) voor betere schaal
top10$negLogP <- -log10(top10$over_represented_pvalue)

# Plot
library(stringr)
top10$term <- str_wrap(top10$term, width = 40)

ggplot(top10, aes(x = numInCat/numDEInCat, 
                  y = reorder(term, -numInCat/numDEInCat), 
                  fill = ontology)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Top 10 overgerepresenteerde GO-termen",
    y = "GO-term",
    x = "in/dein"
  ) +
  scale_fill_discrete(
    name = "Ontologie",
    labels = c(
      "BP" = "Biological Process",
      "CC" = "Cellular Component",
      "MF" = "Molecular Function"
    )
  ) +
  theme_minimal()

#pathway
allt[1] <- NULL
allt[2:5] <- NULL
allt

pathview(
  gene.data = allt,
  pathway.id = "hsa04612",  
  species = "hsa",          
  gene.idtype = "SYMBOL",     
  limit = list(gene = 5)    
)
