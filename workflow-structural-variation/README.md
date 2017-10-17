## Overview

Delly workflow produces a set of vcf files with different types of structural variant calls: Translocation, Deletion, Inversion and Duplications
It uses .bam files as input. The below graph describes the process:

![delly flowchart](docs/delly-wf.png)

## Preprocessing

The expected inputs for the DELLY tool are library-level BAMs with distinct insert size and median. In most cases, this means that the BAM files will not need to be merged prior to processing. However, the DELLY website recommends the removal of non-unique, multi-mapped reads and marking duplicate reads. We may also have to realign around indels and perform base recalibration.

### Mark duplicates

Picard Tools MarkDuplicates is used to flag reads as PCR or optical duplicates.
```
 java -jar MarkDuplicates.jar
 INPUT=sample.bam
 OUTPUT=sample.dedup.bam    
 METRICS_FILE=sample.metrics
```

### Detect deletions
```
delly
-t DEL
-x excludeList.tsv
-o sample.jumpy.bam
-q 0
-g hn19.fa
sample.bam
```
 
### Detect tandem duplications
```
delly
-t DUP
-x excludeList.tsv
-o sample.jumpy.bam
-q 0
-g hn19.fa
sample.bam
```
 
### Detect inversions
```
delly
-t INV
-x excludeList.tsv
-o sample.jumpy.bam
-q 0
-g hn19.fa
sample.bam
Detect translocations
```
### Detecting translocations
```
delly
-t TRA
-x excludeList.tsv
-o sample.jumpy.bam
-q 0
-g hn19.fa
sample.bam
```
### Post-processing
Each DELLY tool produces several files, which will all need to be merged together after the chromosomes are finished processing. The output format is described on the DELLY webpage. The merging script may require a small parser to combine the output from multiple runs in together.
Merge DELLY results with vcftools