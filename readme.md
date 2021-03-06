##Tomato Interns Bioinformatics Week

Scripts, outline, and course material for teaching tomato interns.

### Meeting times and locations
**Week of July 29, 2013**

* Monday 2:00 - 5:00 LS3002
* Tuesday 2:00 - 5:00 LS3002
* Wednesday 2:00 - 5:00 LS2002
* Thursday 1:00 - 4:00 LS2002
* Friday 2:00 - 5:00 LS2002

##Outline
### Day 1: Intro to Atmosphere and Unix (MFC)
* what is atmosphere?
* starting an instance
* connecting to your instance
	* vnc
	* ssh
* idrop
	* move fastq files and other files to play with
* Terminal
	* commands at the terminal
		* idea is to define some useful commands and then give them some tasks
		* be sure to introduce the commands that they will use in examining fastq files...
			* ls
			* cd
			* pwd
			* cp
			* mv
			* mv -i
			* mkdir
			* rm
			* rmdir
			* cat
			* head, tail
			* less
			* pico or equivalent
			* grep
				* possibly with some regex (simple!)
			* pipes
			* man
* Looking at fastq files (applying was learned)
	* use head, tail, etc to examine fastq files
		* examine fastq file: have students describe how they appear to be organized
	* exercises with grep and wc, e.g. number of reads
	* grep -c

### Day 2:  Processing fastq files (MFC)
* Questions/ starting problem set:
	* create a new directory in /mydata
	* navigate to directory in iRods with sequence files
	* how many files are in the directory?
	* download your desiganated file to the new directory in /mydata
	* What is the machine name that the sequences come from?
	* How many lines are in the file?
	* How many sequence records are in the file?
	* create a new file that contains 1,000,000 records from the file you downloaded
* What files do we actually get back from the sequencing facility
* QualityCheck
	* go through FastQC, what the differenet measures mean, etc
	* Phred scores
* BarcodeSplit
	* new QC
* Trimming / filtering
	* new QC
* Mapping to reference
	* BWA to ITAGs
	* tophat to genome
* Stats for mapping: 
	* how many ready mapped?
	
### Day 3: Visualization 
* IGV (MFC)
	* can you find genes that appear up-regulated?
		* think about normalization
	* places where the data doesn't seem to match the annotation
* Sam2Counts.R (JNM)
* Histograms of read counts (R) (JNM)

### Day 4: Differential Expression (JNM)
* normalization
* what does differential expression mean?
* the idea of a linear model
* 1 way comparison
* 2 way comparisons
* 2 way comparisons (with interactions!)

### Day 5 (JNM)
* What do you do with these results?
* GO category enrichment
* plotting particular genes of interest
* what would the follow up experiments be?

	
