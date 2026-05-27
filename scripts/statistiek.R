#package inladen
BiocManager::install("DESeq2")
library(DESeq2)

#differentiële genexpressie analyse
ddsr <- DESeqDataSetFromMatrix(countData = data,
                               colData = status_table,
                               design = ~ status)
ddsr <- DESeq(ddsr)
resultatenR <- results(ddsr)
resultatenR