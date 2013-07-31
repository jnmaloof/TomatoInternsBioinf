# Navigation

Changing to our iRODS directory

    icd /iplant/home/shared/ucd.tomato/ti-2013

# Preparing FASTQ sequence files

Quality filter FASTQ file

    fastq_quality_filter -v -Q33 -q 20 -p 90 -i ID.fq -o q20p90.ID.fq

FASTQC quality analysis

    fastqc

# Mapping FASTQ sequence files to reference sequence (FASTA file)

index FASTA file (only needs to be done once)

    bwa index ITAG2.3_cdna_SHORTNAMES.fasta

align FASTQ file to reference

    bwa aln -f q20p90.ID.sai -t 2 ITAG2.3_cdna_SHORTNAMES.fasta q20p90.ID.fq

convert sequence alignment index (.sai) file to .sam format

    bwa samse -n1 -f q20p90.ID.sam ITAG2.3_cdna_SHORTNAMES.fasta q20p90.ID.sai q20p90.ID.fq

convert .sam file to binary .bam format

    samtools view -Sb q20p90.ID.sam > q20p90.ID.bam

