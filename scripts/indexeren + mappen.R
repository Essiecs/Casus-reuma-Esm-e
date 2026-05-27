#juiste packages downloaden
install.packages('BiocManager')
BiocManager::install('Rsubread')
library(Rsubread)

# indexeren
buildindex(
  basename = 'ref_human',
  reference = 'GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)

#mappen voor elke patiënt
align.norm1 <- align(index = "ref_human", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2="SRR4785819_2_subset40k.fastq", output_file = "norm1.BAM")
align.norm2 <- align(index = "ref_human", readfile1 = "SRR4785820_1_subset40k.fastq", readfile2="SRR4785820_2_subset40k.fastq", output_file = "norm2.BAM")
align.norm3 <- align(index = "ref_human", readfile1 = "SRR4785828_1_subset40k.fastq", readfile2="SRR4785828_2_subset40k.fastq", output_file = "norm3.BAM")
align.norm4 <- align(index = "ref_human", readfile1 = "SRR4785831_1_subset40k.fastq", readfile2="SRR4785831_2_subset40k.fastq", output_file = "norm4.BAM")
align.reu1 <- align(index = "ref_human", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2="SRR4785979_2_subset40k.fastq", output_file = "reu1.BAM")
align.reu2 <- align(index = "ref_human", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2="SRR4785980_2_subset40k.fastq", output_file = "reu2.BAM")
align.reu3 <- align(index = "ref_human", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2="SRR4785986_2_subset40k.fastq", output_file = "reu3.BAM")
align.reu4 <- align(index = "ref_human", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2="SRR4785988_2_subset40k.fastq", output_file = "reu4.BAM")
