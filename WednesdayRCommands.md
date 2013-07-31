# Getting counts from BAM files and plotting

## Converting Bam or Sam to counts

Now that we have mapped our reads to the tomato genes we want to know how many reads map to each gene.  To do this we will use an R script "SamBam2Counts.R".

* Please use icommands to download the script "SamBam2Counts.R" from the ti-2013 directory on iRods to your /mydata directory.

### Connecting to R on your atmosphere instance

You use Rstudio when you worked with Ciera.  We also will use R studio on your virtual linux machines.  In this case we will use a web browser to connect to Rstudio running on your virtual machine.

* Open a web browser on your laptop
* Type in the IP address of your machine followed by :8787
	* for example "128.196.142.110:8787"
* login using your atmosphere username and password 

You should now have a Rstudio window displayed on your browser.  This Rstudio is running on your atmosphere virtual machine.

### Navigate to /mydata

We next need to set /mydata as the working directory for Rstudio.

* Click on the "..." in the lower right hand pane of Rstudio.
* When asked for the "Path to folder" enter "/mydata"
* Click on the "More" menu on the lower right hand pane.  Select "Set as Working Directory"

### Open and run SamBam2Counts.R

* Open SamBam2Counts.R .  You can do this by double-clicking on it in the lower righthand pane,  or be using "open" under the File menu, upper lefthand pane.
* Change the lines starting with inputDir, outputFile, and bam as appropriate
* Select all of the script and type ctrl-enter (cmd-enter on mac)
* be patient
* The script will output some stats to the screen.  It also creates an object "results" and writes the results to a tab-delimited file.

### Examine the results

Lets see what the script did.

The counts are in an R object "results".

Do you remember how to look at the beginning of this object and how to get a summary?  Do so now.  Describe the what you think each row and column represents

It also would be nice to look at a histogram of read counts.

We first want to remove the first row of results, as that contains reads that are not mapped

    results <- results[-1,] 

You made a histogram with Ciera.  Do you remember how to do it?  

A simple way is with the hist command

    hist(results$XXXX) #replace XXX with a column name from results

What does this histogram tell us?  It is pretty hard to read because of the y-axis scale.  To fix this lets try it in ggplot

    library(ggplot2)
    pl <- ggplot(data=results,aes(x=XXXXX)) + geom_histogram() #replace XXXXX with a column name from results
    pl + scale_y_sqrt()

### Histogram of multiple columns

    library(reshape)
    results.m <- melt(results,id.vars="gene")

    head(results.m)

    pl <- ggplot(data=results.m,aes(x=value,fill=variable)) + geom_histogram() 
    pl <- pl + scale_y_sqrt() + facet_wrap(~ variable)
    pl



