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

This research primarily investigates transcriptomic and proteomic changes during development, with a particular focus on early mouse brain development. This topic is important because proper developmental progression requires precise regulation of gene expression, where specific genes must be accurately activated and deactivated to maintain the balance between cell proliferation and differentiation.

In the developing brain, differentiation from neural progenitor cells (NPCs) begins around embryonic day 11.5 (E11.5), following an earlier phase of NPC expansion. The production of glial cells starts later, around E17. Understanding the spatiotemporal changes in gene and protein expression during these stages is important for uncovering the mechanisms underlying brain development. Such knowledge is particularly relevant because defects in neurogenesis have been linked to neurodegenerative diseases, including Alzheimer's disease, Parkinson's disease, and Huntington's disease.

The study focuses on three key developmental stages: E9.5, E11.5, and E13.5. E9.5 was selected because neural progenitor cells are highly abundant at this stage. E11.5 represents the stage when NPCs begin to differentiate, while E13.5 corresponds to the peak of neurogenesis. The authors found that although the overall amount of protein remains relatively constant throughout development, the composition of gene products changes significantly. Here is a clearer and more formal paraphrase for a report:

Within this Capstone Project, I aim to re-examine the findings reported by the authors using the analytical approaches and pipelines introduced in the BRSP Omicslite course from Week 1 to Week 3. By applying these methods, the goal is to reassess the dataset and evaluate whether similar patterns and conclusions can be reproduced through the analytical framework provided in the course.

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
The boxplots (Figure 1A) showed very similar distributions across all samples, with comparable medians and interquartile ranges. This indicated that the expression data were well normalized and that there were no obvious batch effects or major technical variations between samples. The consistency of the distributions suggested that the dataset was suitable for downstream analyses such as differential expression analysis.

The UMAP projection (Figure 1B) revealed clear clustering of samples according to their developmental stages. Samples from E9.5 clustered together and were clearly separated from those at E11.5 and E13.5, indicating distinct gene expression profiles at this early stage. Similarly, E11.5 and E13.5 samples formed their own clusters, demonstrating progressive transcriptomic changes as brain development proceeded. The separation between clusters suggested that developmental stage was a major factor driving variation in gene expression within the dataset. Overall, the distinct grouping of samples confirms strong stage-specific transcriptional signatures during early mouse brain development.

- **A. Normalization boxplot**

![Fig 1A.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/Boxplot%20Normalization.png)
- **B. UMAP across developmental stages**
![Fig 1B.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/UMAP.png)
- **C. Venn plot showing DEG intersection**
![Fig 1C.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/bb0296a18884303b2a58bc22ee06395d2aa40a69/figures/VennPlot.png)
> Figure 1. Boxplot showing the distribution of log2-transformed gene expression values across all samples (GSMs). Each boxplot represents the expression distribution for one sample, where the median, interquartile range, and overall spread of the data are displayed. The red dashed line indicates the overall median expression level across samples (A). UMAP projection of samples based on their gene expression profiles, colored according to developmental stage (E9.5, E11.5, and E13.5) (B). The Venn diagram illustrates the number of genes uniquely expressed at three embryonic stages (E9.5, E11.5, and E13.5). The intersections represent genes shared between stages (C).

After applying the selection criteria and removing blank array results and duplicate entries, a total number of differentially expressed genes (DEGs) were identified across the developmental stages. A large number of genes showed significant differential expression between the stages. Many genes were strongly upregulated in E13.5, while another subset was significantly downregulated compared with E9.5. Similar patterns of differential expression were also observed in the comparisons between E9.5 vs E11.5 and E11.5 vs E13.5 (Figure 2A-C). The wide distribution of significant genes indicated substantial transcriptomic changes between these developmental stages, reflecting major biological transitions during the developmental process. However, the proportions of upregulated and downregulated genes between stages were relatively balanced, with slightly more upregulated genes observed in the E13.5 vs E9.5 comparison. This pattern is theoretically understandable, as E9.5 represents an early developmental stage, whereas E13.5 corresponds to a later stage approaching maturation. A similar trend in gene expression changes was also reported in the original study.

- **A. E9.5**
![Fig 2A.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/VOL%20Plot%20E11_5%20vs%20E9_5.png)
- **B. E11.5**
![Fig 2B.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/VOL%20Plot%20E13_5%20vs%20E11_5.png)
- **C. E13.5**
![Fig 2C.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/VOL%20Plot%20E13_5%20vs%20E9_5.png)
> Figure 2A-C. Volcano plot showing differentially expressed genes between developmental stages. The x-axis represented the log fold change (logFC), while the y-axis showed the statistical significance expressed as −log10(adjusted p-value). Genes that were significantly upregulated in were highlighted in red, whereas significantly downregulated genes were shown in blue. Genes that did not meet the significance thresholds were displayed in grey (Padj≤0.05).

The heatmap of the top 100 differentially expressed genes (DEGs) from the GSE8091 (Figure 3) reveals clear stage-specific gene expression patterns during mouse embryonic development. Hierarchical clustering separates the samples into groups corresponding to the developmental stages E9.5, E11.5, and E13.5, indicating that transcriptional profiles progressively change as development proceeds. Two major expression patterns can be observed:
- Genes highly expressed at early stages (E9.5) and repressed at later stages (E11.5–E13.5). A group of genes shows strong expression at E9.5, followed by a gradual reduction in expression at E11.5 and E13.5. This pattern suggests that these genes play roles in early embryonic growth, protein synthesis, and RNA processing, which are critical during the rapid cell division and metabolic activity characteristic of early development.
Several of these genes are known to be involved in ribosome biogenesis and RNA metabolism. For example, _Ncl (Nucleolin)_ and _Pes1_ are involved in ribosomal RNA processing, while _Ddx18_ functions as an RNA helicase associated with ribosome assembly. Genes such as Eprs and Mars encode aminoacyl-tRNA synthetases that participate in protein translation, indicating active protein synthesis during early developmental stages.
Additionally, regulatory genes such as _Lin28a_ and _Trim71_ are well known for their roles in stem cell maintenance and early embryonic development, suggesting that the early stage embryos maintain a transcriptional program associated with cell proliferation and developmental plasticity.
- Genes upregulated at later developmental stages (E11.5–E13.5). Another cluster of genes shows the opposite pattern, where expression levels are relatively low at E9.5 but increase at E11.5 and become strongly upregulated at E13.5. This expression pattern suggests that these genes are activated during later stages of embryonic development, when tissues begin to differentiate and specialized cellular functions start to emerge. Several of these genes are known to play roles in neuronal differentiation, neural connectivity, and brain development. _Gad1_ encodes glutamate decarboxylase, an enzyme responsible for GABA synthesis, which is important in inhibitory neuronal signaling. _Ncam1_ encodes a neural cell adhesion molecule involved in neuronal migration and synaptic plasticity. _Foxp2_ is a transcription factor associated with neural circuit formation and brain development. Sema3f is part of the semaphorin family involved in axon guidance during neural development. _Kirrel3_ is linked to synapse formation and neural connectivity.

However, while the expression patterns indicate potential involvement in neural development, conclusions cannot be drawn solely from visual inspection of the heatmap. To determine whether these genes are significantly associated with neurogenesis-related biological processes, further analysis such as Gene Ontology (GO) enrichment or pathway enrichment analysis is required. Such enrichment analysis would identify whether biological processes such as neuron differentiation, axon guidance, or synapse organization are statistically overrepresented among the upregulated and downregulated genes.

![Fig 3.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/9fc78ac27789847c5abed6fa53a2c10afe75fb4b/figures/Heatmap.png)
> Figure 3. Heatmap of the top 100 differentially expressed genes (DEGs) across mouse embryo developmental stages from the GSE8091 dataset.
The heatmap shows hierarchical clustering of the top 100 DEGs identified from the GSE8091. Expression values were normalized and scaled (Z-score) across samples. Color intensity indicates relative gene expression levels, with red representing higher expression and blue representing lower expression relative to the gene’s mean expression level. The dendrograms on the top and left indicate hierarchical clustering of samples and genes based on expression similarity. The annotation bar above the heatmap indicates embryo developmental stages (E), where different colors represent distinct stages of mouse embryonic development.

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
pathways using the KEGG database. In this study, the g:Profiler was used for GO enrichment.

- **A. GO Enrichment E9.5 vs E11.5**
![Fig 4A1.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/cb3b8500f87cc5989d1eb387b2dc5e04eea86b71/figures/gProfiler_E11_5_vs_E9_5_UP.png)
![Fig 4A2.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/cb3b8500f87cc5989d1eb387b2dc5e04eea86b71/figures/gProfiler_E11_5_vs_E9_5_DOWN.png)
- **B. GO Enrichment E11.5 vs E13.5**
![Fig 4B1.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/cb3b8500f87cc5989d1eb387b2dc5e04eea86b71/figures/gProfiler_E13_5_vs_E11_5_DOWN.png)
![Fig 4B2.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/cb3b8500f87cc5989d1eb387b2dc5e04eea86b71/figures/gProfiler_E13_5_vs_E11_5_DOWN.png)
- **C. GO Enrichment E9.5 vs E13.5**
![Fig 4C1.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/cb3b8500f87cc5989d1eb387b2dc5e04eea86b71/figures/gProfiler_E13_5_vs_E9_5_UP.png)
![Fig 4C2.](https://github.com/amndavan/BRSPOmicsLite2026_FinalWeek/blob/cb3b8500f87cc5989d1eb387b2dc5e04eea86b71/figures/gProfiler_E13_5_vs_E9_5_DOWN.png)
> Figure 4. Functional enrichment analysis of differentially expressed genes (DEGs) in GSE8091. Bar
plots show the top significantly enriched based on Gene Ontology (GO) for Biological Process (BP), Cellular Component (CC), and Molecular Function (MF) accross developmental stages.

## F. Conclusion
In conclusion, the present analysis demonstrates that there was indeed changes related to developmental stages.
Functional enrichment analysis further revealed that these DEGs are significantly associated with.

## G. References

1. Hartl, Daniela, et al. (2008). *Transcriptome and Proteome Analysis of Early Embryonic Mouse Brain Development.* PROTEOMICS, 8(6) pp. 1257–1265. https://doi.org/10.1002/pmic.200700724.
2. Lowe R, Shirley N, Bleackley M, Dolan S, Shafee T. (2017). *Transcriptomics technologies*. PLOS Computational Biology, 13(5), e1005457. https://doi.org/10.1371/journal.pcbi.1005457
3. Raplee ID, Borkar SA, Yin L, et al. (2025). *The Role of Microarray in Modern Sequencing: Statistical Approach Matters in a Comparison Between Microarray and RNA-Seq*. BioTech, 14(3), 55. https://doi.org/10.3390/biotech14030055
4. Rosati D, Palmieri M, Brunelli G, et al. (2024). *Differential gene expression analysis pipelines and bioinformatic tools for biomarker identification: A review*. Computational and Structural Biotechnology Journal, 23. https://doi.org/10.1016/j.csbj.2024.02.018
5. Wang H, Xu Y, Zhang Z, et al. (2024). *Development and application of transcriptomics technologies in plant science*. Crop Design, 3(2), 100057. https://doi.org/10.1016/j.cropd.2024.100057







