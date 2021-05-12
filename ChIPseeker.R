library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
library(ggplot2)

peaklist <- "<PATH TO LIST OF PEAKS>"
peaklist <- as.list(peaklist)
peakAnnoList <- lapply(peaklist, annotatePeak, TxDb=txdb, verbose = FALSE)
peakAnnoList
write.csv(peakAnnoList, file = "XXXX.csv")
plotAnnoBar(peakAnnoList)

#Needed to plot a bar-chart. Thus extracted frequencies of each gene coverage and plotted separately
Frequency <- read.csv("FREQUENCY_OF_PEAKS_AT_GENE_FEATURES.csv")
Frequency <- data.frame(Frequency)
Frequency$Gene_Regions <- factor(Frequency$Gene_Regions, levels = Frequency$Gene_Regions)
My_Theme = theme(axis.title.x = element_text(size = 18),
                 axis.text.x = element_text(size = 16, angle = 90),
                 axis.title = element_text(size = 16))
Plot <- ggplot(data = Frequency, aes(x= Gene_Regions, y=Freq)) +
  geom_bar(stat = "identity", fill="steelblue" ) +
  theme_minimal() +
  My_Theme +
  ggtitle("XXX") +
  xlab("Gene_Regions") +
  ylab("Percentage of peaks")  

Plot
