# Preparing FASTQ sequence files

Quality filter FASTQ file

    fastq_quality_filter -v -Q33 -q 20 -p 90 -i ID.fq -o ID.q20p90.fq

FASTQC quality analysis

    fastqc

# Mapping FASTQ sequence files to reference sequence (FASTA file)

index FASTA file (only needs to be done once)

    bwa index ITAG2.3_cdna_SHORTNAMES.fasta

align FASTQ file to reference

    bwa aln -f ID.q20p90.sai -t 2 ITAG2.3_cdna_SHORTNAMES.fasta ID.q20p90.fq

convert sequence alignment index (.sai) file to .sam format

    bwa samse -n1 -f ID.q20p90.sam ITAG2.3_cdna_SHORTNAMES.fasta ID.q20p90.sai ID.q20p90.fq

convert .sam file to binary .bam format

    samtools view -Sb ID.q20p90.sam > ID.q20p90.bam

