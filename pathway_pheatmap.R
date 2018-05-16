library(RColorBrewer)
library(pheatmap)
setwd("/Users/gloria/Documents/Project/pan-cancer-2018/analysis/mrna/Diff_Expression_Genes")

tumor_class = read.table("/Users/gloria/Documents/Project/pan-cancer-2018/analysis/mrna/tumor_classification.txt",sep = '\t',header = TRUE)
rownames(tumor_class) = tumor_class[,1]
annotation_row_file= tumor_class[,2:dim(tumor_class)[2]]
annotation_rows= annotation_row_file

fdr_lipidpath = read.table("lipid_pathways_pvalue.txt",sep = '\t', header = TRUE)
fdr_data = data.frame(fdr_lipidpath[,2:dim(fdr_lipidpath)[2]])

rownames(fdr_data) = as.vector(fdr_lipidpath[,1])

breaksList = seq(0, 1, by = 0.05)

pheatmap(fdr_data, # Plots the first 10 genes of the dataset
         color = colorRampPalette((brewer.pal(n = 7, name = "RdYlBu")))(length(breaksList)), 
         breaks = breaksList, annotation_col=rev(annotation_rows),  border="white") 
