# =====================================
# Modul GEO Analysis Capstone Project
# Dataset: GSE8091
# Tujuan: Transcriptome analysis of early embryonic
# mouse brain development
# =====================================

# Install packages
if (!require("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

BiocManager::install(c(
  "GEOquery","limma","ggplot2","dplyr",
  "umap","pheatmap","Biobase","VennDiagram"
), ask = FALSE, update = FALSE)

# Load libraries
library(GEOquery)
library(limma)
library(ggplot2)
library(dplyr)

# =====================================
# Download GEO dataset
# =====================================

gse <- getGEO("GSE8091", GSEMatrix=TRUE)

exprSet <- exprs(gse[[1]])
pdata <- pData(gse[[1]])
fdata <- fData(gse[[1]])

# =====================================
# Export RAW GEO data
# =====================================

write.csv(exprSet,
          "data_raw/GSE8091_expression_raw.csv")

write.csv(pdata,
          "data_raw/GSE8091_metadata.csv")

write.csv(fdata,
          "data_raw/GSE8091_gene_annotation.csv")

# =====================================
# Log transform check
# =====================================

qx <- as.numeric(quantile(exprSet,
                          c(0,0.25,0.5,0.75,0.99,1),
                          na.rm=TRUE))

LogTransform <- (qx[5] > 100) ||
  (qx[6]-qx[1] > 50 && qx[2] > 0)

if (LogTransform) {
  exprSet[exprSet <= 0] <- NA
  exprSet <- log2(exprSet)
}

write.csv(exprSet,
          "data_processed/GSE8091_expression_log2.csv")

# =====================================
# Boxplot per GSM
# =====================================

par(mar=c(8,4,2,1))

boxplot(exprSet,
        outline=FALSE,
        las=2,
        col="lightblue",
        main="Expression distribution per GSM",
        ylab="Log2 Expression")

abline(h=median(exprSet, na.rm=TRUE),
       col="red",
       lty=2)

# =====================================
# Sample grouping
# =====================================

pdata$group <- gsub("Embryonic tissue at day ",
                    "",
                    pdata$source_name_ch1)

pdata$group <- factor(pdata$group,
                      levels=c("9.5","11.5","13.5"),
                      ordered=TRUE)

# =====================================
# Design matrix
# =====================================

design <- model.matrix(~0 + group, data=pdata)

colnames(design) <- c("E9_5","E11_5","E13_5")

# =====================================
# Linear model fitting
# =====================================

fit <- lmFit(exprSet, design)

contrast.matrix <- makeContrasts(
  
  E11_5_vs_E9_5 = E11_5 - E9_5,
  E13_5_vs_E9_5 = E13_5 - E9_5,
  E13_5_vs_E11_5 = E13_5 - E11_5,
  
  levels = design
)

fit2 <- contrasts.fit(fit, contrast.matrix)
fit2 <- eBayes(fit2)

# =====================================
# MA plots
# =====================================

plotMA(fit2, coef=1, main="MA Plot E11.5 vs E9.5")
plotMA(fit2, coef=2, main="MA Plot E13.5 vs E9.5")
plotMA(fit2, coef=3, main="MA Plot E13.5 vs E11.5")

# =====================================
# QQ plots
# =====================================

qqt(fit2$t[,1], df=fit2$df.total[1],
    main="QQ Plot E11.5 vs E9.5")

qqt(fit2$t[,2], df=fit2$df.total[2],
    main="QQ Plot E13.5 vs E9.5")

qqt(fit2$t[,3], df=fit2$df.total[3],
    main="QQ Plot E13.5 vs E11.5")

# =====================================
# Extract DEG
# =====================================

deg_list <- lapply(colnames(fit2$coefficients),
                   function(coef_name){
                     
                     topTable(fit2,
                              coef = coef_name,
                              number = Inf)
                     
                   })

names(deg_list) <- colnames(fit2$coefficients)

# DEG classification

deg_list <- lapply(deg_list, function(df){
  
  df$status <- "Not Significant"
  
  df$status[df$adj.P.Val < 0.05 & df$logFC > 1] <- "Upregulated"
  
  df$status[df$adj.P.Val < 0.05 & df$logFC < -1] <- "Downregulated"
  
  df
  
})

write.csv(deg_list$E11_5_vs_E9_5,
          "results/tables/DEG_E11_5_vs_E9_5.csv")

write.csv(deg_list$E13_5_vs_E9_5,
          "results/tables/DEG_E13_5_vs_E9_5.csv")

write.csv(deg_list$E13_5_vs_E11_5,
          "results/tables/DEG_E13_5_vs_E11_5.csv")

# =====================================
# Volcano plot function
# =====================================

plot_volcano <- function(df,title){
  
  ggplot(df,
         aes(x=logFC,
             y=-log10(adj.P.Val),
             color=status))+
    
    geom_point(alpha=0.6)+
    
    scale_color_manual(values=c(
      "Upregulated"="red",
      "Downregulated"="blue",
      "Not Significant"="grey"
    ))+
    
    geom_vline(xintercept=c(-1,1),
               linetype="dashed")+
    
    geom_hline(yintercept=-log10(0.05),
               linetype="dashed")+
    
    theme_minimal()+
    ggtitle(title)
}

plot_volcano(deg_list$E11_5_vs_E9_5,"E11.5 vs E9.5")
plot_volcano(deg_list$E13_5_vs_E9_5,"E13.5 vs E9.5")
plot_volcano(deg_list$E13_5_vs_E11_5,"E13.5 vs E11.5")

# =====================================
# UMAP
# =====================================

library(umap)

# hapus gene dengan NA
expr_noNA <- exprSet[complete.cases(exprSet),]

# transpose
expr_for_umap <- t(expr_noNA)

# scaling
expr_for_umap <- scale(expr_for_umap)

# hapus column variance 0
expr_for_umap <- expr_for_umap[, apply(expr_for_umap,2,var,na.rm=TRUE) > 0]

# hapus kolom yang masih mengandung NA
expr_for_umap <- expr_for_umap[, colSums(is.na(expr_for_umap)) == 0]

set.seed(123)

umap_res <- umap(expr_for_umap)

umap_df <- as.data.frame(umap_res$layout)
colnames(umap_df) <- c("UMAP1","UMAP2")

umap_df$Stage <- pdata$group

ggplot(umap_df,
       aes(UMAP1,UMAP2,color=Stage))+
  geom_point(size=4)+
  theme_minimal()+
  ggtitle("UMAP according to stage")

# =====================================
# Venn Diagram
# =====================================

library(VennDiagram)

deg_E9_5 <- rownames(deg_list$E11_5_vs_E9_5[
  deg_list$E11_5_vs_E9_5$adj.P.Val < 0.05 &
    abs(deg_list$E11_5_vs_E9_5$logFC) > 1, ])

deg_E11_5 <- rownames(deg_list$E13_5_vs_E11_5[
  deg_list$E13_5_vs_E11_5$adj.P.Val < 0.05 &
    abs(deg_list$E13_5_vs_E11_5$logFC) > 1, ])

deg_E13_5 <- rownames(deg_list$E13_5_vs_E9_5[
  deg_list$E13_5_vs_E9_5$adj.P.Val < 0.05 &
    abs(deg_list$E13_5_vs_E9_5$logFC) > 1, ])

venn.plot <- venn.diagram(
  x = list(
    "E9.5"  = deg_E9_5,
    "E11.5" = deg_E11_5,
    "E13.5" = deg_E13_5
  ),
  filename = NULL,
  fill = c("skyblue","pink","lightgreen"),
  alpha = 0.5,
  
  # font angka
  fontfamily = "sans",
  cex = 1.5,
  
  # font label set
  cat.fontfamily = "sans",
  cat.cex = 1.5,
  cat.col = "black"
)

plot(venn.plot)

# =====================================
# Heatmap top DEG
# =====================================

library(pheatmap)
library(Biobase)

fdata <- fData(gse[[1]])

# cari kolom gene symbol otomatis
symbol_col <- grep("symbol", colnames(fdata), ignore.case = TRUE, value = TRUE)[1]

deg <- deg_list$E11_5_vs_E9_5

deg$GeneSymbol <- fdata[rownames(deg), symbol_col]

deg <- deg[deg$GeneSymbol != "" & !is.na(deg$GeneSymbol),]

deg <- deg[order(deg$adj.P.Val),]

deg_unique <- deg[!duplicated(deg$GeneSymbol),]

top_genes <- head(deg_unique$GeneSymbol,100)

top_probes <- rownames(
  deg_unique[deg_unique$GeneSymbol %in% top_genes,]
)

expr_top <- exprSet[top_probes,]

rownames(expr_top) <-
  deg_unique$GeneSymbol[
    match(rownames(expr_top),
          rownames(deg_unique))
  ]

expr_top_z <- t(scale(t(expr_top)))

annotation_col <- data.frame(Stage=pdata$group)
rownames(annotation_col) <- colnames(expr_top_z)

pheatmap(expr_top_z,
         annotation_col=annotation_col,
         show_rownames=TRUE,
         cluster_rows=TRUE,
         cluster_cols=TRUE,
         fontsize_row=6,
         main="Top 100 DEG")

# =====================================
# Export gene list for GO / KEGG
# =====================================

extract_gene_list <- function(deg_table, name){
  
  deg_table$GeneSymbol <- fdata[rownames(deg_table), symbol_col]
  
  deg_table <- deg_table[
    deg_table$GeneSymbol != "" &
      !is.na(deg_table$GeneSymbol),
  ]
  
  # UP genes
  up <- deg_table[
    deg_table$adj.P.Val < 0.05 &
      deg_table$logFC > 1,
  ]
  
  up_genes <- unique(up$GeneSymbol)
  
  write.table(
    up_genes,
    paste0(name,"_UP.txt"),
    row.names = FALSE,
    col.names = FALSE,
    quote = FALSE
  )
  
  # DOWN genes
  down <- deg_table[
    deg_table$adj.P.Val < 0.05 &
      deg_table$logFC < -1,
  ]
  
  down_genes <- unique(down$GeneSymbol)
  
  write.table(
    down_genes,
    paste0(name,"_DOWN.txt"),
    row.names = FALSE,
    col.names = FALSE,
    quote = FALSE
  )
  
  cat(name,"\n")
  cat("UP:",length(up_genes),"\n")
  cat("DOWN:",length(down_genes),"\n\n")
}

# =====================================
# Apply to all comparisons
# =====================================

extract_gene_list(deg_list$E11_5_vs_E9_5,"E11_5_vs_E9_5")
extract_gene_list(deg_list$E13_5_vs_E9_5,"E13_5_vs_E9_5")
extract_gene_list(deg_list$E13_5_vs_E11_5,"E13_5_vs_E11_5")

# =====================================
# GO and KEGG analyzed via third party
# =====================================
