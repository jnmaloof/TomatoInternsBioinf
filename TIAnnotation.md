Annotation and Gene Ontology analysis of differential expression
========================================================


```
## Loading required package: proto
```

```
## Loading required package: grid
```

```
## Loading required package: reshape
```

```
## Loading required package: plyr
```

```
## Attaching package: 'reshape'
```

```
## The following object(s) are masked from 'package:plyr':
## 
## rename, round_any
```

```
## Loading required package: limma
```


Having found genes that are differentially expressed we would like to know what these genes are, and if they share any common functions.

Use iget to download the files "TomatoGO.tsv", "TomatoGOSlim.tsv", "ITAG2.3_HRD.tsv", and "eval.go.R" from the ti-2013 directory to /mydata

Now load them into R

```r
HRD <- read.delim("/mydata/ITAG2.3_HRD.tsv")
GO <- read.delim("/mydata/TomatoGO.tsv")
GOSlim <- read.delim("/mydata/TomatoGOSlim.tsv")
source("/mydata/eval.go.R")
```


* The HRD file contains a "human readable description" of each gene. 
* The GO files contains a numeric key for the Gene Ontology terms associated with each gene (see http://www.geneontology.org/ for more info).  
* There are two versions of the GO files.  The GOSlim file contains a subset of more general GO terms.
* eval.go is a helper script that I wrote to automate the GO analysis

```r
head(HRD)
```

```
##                 ITAG
## 1 Solyc00g005000.2.1
## 2 Solyc00g005020.1.1
## 3 Solyc00g005040.2.1
## 4 Solyc00g005050.2.1
## 5 Solyc00g005060.1.1
## 6 Solyc00g005070.1.1
##                                                                                                       Description.HRD.
## 1 Aspartic proteinase nepenthesin I (AHRD V1 **-- A9ZMF9_NEPAL); contains Interpro domain(s)  IPR001461  Peptidase A1 
## 2                                                                                            Unknown Protein (AHRD V1)
## 3    Potassium channel (AHRD V1 ***- D0EM91_9ROSI); contains Interpro domain(s)  IPR000595  Cyclic nucleotide-binding 
## 4                                                                  Arabinogalactan protein (AHRD V1 ***- B6SST2_MAIZE)
## 5                                                                                            Unknown Protein (AHRD V1)
## 6                                                                                            Unknown Protein (AHRD V1)
```

```r
head(GO)
```

```
##                 ITAG
## 1 Solyc00g005000.2.1
## 2 Solyc00g005040.2.1
## 3 Solyc00g005050.2.1
## 4 Solyc00g005080.1.1
## 5 Solyc00g005130.1.1
## 6 Solyc00g005150.1.1
##                                                                                                                                                                                                                        GO
## 1                                                                                                                                                                                                         0006508,0004190
## 2 0005774,0009611,0006635,0003988,0010118,0009507,0005777,0005730,0030551,0042802,0009644,0009695,0005242,0010111,0055085,0006813,0009789,0009860,0007623,0005739,0006550,0006552,0006574,0006699,0018874,0042967,0008076
## 3                                                                                                                                                                                                 0005829,0005739,0005886
## 4                                                                                                                                                                                         0005524,0009570,0017111,0009575
## 5                                                                                                                                                                                                         0006508,0008234
## 6                                                                                                                                                                                                                 0003676
```

```r
head(GOSlim)
```

```
##                 ITAG
## 1 Solyc00g005000.2.1
## 2 Solyc00g005040.2.1
## 3 Solyc00g005050.2.1
## 4 Solyc00g005080.1.1
## 5 Solyc00g005130.1.1
## 6 Solyc00g005150.1.1
##                                                                                                                                                                                                                                                                             GO
## 1                                                                                                                                                                                                                                                    0019538, 0009056, 0016787
## 2 0016020, 0005773, 0009605, 0006950, 0009056, 0009987, 0006629, 0016740, 0009536, 0005777, 0005730, 0000166, 0005515, 0009628, 0009058, 0005215, 0016043, 0006810, 0009719, 0007165, 0009856, 0009653, 0030154, 0016049, 0007275, 0008150, 0005739, 0006519, 0008152, 0005886
## 3                                                                                                                                                                                                                                                    0005829, 0005739, 0005886
## 4                                                                                                                                                                                                                                                    0000166, 0009536, 0016787
## 5                                                                                                                                                                                                                                                    0019538, 0009056, 0016787
## 6                                                                                                                                                                                                                                                                      0003676
```


We can merge the descriptions with top tags results as follows:

```r
results.temp.lyc.hrd <- merge(topTags(lrt.temp.lyc)$table, HRD, by.x = "row.names", 
    by.y = "ITAG", all.x = T, all.y = F, sort = F)
head(results.temp.lyc.hrd)
```

```
##            Row.names logConc      logFC    LR    P.Value  adj.P.Val
## 1 Solyc05g007950.2.1  -9.357  6.620e+00 497.6 3.088e-110 5.753e-106
## 2 Solyc02g014860.2.1 -10.000  5.960e+00 346.5  2.414e-77  2.248e-73
## 3 Solyc02g082920.2.1  -7.974  5.728e+00 320.4  1.185e-71  7.356e-68
## 4 Solyc01g005300.2.1  -9.780  5.135e+00 311.2  1.175e-69  5.473e-66
## 5 Solyc10g009150.2.1  -9.653 -1.443e+08 308.9  3.708e-69  1.364e-65
## 6 Solyc06g006000.2.1 -10.546  1.023e+01 308.6  4.392e-69  1.364e-65
##                                                                                                                            Description.HRD.
## 1                                     Ribonuclease T2 (AHRD V1 ***- Q6A3R1_SOLLC); contains Interpro domain(s)  IPR001568  Ribonuclease T2 
## 2                      Chaperone protein DnaJ (AHRD V1 *-*- D2QAE1_BIFDB); contains Interpro domain(s)  IPR003095  Heat shock protein DnaJ 
## 3 Endochitinase (Chitinase) (AHRD V1 **** Q43184_SOLTU); contains Interpro domain(s)  IPR000726  Glycoside hydrolase, family 19, catalytic 
## 4 Flavin-binding kelch domain F box protein (AHRD V1 **-* D7KVS5_ARALY); contains Interpro domain(s)  IPR015915  Kelch-type beta propeller 
## 5                                                                                         Organ-specific protein S2 (AHRD V1 ***- OSS2_PEA)
## 6                                                                                                                 Unknown Protein (AHRD V1)
```

This shows us the descriptions of the genes most DE by temperature in lyc.

#### Exercise 1
What is the description of the gene most differentially expressed among species?



#### Exercise 2
Are the top 10 genes DE in response to cold similar or different in the 3 species?

Next we will analyze GO categories.  First we need to install a missing package:

```r
source("http://bioconductor.org/biocLite.R")
biocLite("geneLenDataBase")
# Answer 'y' to any questions and ignore the warning 'installed directory
# not writable...' This only needs to be done once on your machine
```


Next we need the length of each gene 

```r
library(Biostrings)
```

```
## Loading required package: IRanges
```

```
## Attaching package: 'IRanges'
```

```
## The following object(s) are masked from 'package:plyr':
## 
## compact, desc
```

```
## The following object(s) are masked from 'package:base':
## 
## cbind, eval, intersect, Map, mapply, order, paste, pmax, pmax.int, pmin,
## pmin.int, rbind, rep.int, setdiff, table, union
```

```r
itagSeqs <- read.DNAStringSet("/mydata/ITAG2.3_cdna_SHORTNAMES.fasta")  #read the fasta file with the genes
itagLength <- nchar(itagSeqs)  #length of each ITAG
names(itagLength) <- names(itagSeqs)  #add the names
head(itagLength)  #check it
```

```
## Solyc00g005000.2.1 Solyc00g005020.1.1 Solyc00g005040.2.1 
##               1693                486                392 
## Solyc00g005050.2.1 Solyc00g005060.1.1 Solyc00g005070.1.1 
##                983                273                 81
```


Finally we can look for over-representation of GO categories
Then calling eval.go:
 * the first argument is an object containing the results from a call to glmLRT
 * the second argument is an object with the gene lengths
 * the third argument is an object with the GO terms
 * the fourth argument is the differential expression cutoff that you want to use

```r
eval.go(lrt = lrt.species, ilength = itagLength, go.terms = GO, p.thresh = 0.01)
```

```
## Loading required package: goseq
```

```
## Loading required package: BiasedUrn
```

```
## Loading required package: geneLenDataBase
```

```
## Loading required package: GO.db
```

```
## Loading required package: AnnotationDbi
```

```
## Loading required package: Biobase
```

```
## Welcome to Bioconductor
## 
## Vignettes contain introductory material. To view, type
## 'browseVignettes()'. To cite Bioconductor, see 'citation("Biobase")' and
## for packages 'citation("pkgname")'.
```

```
## Attaching package: 'Biobase'
```

```
## The following object(s) are masked from 'package:Biostrings':
## 
## updateObject
```

```
## The following object(s) are masked from 'package:IRanges':
## 
## updateObject
```

```
## Loading required package: DBI
```

```
## ```

```
## Using manually entered categories.
```

```
## Calculating the p-values...
```

```
## $de
## [1] category                 over_represented_pvalue 
## [3] under_represented_pvalue description             
## [5] ontology                 over.pval.adjust        
## <0 rows> (or 0-length row.names)
```

```r
eval.go(lrt = lrt.species, ilength = itagLength, go.terms = GOSlim, p.thresh = 0.01)
```

```
## Using manually entered categories.
```

```
## Calculating the p-values...
```

```
## $de
## [1] category                 over_represented_pvalue 
## [3] under_represented_pvalue description             
## [5] ontology                 over.pval.adjust        
## <0 rows> (or 0-length row.names)
```


#### Exercise 3
What GO and GOSlim categories are signficantly over-represented in genes DE by temperature?






