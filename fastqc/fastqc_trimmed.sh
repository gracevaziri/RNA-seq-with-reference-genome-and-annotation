#!/bin/bash
#SBATCH --job-name=fastqc_trimmed
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=10G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=first.last@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

echo `hostname`

#################################################################
# FASTQC of raw reads 
#################################################################
dir="after"
if [ ! -d "$dir" ]; then
        mkdir -p $dir
fi

module load fastqc/0.11.7
fastqc --outdir ./"$dir"/ ../quality_control/LB2A_SRR1964642_trim.fastq.gz -t 8
fastqc --outdir ./"$dir"/ ../quality_control/LB2A_SRR1964643_trim.fastq.gz -t 8
fastqc --outdir ./"$dir"/ ../quality_control/LC2A_SRR1964644_trim.fastq.gz -t 8
fastqc --outdir ./"$dir"/ ../quality_control/LC2A_SRR1964645_trim.fastq.gz -t 8

