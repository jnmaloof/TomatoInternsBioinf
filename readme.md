#Tomato Interns Bioinformatics Week

Scripts, outline, and course material for teaching tomato interns.

#Outline
## Day 1: Intro to Atmosphere and Unix (MFC)
* what is atmosphere
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
				* could grep for machine name, etc and pipe to wc
				* and then illustrate that grep -c does the same...
			* man
* Looking at fastq files (applying what they learned)
	* use head, tail, etc to examine fastq files
	* stare at organization of fastq file to see if they can generate some hypotheses about how they are organized...
	* grep -c

## Day 2:  Processing fastq files (MFC)
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
	
## Day 3: Visualization 
* IGV (MFC)
	* can you find genes that appear up-regulated?
		* think about normalization
	* places where the data doesn't seem to match the annotation
* Sam2Counts.R (JNM)
* Histograms of read counts (R) (JNM)

## Day 4: Differential Expression (JNM)
* normalization
* what does differential expression mean?
* the idea of a linear model
* 1 way comparison
* 2 way comparisons
* 2 way comparisons (with interactions!)

## Day 5 (JNM)
* What do you do with these results?
* GO category enrichment
* plotting particular genes of interest
* what would the follow up experiments be?

	