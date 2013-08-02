Differential Gene Expression Analysis in R
========================================================

Yesterday we finished by running SamBam2counts.R to determine the number of counts per gene.  Login to Rstudio Server (point the browser on your laptop to 128.196.142.XXX:8787, *replacing* XXX with the correct digits for your atmosphere instance).

### Getting started
It is best to keep a script of your commands in R.  This serves as a record of what you have done and makes it easier to correct mistakes.  To start a new script, click "File>New>Rscript" in the Rstudio window.  As you work through today's exercise, type the commands into your new R script.  You can execute each line, or a selection of lines, by typing Ctrl-enter or Cmd-enter.  You can save your script by choosing "File>Save" from the Rstudio menu, or clicking on the disk drive icon.

### Summarizing counts
The results of this analysis should be present in an object called results.  We can examine the beginning of the file by using `head()` and get a summary with `summary()`





```r
head(results)
```

```
##                 gene ARC.25.2.bam ARC.25.3.bam ARC.25.4.bam ARC.8.1.bam
## 1                  *      1366632       816844       833760      880500
## 2 Solyc00g005000.2.1          292          148          128         153
## 3 Solyc00g005040.2.1            1           NA            2          NA
## 4 Solyc00g005050.2.1          389          222          213         146
## 5 Solyc00g005150.1.1            1            1            1          NA
## 6 Solyc00g005840.2.1          605          364          402         359
##   ARC.8.2.bam ARC.8.3.bam HAB.25.1.bam HAB.25.2.bam HAB.25.3.bam
## 1     1020182      743018       997714      1058562      1102055
## 2         104         143          207          227          180
## 3          NA          NA           NA            1           NA
## 4         146         155          270          292          214
## 5          NA          NA            1            1           NA
## 6         515         345          344          353          315
##   HAB.25.4.bam HAB.8.2.bam HAB.8.3.bam HAB.8.4.bam q20p90.LYC.25.1.bam
## 1      1253702     1011944     1080594     1048469              849033
## 2          192          52          40          85                 305
## 3           NA           1          NA          NA                  NA
## 4          232          78         182         160                 196
## 5           NA          NA          NA          NA                  NA
## 6          495         231         177         226                 234
##   q20p90.LYC.25.2.bam q20p90.LYC.25.3.bam q20p90.LYC.25.4.bam
## 1              880700              796964             1039570
## 2                 232                 297                 414
## 3                   2                   1                   4
## 4                 201                 175                 216
## 5                  NA                  NA                  NA
## 6                 284                 250                 251
##   q20p90.LYC.8.1.bam q20p90.LYC.8.3.bam
## 1             701508             742032
## 2                 20                 10
## 3                 NA                 NA
## 4                110                116
## 5                 NA                 NA
## 6                186                222
```

```r
summary(results)
```

```
##                  gene        ARC.25.2.bam      ARC.25.3.bam   
##  *                 :    1   Min.   :      1   Min.   :     1  
##  Solyc00g005000.2.1:    1   1st Qu.:     16   1st Qu.:    11  
##  Solyc00g005040.2.1:    1   Median :     75   Median :    45  
##  Solyc00g005050.2.1:    1   Mean   :    275   Mean   :   162  
##  Solyc00g005120.1.1:    1   3rd Qu.:    213   3rd Qu.:   123  
##  Solyc00g005140.1.1:    1   Max.   :1366632   Max.   :816844  
##  (Other)           :28555   NA's   :4609      NA's   :5773    
##   ARC.25.4.bam     ARC.8.1.bam      ARC.8.2.bam       ARC.8.3.bam    
##  Min.   :     1   Min.   :     1   Min.   :      1   Min.   :     1  
##  1st Qu.:    10   1st Qu.:    10   1st Qu.:     11   1st Qu.:    10  
##  Median :    44   Median :    44   Median :     53   Median :    44  
##  Mean   :   164   Mean   :   168   Mean   :    210   Mean   :   149  
##  3rd Qu.:   121   3rd Qu.:   128   3rd Qu.:    155   3rd Qu.:   126  
##  Max.   :833760   Max.   :880500   Max.   :1020182   Max.   :743018  
##  NA's   :5782     NA's   :5978     NA's   :5588      NA's   :5872    
##   HAB.25.1.bam     HAB.25.2.bam      HAB.25.3.bam      HAB.25.4.bam    
##  Min.   :     1   Min.   :      1   Min.   :      1   Min.   :      1  
##  1st Qu.:    12   1st Qu.:     12   1st Qu.:     12   1st Qu.:     14  
##  Median :    55   Median :     53   Median :     59   Median :     63  
##  Mean   :   212   Mean   :    199   Mean   :    229   Mean   :    227  
##  3rd Qu.:   163   3rd Qu.:    155   3rd Qu.:    179   3rd Qu.:    180  
##  Max.   :997714   Max.   :1058562   Max.   :1102055   Max.   :1253702  
##  NA's   :5520     NA's   :5772      NA's   :5279      NA's   :5213     
##   HAB.8.2.bam       HAB.8.3.bam       HAB.8.4.bam      q20p90.LYC.25.1.bam
##  Min.   :      1   Min.   :      1   Min.   :      1   Min.   :     1     
##  1st Qu.:      9   1st Qu.:     10   1st Qu.:     10   1st Qu.:    14     
##  Median :     44   Median :     47   Median :     49   Median :    67     
##  Mean   :    172   Mean   :    190   Mean   :    189   Mean   :   225     
##  3rd Qu.:    132   3rd Qu.:    146   3rd Qu.:    148   3rd Qu.:   193     
##  Max.   :1011944   Max.   :1080594   Max.   :1048469   Max.   :849033     
##  NA's   :5809      NA's   :5809      NA's   :5750      NA's   :4755       
##  q20p90.LYC.25.2.bam q20p90.LYC.25.3.bam q20p90.LYC.25.4.bam
##  Min.   :     1      Min.   :     1      Min.   :      1    
##  1st Qu.:    14      1st Qu.:    13      1st Qu.:     14    
##  Median :    65      Median :    56      Median :     67    
##  Mean   :   218      Mean   :   190      Mean   :    232    
##  3rd Qu.:   184      3rd Qu.:   160      3rd Qu.:    192    
##  Max.   :880700      Max.   :796964      Max.   :1039570    
##  NA's   :4855        NA's   :5071        NA's   :4672       
##  q20p90.LYC.8.1.bam q20p90.LYC.8.3.bam
##  Min.   :     1     Min.   :     1    
##  1st Qu.:     9     1st Qu.:     9    
##  Median :    46     Median :    45    
##  Mean   :   162     Mean   :   166    
##  3rd Qu.:   140     3rd Qu.:   137    
##  Max.   :701508     Max.   :742032    
##  NA's   :5833       NA's   :5903
```


*if the above commands worked you can skip this section*
If your session ended, crashed, or otherwise isn't working, the file might have been saved in /mydata .  If you need to restart Rstudioserver, remember to move to the /mydata directory at set it as the working directory (see yesterday's instructions).  See if you have a file SamBam2countsResults.tsv in your /mydata directory.  If not you can download a copy from the ti-2013 directory on irods.


```r
# ONLY EXECUTE IF THE HEAD() AND SUMMARY() COMMANDS ABOVE DID NOT WORK
# load results from disk
results <- read.delim("SamBam2countsResults.tsv", sep = "\t")
```


#### Exercise 1:
What do the rows and columns represent?  What do you think the first row represents?

### Cleaning up column names
We need to make the column names conform to R standards and remove some extraneous characters:

```r
# note that anything after a '#' sign is a comment and does not need to be
# typed.
colnames(results) <- make.names(colnames(results))  #removes illegal characters
colnames(results) <- sub("q20p90.", "", colnames(results), fixed = T)
colnames(results) <- sub(".bam", "", colnames(results), fixed = T)
```


### Fixing "NAs"
If no counts were found, SamBam2counts.R inserted a value of "NA".  Really these are genes with 0 counts, and we need to replace NA with 0

```r
results[is.na(results)] <- 0
```


### Plotting a histogram

To get a visual summary of the results we can plot a histogram.  We will start by doing this for the first column:


```r
results.gene <- results[-1, ]
hist(results.gene$LYC.25.1)
```

![plot of chunk basic_histogram](figure/basic_histogram.png) 


#### Exercise 2:
What did this command do: `results.gene <- results[-1,]` ?

#### Exercise 3:
Does this histogram seem useful?

The problem with the histogram is that too many samples have low counts so it is hard to see most of the data.  We can rectify that by changing the y-axis.  We will turn to ggplot for this analysis


```r
library(ggplot2)  #load additional functionality
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
## Loading required package: grid
```

```
## Loading required package: proto
```

```r
pl <- ggplot(data = results.gene, aes(x = LYC.25.1))
pl <- pl + geom_histogram(binwidth = 100)
pl <- pl + scale_y_sqrt() + ylab("number of genes") + xlab("read count")
pl
```

![plot of chunk ggplot_histogram](figure/ggplot_histogram.png) 


If we want to just look at the lower left portion:

```r
pl + xlim(c(0, 5000))  #genes with between 0 and 5000 counts
```

![plot of chunk ggplot_histogram_v2](figure/ggplot_histogram_v21.png) 

```r
pl + xlim(c(0, 1000))  #genes with between 0 and 1000 counts
```

![plot of chunk ggplot_histogram_v2](figure/ggplot_histogram_v22.png) 


#### Exercise 4:
Interpret the histogram.  What does each axis represent.  Can you describe the distribution of gene expression in a sentence or two?

We can also use ggplot to make a histogram of each sample.  In order to do this we must rearrange the data in the data frame so that each row corresponds to a single observation

```r
library(reshape)
results.gene.melt <- melt(results.gene, id.var = "gene")  #id.var tells R which column has identifing information
# lets look at what we have done and compare it to the original
head(results.gene.melt)
```

```
##                 gene variable value
## 1 Solyc00g005000.2.1 ARC.25.2   292
## 2 Solyc00g005040.2.1 ARC.25.2     1
## 3 Solyc00g005050.2.1 ARC.25.2   389
## 4 Solyc00g005150.1.1 ARC.25.2     1
## 5 Solyc00g005840.2.1 ARC.25.2   605
## 6 Solyc00g005980.1.1 ARC.25.2     1
```

```r
tail(results.gene.melt)
```

```
##                      gene variable value
## 542635 Solyc11g073210.1.1  LYC.8.3     1
## 542636 Solyc12g017290.1.1  LYC.8.3     1
## 542637 Solyc12g017500.1.1  LYC.8.3     1
## 542638 Solyc12g021160.1.1  LYC.8.3     1
## 542639 Solyc12g055690.1.1  LYC.8.3     1
## 542640 Solyc12g062310.1.1  LYC.8.3     1
```

```r
head(results.gene)
```

```
##                 gene ARC.25.2 ARC.25.3 ARC.25.4 ARC.8.1 ARC.8.2 ARC.8.3
## 2 Solyc00g005000.2.1      292      148      128     153     104     143
## 3 Solyc00g005040.2.1        1        0        2       0       0       0
## 4 Solyc00g005050.2.1      389      222      213     146     146     155
## 5 Solyc00g005150.1.1        1        1        1       0       0       0
## 6 Solyc00g005840.2.1      605      364      402     359     515     345
## 7 Solyc00g005980.1.1        1        0        0       0       0       0
##   HAB.25.1 HAB.25.2 HAB.25.3 HAB.25.4 HAB.8.2 HAB.8.3 HAB.8.4 LYC.25.1
## 2      207      227      180      192      52      40      85      305
## 3        0        1        0        0       1       0       0        0
## 4      270      292      214      232      78     182     160      196
## 5        1        1        0        0       0       0       0        0
## 6      344      353      315      495     231     177     226      234
## 7        0        0        0        0       0       0       0        0
##   LYC.25.2 LYC.25.3 LYC.25.4 LYC.8.1 LYC.8.3
## 2      232      297      414      20      10
## 3        2        1        4       0       0
## 4      201      175      216     110     116
## 5        0        0        0       0       0
## 6      284      250      251     186     222
## 7        0        0        0       0       0
```

```r
tail(results.gene)
```

```
##                     gene ARC.25.2 ARC.25.3 ARC.25.4 ARC.8.1 ARC.8.2
## 28556 Solyc11g073210.1.1        0        0        0       0       0
## 28557 Solyc12g017290.1.1        0        0        0       0       0
## 28558 Solyc12g017500.1.1        0        0        0       0       0
## 28559 Solyc12g021160.1.1        0        0        0       0       0
## 28560 Solyc12g055690.1.1        0        0        0       0       0
## 28561 Solyc12g062310.1.1        0        0        0       0       0
##       ARC.8.3 HAB.25.1 HAB.25.2 HAB.25.3 HAB.25.4 HAB.8.2 HAB.8.3 HAB.8.4
## 28556       0        0        0        0        0       0       0       0
## 28557       0        0        0        0        0       0       0       0
## 28558       0        0        0        0        0       0       0       0
## 28559       0        0        0        0        0       0       0       0
## 28560       0        0        0        0        0       0       0       0
## 28561       0        0        0        0        0       0       0       0
##       LYC.25.1 LYC.25.2 LYC.25.3 LYC.25.4 LYC.8.1 LYC.8.3
## 28556        0        0        0        0       0       1
## 28557        0        0        0        0       0       1
## 28558        0        0        0        0       0       1
## 28559        0        0        0        0       0       1
## 28560        0        0        0        0       0       1
## 28561        0        0        0        0       0       1
```


#### Exercise 5:
What are "value" and "variable" in the results.gene.melt data frame?

now we can plot multiple histograms easily

```r
pl <- ggplot(data = results.gene.melt, aes(x = value, fill = variable))
pl <- pl + geom_histogram(binwidth = 100)
pl <- pl + facet_wrap(~variable, ncol = 5)
pl <- pl + scale_y_sqrt() + ylab("number of genes") + xlab("read count")
pl
```

![plot of chunk ggplot_faceted_histogram](figure/ggplot_faceted_histogram.png) 

You may want to press on the "zoom" button to see the plot more clearly

### Import reads into edgeR
Remember that the ultimate goal is to find genes that are differentially expressed in different temperatures and/or in different species.  To do this we will us an R package called edgeR.  If you want to learn more about edgeR at some other time, see the users guide at 
http://www.bioconductor.org/packages/release/bioc/vignettes/edgeR/inst/doc/edgeRUsersGuide.pdf 

We need to define some variables to describe the experiment and what is in each column of data.  This can be retrieved from the column names

```r
# first make the rownames reflect the gene
rownames(results.gene) <- as.character(results.gene$gene)
results.gene <- results.gene[, -1]  #remove the first column (gene names) now that we have added that information to the rownames
head(results.gene)
```

```
##                    ARC.25.2 ARC.25.3 ARC.25.4 ARC.8.1 ARC.8.2 ARC.8.3
## Solyc00g005000.2.1      292      148      128     153     104     143
## Solyc00g005040.2.1        1        0        2       0       0       0
## Solyc00g005050.2.1      389      222      213     146     146     155
## Solyc00g005150.1.1        1        1        1       0       0       0
## Solyc00g005840.2.1      605      364      402     359     515     345
## Solyc00g005980.1.1        1        0        0       0       0       0
##                    HAB.25.1 HAB.25.2 HAB.25.3 HAB.25.4 HAB.8.2 HAB.8.3
## Solyc00g005000.2.1      207      227      180      192      52      40
## Solyc00g005040.2.1        0        1        0        0       1       0
## Solyc00g005050.2.1      270      292      214      232      78     182
## Solyc00g005150.1.1        1        1        0        0       0       0
## Solyc00g005840.2.1      344      353      315      495     231     177
## Solyc00g005980.1.1        0        0        0        0       0       0
##                    HAB.8.4 LYC.25.1 LYC.25.2 LYC.25.3 LYC.25.4 LYC.8.1
## Solyc00g005000.2.1      85      305      232      297      414      20
## Solyc00g005040.2.1       0        0        2        1        4       0
## Solyc00g005050.2.1     160      196      201      175      216     110
## Solyc00g005150.1.1       0        0        0        0        0       0
## Solyc00g005840.2.1     226      234      284      250      251     186
## Solyc00g005980.1.1       0        0        0        0        0       0
##                    LYC.8.3
## Solyc00g005000.2.1      10
## Solyc00g005040.2.1       0
## Solyc00g005050.2.1     116
## Solyc00g005150.1.1       0
## Solyc00g005840.2.1     222
## Solyc00g005980.1.1       0
```

```r
species <- factor(substr(colnames(results.gene), 1, 3))
species
```

```
##  [1] ARC ARC ARC ARC ARC ARC HAB HAB HAB HAB HAB HAB HAB LYC LYC LYC LYC
## [18] LYC LYC
## Levels: ARC HAB LYC
```

```r
species <- relevel(species, ref = "LYC")  #set lycospersicum as the reference species
temp <- substr(colnames(results.gene), 5, 6)
temp
```

```
##  [1] "25" "25" "25" "8." "8." "8." "25" "25" "25" "25" "8." "8." "8." "25"
## [15] "25" "25" "25" "8." "8."
```

```r
temp <- factor(sub(".", "", temp, fixed = T))  #get rid of the extra period
temp
```

```
##  [1] 25 25 25 8  8  8  25 25 25 25 8  8  8  25 25 25 25 8  8 
## Levels: 25 8
```

```r
species.temp <- factor(paste(species, temp, sep = "."))
species.temp  #one level for each combination of species and temperature
```

```
##  [1] ARC.25 ARC.25 ARC.25 ARC.8  ARC.8  ARC.8  HAB.25 HAB.25 HAB.25 HAB.25
## [11] HAB.8  HAB.8  HAB.8  LYC.25 LYC.25 LYC.25 LYC.25 LYC.8  LYC.8 
## Levels: ARC.25 ARC.8 HAB.25 HAB.8 LYC.25 LYC.8
```


Now import into edgeR and normalize

```r
library(edgeR)
```

```
## Loading required package: limma
```

```r
dge <- DGEList(counts = results.gene, group = species.temp)
```

```
## Calculating library sizes from column totals.
```

```r
dim(dge)
```

```
## [1] 28560    19
```

```r
dge <- dge[rowSums(cpm(dge) > 5) >= 3, ]  #only keep genes where at least 3 samples have more than 5 counts per million
dim(dge)  #how many genes were lost?
```

```
## [1] 18629    19
```

```r
dge <- calcNormFactors(dge)  #normalize
```


We can use a technique known as multi-dimensional scaling to plot differences between the samples.  The further away samples are from each other in the plot below, the more different their gene expression is.

```r
plotMDS(dge)  #takes ~ 1 minute
```

#### Exercise 6
Are the samples distributed in a way that makes sense?  Do you see any samples that appear to be mis-labeled?

Our next goal is to estimate the degree of dispersion in our samples.  This allows better detection of differentially expressed genes.

```r
design <- model.matrix(~species + temp + species:temp)  #describes our experiment.  
# A main effect term for species and for temp, and an interaction term.
design  #shows which samples belong to each group
```

```
##    (Intercept) speciesARC speciesHAB temp8 speciesARC:temp8
## 1            1          1          0     0                0
## 2            1          1          0     0                0
## 3            1          1          0     0                0
## 4            1          1          0     1                1
## 5            1          1          0     1                1
## 6            1          1          0     1                1
## 7            1          0          1     0                0
## 8            1          0          1     0                0
## 9            1          0          1     0                0
## 10           1          0          1     0                0
## 11           1          0          1     1                0
## 12           1          0          1     1                0
## 13           1          0          1     1                0
## 14           1          0          0     0                0
## 15           1          0          0     0                0
## 16           1          0          0     0                0
## 17           1          0          0     0                0
## 18           1          0          0     1                0
## 19           1          0          0     1                0
##    speciesHAB:temp8
## 1                 0
## 2                 0
## 3                 0
## 4                 0
## 5                 0
## 6                 0
## 7                 0
## 8                 0
## 9                 0
## 10                0
## 11                1
## 12                1
## 13                1
## 14                0
## 15                0
## 16                0
## 17                0
## 18                0
## 19                0
## attr(,"assign")
## [1] 0 1 1 2 3 3
## attr(,"contrasts")
## attr(,"contrasts")$species
## [1] "contr.treatment"
## 
## attr(,"contrasts")$temp
## [1] "contr.treatment"
```

```r
dge <- estimateGLMCommonDisp(dge, design)
dge <- estimateGLMTrendedDisp(dge, design)  #20 seconds
```

```
## Loading required package: splines
```

```r

# normally we would run the line below, bit it gives errors on this data
# set, so skip it for now. system.time(DGE <-
# estimateGLMTagwiseDisp(DGE,design))
```



To find differentially expressed genes we fit a statistical model to each gene's expression and then compare it to a simpler model with fewer terms.  
Fit the full model:

```r
fit <- glmFit(dge, design)  # The full model
```


lets now look for genes that are differentially expressed among species.  To do this we "drop" all coefficients (or columns) from the design that are related to species.

```r
colnames(design)
```

```
## [1] "(Intercept)"      "speciesARC"       "speciesHAB"      
## [4] "temp8"            "speciesARC:temp8" "speciesHAB:temp8"
```

So we want to drop columns 2, 3, 5, and 6

```r
lrt.species <- glmLRT(dge, fit, coef = c(2, 3, 5, 6))  #compares the model to one without the species terms
```

lets examine the results

```r
topTags(lrt.species)  # shows us the 10 most differentially expressed genes among species
```

```
## Coefficient:  speciesARC speciesHAB speciesARC:temp8 speciesHAB:temp8 
##                    logConc speciesARC speciesHAB speciesARC.temp8
## Solyc06g035940.2.1 -10.059 -1.024e+01 -9.768e+00        6.121e-01
## Solyc05g045670.2.1 -10.144  1.128e+01 -1.443e+08        1.443e+08
## Solyc03g115910.1.1  -9.596 -5.703e-01  7.486e+00        1.193e+00
## Solyc06g009960.1.1  -8.495 -1.155e+00  7.219e+00       -4.422e-01
## Solyc09g007010.1.1  -9.244  1.443e+08  1.443e+08        2.062e+00
## Solyc07g008570.2.1  -9.689  4.335e+00  8.172e+00       -9.507e-01
## Solyc09g082700.2.1  -9.508  2.408e+00  7.365e+00        4.022e+00
## Solyc02g082920.2.1  -7.974 -7.529e+00  3.812e+00       -1.443e+08
## Solyc02g087110.2.1  -8.692  9.823e-01  8.176e+00        3.663e+00
## Solyc03g042560.1.1 -10.085  3.833e-01  6.769e+00       -2.729e+00
##                    speciesHAB.temp8     LR    P.Value        FDR
## Solyc06g035940.2.1       -1.443e+08 1467.7 1.437e-316 2.678e-312
## Solyc05g045670.2.1        2.885e+08 1401.9 2.688e-302 2.504e-298
## Solyc03g115910.1.1       -7.517e-02 1348.1 1.236e-290 7.675e-287
## Solyc06g009960.1.1       -1.828e+00 1258.1 4.111e-271 1.915e-267
## Solyc09g007010.1.1       -5.487e+00 1188.3 5.362e-256 1.998e-252
## Solyc07g008570.2.1       -2.867e-01 1067.4 8.729e-230 2.710e-226
## Solyc09g082700.2.1        2.338e+00 1046.7 2.706e-225 7.202e-222
## Solyc02g082920.2.1       -3.398e+00 1029.0 1.888e-221 4.398e-218
## Solyc02g087110.2.1       -3.015e+00  960.5 1.288e-206 2.665e-203
## Solyc03g042560.1.1       -2.621e+00  910.0 1.158e-195 2.158e-192
```

```r
sum(topTags(lrt.species, n = Inf)$table$adj.P.Val < 0.01)  #shows the total number of genes differentially expressed among species at P < 0.01
```

```
## [1] 9273
```

What do the columns in the topTags table mean?  
* logConc: This is for the "reference" condition of LYC.25.  It gives the log2 "concentration" of reads, calculated as log2(read counts in this gene / total read counts)
* speciesARC: the difference between the reference condition (LYC.25) and ARC.25 in log2 units.  so -1 means that the gene is 2-fold less expressed in ARC than LYC
* speciesHAB: as above, but for HAB
* speciesARC.temp8: the difference between ARC.temp8-ARC.temp25 and LYC.temp8-LYC.temp25.  How much more (or less) did ARC respond to 8 than LYC did?
* speciesHAB.temp8: as above, but for HAB
* LR: likelihood ratio.  How much more likely is the full model than the reduced model
* P.Value: an uncorrected P.value.  Don't use this.
* FDR: P.value corrected for multiple testing.  Use this one.

#### Exercise 7
Find the top genes differentially expressed by changing temperature.  How many genes have significant changes in expression between 8 and 25? (hint: you do not need to rerun everything...start with the glmLRT() call, changing the coefficients and placing the results in a new object, like lrt.temp)



#### Exercise 8
Find the top genes differentially expressed in ARC relative to LYC in response to temperature.  Do a separate analysis to find genes with differential temperature response in HAB relative to LYC.  How many genes are there in each analysis?



# Start here on Friday

### Finding all genes differentially induced or repressed by temperature for each species.
The above analyses revealed all genes DE by temperature, or all genes whose response to temperature is different in ARC or HAB compared to LYC.  What if instead, for each species, we wanted to know which genes were responsive to temperature?

To do this we need to set up our design matrix a bit differently.

```r
design2 <- model.matrix(~0 + species.temp)
colnames(design2) <- levels(species.temp)
fit2 <- glmFit(dge, design2)  #fit a new full model, corresponding to this deisgn
design2  #look at the new design
```

```
##    ARC.25 ARC.8 HAB.25 HAB.8 LYC.25 LYC.8
## 1       1     0      0     0      0     0
## 2       1     0      0     0      0     0
## 3       1     0      0     0      0     0
## 4       0     1      0     0      0     0
## 5       0     1      0     0      0     0
## 6       0     1      0     0      0     0
## 7       0     0      1     0      0     0
## 8       0     0      1     0      0     0
## 9       0     0      1     0      0     0
## 10      0     0      1     0      0     0
## 11      0     0      0     1      0     0
## 12      0     0      0     1      0     0
## 13      0     0      0     1      0     0
## 14      0     0      0     0      1     0
## 15      0     0      0     0      1     0
## 16      0     0      0     0      1     0
## 17      0     0      0     0      1     0
## 18      0     0      0     0      0     1
## 19      0     0      0     0      0     1
## attr(,"assign")
## [1] 1 1 1 1 1 1
## attr(,"contrasts")
## attr(,"contrasts")$species.temp
## [1] "contr.treatment"
```

Now we have a column corresponding to each species/temp combination

To look for genes DE by temp in lyc, we just contrast those columns:

```r
lrt.temp.lyc <- glmLRT(dge, fit2, contrast = c(0, 0, 0, 0, -1, 1))
topTags(lrt.temp.lyc)
```

```
## Coefficient:  -1*LYC.25 1*LYC.8 
##                    logConc      logFC    LR    P.Value        FDR
## Solyc05g007950.2.1  -9.357  6.620e+00 497.6 3.088e-110 5.753e-106
## Solyc02g014860.2.1 -10.000  5.960e+00 346.5  2.414e-77  2.248e-73
## Solyc02g082920.2.1  -7.974  5.728e+00 320.4  1.185e-71  7.356e-68
## Solyc01g005300.2.1  -9.780  5.135e+00 311.2  1.175e-69  5.473e-66
## Solyc10g009150.2.1  -9.653 -1.443e+08 308.9  3.708e-69  1.364e-65
## Solyc06g006000.2.1 -10.546  1.023e+01 308.6  4.392e-69  1.364e-65
## Solyc08g077110.2.1  -9.979  4.682e+00 268.2  2.807e-60  7.470e-57
## Solyc02g076910.2.1  -8.239 -7.870e+00 244.7  3.710e-55  8.640e-52
## Solyc07g064720.2.1 -10.062  4.337e+00 228.2  1.497e-51  3.099e-48
## Solyc01g079470.2.1  -9.121  4.220e+00 214.0  1.887e-48  3.515e-45
```

```r
# we can get a summary of the number of genes up and down regulated at 8
# degrees with:
summary(decideTestsDGE(lrt.temp.lyc))
```

```
##    [,1] 
## -1  3376
## 0  12164
## 1   3089
```


#### Exercise 9
how many genes are DE in HAB.25 vs HAB.8?  And in ARC.25 vs ARC.8? Which species has the most number of genes that respond to temperature?



Finally it would be interesting to know the overlap among temperature regulated genes among species.

First we classify each gene as being up-regulated, down-regulated, or not affected

```r
de.lrt.lyc <- decideTestsDGE(lrt.temp.lyc)
de.lrt.arc <- decideTestsDGE(lrt.temp.arc)
de.lrt.hab <- decideTestsDGE(lrt.temp.hab)
```


Combine them into a single matrix

```r
de.temp <- cbind(de.lrt.lyc, de.lrt.arc, de.lrt.hab)
colnames(de.temp) <- c("Lyc", "Arc", "Hab")
```


Plot it!

```r
vennDiagram(de.temp, include = "up")  #overlap among up-regulated genes
```

![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-171.png) 

```r
vennDiagram(de.temp, include = "down")  #overlap among down-regulated genes
```

![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-172.png) 

```r
vennDiagram(de.temp, include = "both")  #overlap among all DE genes
```

![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-173.png) 


#### Exercise 10
Looking at the final plot, how many genes are DE in all species?  How many genes are only DE in Habrochaites?

