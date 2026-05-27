#metadata tabel maken
status = c("Normaal", "Normaal", "Normaal","Normaal", "Reuma", "Reuma", "Reuma", "Reuma")
status_table = data.frame(status)
status_table

#rijnamen veranderen
rownames(status_table) = c("norm1", "norm2", "norm3", "norm4", "reu1", "reu2", "reu3", "reu4")
head(status_table)