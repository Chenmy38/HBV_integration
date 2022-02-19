# Download data from SRA.
# Data come from doi: 10.1093/nar/gkaa1237
fasterq-dump ERR162269 --outdir ../practice_data --progress --temp ../practice_data --threads 28  --details --verbose > ../practice_data/ERR162269.log 2>&1
# For pb_data analysis
# Quality control of fastq files
mkdir ../practice_data/pb_data/QC
fastqc -t 28 -o ../practice_data/pb_data/QC ../practice_data/pb_data/*.fastq.gz
multiqc -o ../practice_data/pb_data/QC ../practice_data/pb_data/QC
# Execute survirus
conda activate survirus
mkdir ../practice_data/pb_data/output1
mkdir ../practice_data/pb_data/output2
nohup python ../SurVirus/surveyor.py --fq --wgs --threads 28 ../practice_data/pb_data/B18-1_L4_A021.R1.fastq.gz,../practice_data/pb_data/B18-1_L4_A021.R2.fastq.gz ../practice_data/pb_data/output1 ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_reference/hg38.fa ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/HBV_reference/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_and_HBV_reference/human_HBV.fa --dust ../sdust/sdust > ../practice_data/pb_data/output1/B18-1_L4_A021.log 2>&1
nohup python ../SurVirus/surveyor.py --fq --wgs --threads 28 ../practice_data/pb_data/B18-2_L4_A022.R1.fastq.gz,../practice_data/pb_data/B18-2_L4_A022.R2.fastq.gz ../practice_data/pb_data/output2 ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_reference/hg38.fa ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/HBV_reference/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_and_HBV_reference/human_HBV.fa --dust ../sdust/sdust > ../practice_data/pb_data/output2/B18-2_L4_A022.log 2>&1