#juiste packages inladen
install.packages('BiocManager')
BiocManager::install('Rsubread')
library(Rsubread)


#vector maken
alles = c("norm1.BAM", "norm2.BAM", "norm3.BAM", "norm4.BAM", "reu1.BAM", "reu2.BAM", "reu3.BAM", "reu4.BAM")

#count matrix
count_matrix = featureCounts(
  files = alles,
  annot.ext = "genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE, 
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE)

#filteren op counts
str(count_matrix)
counts = count_matrix$counts

#kolomnamen veranderen
colnames(counts) = c("norm1", "norm2", "norm3", "norm4", "reu1", "reu2", "reu3", "reu4")

#bestand maken
write.csv(counts, "reumasubset_countmatrix.csv")
