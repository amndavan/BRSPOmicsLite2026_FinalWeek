# BRSPOmicsLite2026 Final Week - Capstone Project
## A. Introduction
Transcriptomic techniques have revolutionized many areas of biology. By
analyzing the transcriptome which is the complete set of RNA transcripts expressed
in a cell or organism, we can better understand how genes are regulated across
tissues and under different conditions, such as disease or in response to
therapeutic interventions. This approach provides valuable insight into the
underlying molecular mechanisms that drive these biological processes (Lowe et
al., 2017).

Several methods are available to study transcriptomics. Currently, RNA
sequencing (RNA-seq) is one of the most widely used state-of-the-art technologies.
It can be performed at different resolutions, including bulk RNA-seq, single-cell
RNA-seq, and even spatial transcriptomics. The standard workflow typically
involves RNA extraction, library preparation, sequencing, and subsequent data
analysis (Wang et al., 2024). Another well-established method is microarray
analysis, which has also made significant contributions to the field. Although both
techniques aim to quantify gene expression, they differ in their underlying
technologies. Microarrays detect fluorescently labeled complementary DNA (cDNA)
molecules through hybridization to complementary probes on a solid surface, with
gene expression levels represented by fluorescence intensity. In contrast, RNA-seq
utilizes next-generation sequencing (NGS) to sequence cDNA molecules directly,
providing a digital and sequential readout of transcript abundance (Raplee et al.,
2025).

In downstream analysis, the identification of differentially expressed genes
(DEGs) is a central step for both microarray and RNA-seq datasets. DEG analysis is
typically performed between two or more experimental groups to identify genes
that show statistically significant changes in expression under different conditions.
These changes are commonly represented as log2 fold change (FC). Following DEG
identification, further analyses such as pathway enrichment analysis are conducted
to interpret the biological significance of the results and to uncover transcriptome-
related alterations in molecular pathways (Rosati et al., 2024).

### Objectives
- Identification of genes that are significantly or differentially altered across
the compared conditions.
- Enhancement of our understanding as researchers regarding the potential
biological implications indicated by the identified differentially expressed
genes (DEGs).

## B. Dataset Overview
Title: Transcriptome and proteome analysis of early embryonic mouse brain development

Accession ID: GSE8091

Problem statement

## C. Samples and Grouping
| Developmental Stage | Replicates (n) |
|---------------------|---------------|
| E9.5                | 6             |
| E11.5               | 4             |
| E13.5               | 6             |

GEO2R Parameter
- P-values: Benjamini&Hochberg
- Log transformation: Yes
- Limma precision weights (vooma): Yes
- Force normalization : Yes
- Significance level cut-off : 0.05

## D. Workflow


## E. Results and Discussion
### Differentially Expressed Genes (DEGs)
After applying the selection criteria and removing blank array results and
duplicate entries, a total of DEGs were identified in DF+DHF patients compared to
controls (Figure 1A&1B). Among these, genes several were upregulated and were downregulated.
Clustering analysis using UMAP (Figure 1C) showed that most DF+DHF and control
samples didn't form distinct clusters based on their gene expression profiles. This pattern may reflect biological heterogeneity, 
technical limitations in dimensionality reduction, or potential batch effects requiring further validation.

- **A**
![Fig 1A.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/Boxplot%20Normalization.png)
- **A**
![Fig 1B.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/UMAP.png)
> Figure 1. Volcano plot showing differentially expressed genes between Control and DF+DHF patients. Red dots
represent significantly upregulated genes, blue dots represent significantly downregulated genes, and
black dots indicate non-significant genes (Padj≤0.05) (A). MA plot displaying the relationship
between log₂ fold change and mean log₂ expression levels, highlighting significantly upregulated
(red) and downregulated (blue) genes (B). UMAP projection illustrating sample
clustering based on global gene expression profiles. Control samples (purple) and DF+DHF samples (green)
form distinct clusters, indicating clear transcriptomic differences between groups (C).

- **A**
![Fig 2A.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/VOL%20Plot%20E11_5%20vs%20E9_5.png)
- **B**
![Fig 2B.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/VOL%20Plot%20E13_5%20vs%20E11_5.png)
- **C**
![Fig 2C.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/VOL%20Plot%20E13_5%20vs%20E9_5.png)
> Figure 1. Volcano plot showing differentially expressed genes between Control and DF+DHF patients. Red dots
represent significantly upregulated genes, blue dots represent significantly downregulated genes, and
black dots indicate non-significant genes (Padj≤0.05) (A). MA plot displaying the relationship
between log₂ fold change and mean log₂ expression levels, highlighting significantly upregulated
(red) and downregulated (blue) genes (B). UMAP projection illustrating sample
clustering based on global gene expression profiles. Control samples (purple) and DF+DHF samples (green)
form distinct clusters, indicating clear transcriptomic differences between groups (C).


![Fig 2.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/Heatmap.png)
> Figure 2. Differential expression and sample clustering analysis of GSE18090 (Control vs Patient).
Volcano plot showing differentially expressed genes between Control and Patient samples. Red dots
represent significantly upregulated genes, blue dots represent significantly downregulated genes, and
black dots indicate non-significant genes (Padj &lt; 0.05). (A) MA plot displaying the relationship
between log₂ fold change and mean log₂ expression levels, highlighting significantly upregulated
(red) and downregulated (blue) genes (B). UMAP projection (n_neighbors = 11) illustrating sample
clustering based on global gene expression profiles. Control samples (green) and DF+DHF samples (purple)
form distinct clusters, indicating clear transcriptomic differences between groups (C).

The top 5 DEGs are listed in Table 1, and the complete DEG list is available in the GitHub repository.

## :small_red_triangle: Top Upregulated Genes

| Comparison | Gene Symbol | logFC | adj.P.Val |
|------------|-------------|-------|-----------|
| E11.5 vs E9.5 | Cryl1 | 6.7859 | 5.05e-14 |
| E11.5 vs E9.5 | E2f5 | 5.6753 | 1.28e-13 |
| E11.5 vs E9.5 | 8430408G22Rik | 5.5746 | 1.11e-13 |
| E11.5 vs E9.5 | Ttr | 5.4774 | 1.70e-14 |
| E11.5 vs E9.5 | Bcl11a | 5.3282 | 9.34e-17 |
| E13.5 vs E9.5 | Ttr | 8.5261 | 4.27e-19 |
| E13.5 vs E9.5 | Nfix | 6.6159 | 6.59e-19 |
| E13.5 vs E9.5 | Bcl11b | 6.5870 | 3.64e-19 |
| E13.5 vs E9.5 | Dcn | 6.3378 | 1.16e-18 |
| E13.5 vs E9.5 | Tnnc1 | 6.0934 | 4.89e-18 |
| E13.5 vs E11.5 | Tnnc1 | 6.0517 | 2.18e-16 |
| E13.5 vs E11.5 | Myl1 | 5.7646 | 5.57e-16 |
| E13.5 vs E11.5 | Actc1 | 5.6577 | 1.49e-18 |
| E13.5 vs E11.5 | Lect1 | 5.4424 | 9.68e-17 |
| E13.5 vs E11.5 | Dcn | 5.1055 | 1.05e-15 |

## :small_blue_diamond: Top Downregulated Genes

| Comparison | Gene Symbol | logFC | adj.P.Val |
|------------|-------------|-------|-----------|
| E11.5 vs E9.5 | Lin28a | -5.4364 | 1.17e-16 |
| E11.5 vs E9.5 | Car4 | -4.4346 | 1.00e-13 |
| E11.5 vs E9.5 | Prtg | -4.0786 | 4.64e-15 |
| E11.5 vs E9.5 | Lrp2 | -3.4446 | 4.84e-13 |
| E11.5 vs E9.5 | Irs4 | -3.3348 | 7.42e-12 |
| E13.5 vs E9.5 | Lin28a | -7.6751 | 2.90e-20 |
| E13.5 vs E9.5 | Prtg | -5.5422 | 5.21e-19 |
| E13.5 vs E9.5 | Car4 | -5.1345 | 1.38e-16 |
| E13.5 vs E9.5 | Sall4 | -5.0011 | 2.35e-17 |
| E13.5 vs E9.5 | Hbb-bh1 | -4.7464 | 2.40e-15 |
| E13.5 vs E11.5 | Cryl1 | -7.0318 | 9.48e-15 |
| E13.5 vs E11.5 | 8430408G22Rik | -5.5809 | 4.64e-14 |
| E13.5 vs E11.5 | E2f5 | -5.2108 | 1.94e-13 |
| E13.5 vs E11.5 | Hemgn | -5.1857 | 4.86e-12 |
| E13.5 vs E11.5 | Aph1a | -4.7634 | 9.68e-17 |

### Biological Interpretation
Gene Ontology (GO) enrichment analysis was performed to identify the
biological function categories represented by the identified DEGs. In addition,
Kyoto Encyclopedia of Genes and Genomes (KEGG) pathway analysis was
conducted to reveal gene–gene interactions and their involvement in molecular
pathways using the KEGG database. In this study, the Enrichr comprehensive
database was used for both analyses. 

- **A**
![Fig 3A.](https://github.com/amndavan/BRSPOmicsLite2026_Week3/blob/main/figures/KEGG_2026_bar_graph.svg)
- **B**
![Fig 3B.](https://github.com/amndavan/BRSPOmicsLite2026_Week3/blob/main/figures/GO_Biological_Process_2025_bar_graph.svg)
- **C**
![Fig 3C.](https://github.com/amndavan/BRSPOmicsLite2026_Week3/blob/main/figures/GO_Cellular_Component_2025_bar_graph.svg)
- **D**
![Fig 3D.](https://github.com/amndavan/BRSPOmicsLite2026_Week3/blob/main/figures/GO_Molecular_Function_2025_bar_graph.svg)
> Figure 3. Functional enrichment analysis of differentially expressed genes (DEGs) in GSE18090. Bar
plots show the top significantly enriched based on Gene Ontology (GO) and pathway analysis (A).
Enriched categories include Biological Process (BP) (B), Cellular Component (CC) (C), and Molecular
Function (MF) (D).

The findings demonstrated that the DEGs were primarily enriched in pathways involved in viral replication and endoplasmic 
reticulum (ER) protein processing, processes commonly utilized by viruses for protein folding and assembly and often 
associated with ER stress. KEGG pathway analysis further highlighted alterations in pathways related to hematopoietic cell 
lineages.

GO enrichment analysis further indicated that these DEGs were involved in:
| Biological Process | Cellular Component | Molecular Function |
|:-----------|:------:|------:|
| Response to Fibroblast Growth Factor | Specific Granule | Protein Kinase A Regulatory Subunit Binding |
| Cellular Response to Epinephrine Stimulus | Calcium Channel Complex | Phospholipid Transfer Activity |
| RNA Transport | Endoplasmic Reticulum Membrane | Ceramide 1-Phosphate Binding |

## F. Conclusion
In conclusion, the present analysis demonstrates that the DF condition is associated with significant 
transcriptional alterations, characterized by both upregulated and downregulated genes compared to the control group.

Functional enrichment analysis further revealed that these DEGs are significantly associated with pathways 
related to protein processing in the endoplasmic reticulum (ER), highlighting how viruses exploit ER machinery 
for protein folding and assembly, which may induce ER stress. These pathway enrichments are reflected in the 
observed transcriptional alterations.

## G. References

1. Lowe R, Shirley N, Bleackley M, Dolan S, Shafee T. (2017). *Transcriptomics technologies*. PLOS Computational Biology, 13(5), e1005457. https://doi.org/10.1371/journal.pcbi.1005457
2. Nascimento EJ, Braga-Neto U, Calzavara-Silva CE, Gomes AL, et al. (2009). *Gene expression profiling during early acute febrile stage of dengue infection can predict disease outcome*. PLoS One, 4(11), e7892. https://doi.org/10.1371/journal.pone.0007892
3. Raplee ID, Borkar SA, Yin L, et al. (2025). *The Role of Microarray in Modern Sequencing: Statistical Approach Matters in a Comparison Between Microarray and RNA-Seq*. BioTech, 14(3), 55. https://doi.org/10.3390/biotech14030055
4. Rosati D, Palmieri M, Brunelli G, et al. (2024). *Differential gene expression analysis pipelines and bioinformatic tools for biomarker identification: A review*. Computational and Structural Biotechnology Journal, 23. https://doi.org/10.1016/j.csbj.2024.02.018
5. Wang H, Xu Y, Zhang Z, et al. (2024). *Development and application of transcriptomics technologies in plant science*. Crop Design, 3(2), 100057. https://doi.org/10.1016/j.cropd.2024.100057

