Differential Gene Expression Analysis in R
========================================================

Yesterday we finished by running SamBam2counts.R to determine the number of counts per gene.  Login to Rstudio Server (point the browser on your laptop to 128.196.142.XXX:8787, *replacing* XXX with the correct digits for your atmosphere instance).

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
pl <- pl + geom_histogram()
pl <- pl + scale_y_sqrt() + ylab("number of genes") + xlab("read count")
pl
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

![plot of chunk ggplot_histogram](figure/ggplot_histogram.png) 


If we want to just look at the lower left portion:

```r
pl + xlim(c(0, 5000))  #genes with between 0 and 5000 counts
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

![plot of chunk ggplot_histogram_v2](figure/ggplot_histogram_v21.png) 

```r
pl + xlim(c(0, 1000))  #genes with between 0 and 1000 counts
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
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
## 3 Solyc00g005040.2.1        1       NA        2      NA      NA      NA
## 4 Solyc00g005050.2.1      389      222      213     146     146     155
## 5 Solyc00g005150.1.1        1        1        1      NA      NA      NA
## 6 Solyc00g005840.2.1      605      364      402     359     515     345
## 7 Solyc00g005980.1.1        1       NA       NA      NA      NA      NA
##   HAB.25.1 HAB.25.2 HAB.25.3 HAB.25.4 HAB.8.2 HAB.8.3 HAB.8.4 LYC.25.1
## 2      207      227      180      192      52      40      85      305
## 3       NA        1       NA       NA       1      NA      NA       NA
## 4      270      292      214      232      78     182     160      196
## 5        1        1       NA       NA      NA      NA      NA       NA
## 6      344      353      315      495     231     177     226      234
## 7       NA       NA       NA       NA      NA      NA      NA       NA
##   LYC.25.2 LYC.25.3 LYC.25.4 LYC.8.1 LYC.8.3
## 2      232      297      414      20      10
## 3        2        1        4      NA      NA
## 4      201      175      216     110     116
## 5       NA       NA       NA      NA      NA
## 6      284      250      251     186     222
## 7       NA       NA       NA      NA      NA
```

```r
tail(results.gene)
```

```
##                     gene ARC.25.2 ARC.25.3 ARC.25.4 ARC.8.1 ARC.8.2
## 28556 Solyc11g073210.1.1       NA       NA       NA      NA      NA
## 28557 Solyc12g017290.1.1       NA       NA       NA      NA      NA
## 28558 Solyc12g017500.1.1       NA       NA       NA      NA      NA
## 28559 Solyc12g021160.1.1       NA       NA       NA      NA      NA
## 28560 Solyc12g055690.1.1       NA       NA       NA      NA      NA
## 28561 Solyc12g062310.1.1       NA       NA       NA      NA      NA
##       ARC.8.3 HAB.25.1 HAB.25.2 HAB.25.3 HAB.25.4 HAB.8.2 HAB.8.3 HAB.8.4
## 28556      NA       NA       NA       NA       NA      NA      NA      NA
## 28557      NA       NA       NA       NA       NA      NA      NA      NA
## 28558      NA       NA       NA       NA       NA      NA      NA      NA
## 28559      NA       NA       NA       NA       NA      NA      NA      NA
## 28560      NA       NA       NA       NA       NA      NA      NA      NA
## 28561      NA       NA       NA       NA       NA      NA      NA      NA
##       LYC.25.1 LYC.25.2 LYC.25.3 LYC.25.4 LYC.8.1 LYC.8.3
## 28556       NA       NA       NA       NA      NA       1
## 28557       NA       NA       NA       NA      NA       1
## 28558       NA       NA       NA       NA      NA       1
## 28559       NA       NA       NA       NA      NA       1
## 28560       NA       NA       NA       NA      NA       1
## 28561       NA       NA       NA       NA      NA       1
```


#### Exercise 5:
What are "value" and "variable" in the results.gene.melt data frame?

now we can plot multiple histograms easily

```r
pl <- ggplot(data = results.gene.melt, aes(x = value, fill = variable))
pl <- pl + geom_histogram()
pl <- pl + facet_wrap(~variable, ncol = 5)
pl <- pl + scale_y_sqrt() + ylab("number of genes") + xlab("read count")
pl
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust
## this.
```

![plot of chunk ggplot_faceted_histogram](figure/ggplot_faceted_histogram.png) 

You may want to press on the "zoom" button to see the plot more clearly


```r
plot(cars)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 


