# A: WT B: X-minus
# QC
mkdir ../WGS_2nd/QC
fastqc -t 14 -o ../WGS_2nd/QC ../WGS_2nd/20220125WGS/2.cleandata/*/*.fq.gz
fastqc -t 14 -o ../WGS_2nd/QC ../WGS_2nd/20220209WGS/2.cleandata/*/*.fq.gz
multiqc -o ../WGS_2nd/QC ../WGS_2nd/QC
conda activate survirus  
mkdir ../WGS_2nd/20220125WGS/2.cleandata/20220125-A_FKDL220009135-1a/output
mkdir ../WGS_2nd/20220125WGS/2.cleandata/20220125-B_FKDL220009136-1a/output
mkdir ../WGS_2nd/20220209WGS/2.cleandata/20220209-A_FKDL220010683-1a/output
mkdir ../WGS_2nd/20220209WGS/2.cleandata/20220209-B_FKDL220010684-1a/output
# For 20220125-A_FKDL220009135-1a
nohup python ../SurVirus/surveyor.py --fq --wgs --threads 28 \
    ../WGS_2nd/20220125WGS/2.cleandata/20220125-A_FKDL220009135-1a/20220125-A_FKDL220009135-1a_1.clean.fq.gz,../WGS_2nd/20220125WGS/2.cleandata/20220125-A_FKDL220009135-1a/20220125-A_FKDL220009135-1a_2.clean.fq.gz \
    ../WGS_2nd/20220125WGS/2.cleandata/20220125-A_FKDL220009135-1a/output \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_reference/hg38.fa \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/HBV_reference/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_and_HBV_reference/human_HBV.fa \
    --dust ../sdust/sdust > ../WGS_2nd/20220125WGS/2.cleandata/20220125-A_FKDL220009135-1a/output/20220125-A_FKDL220009135-1a.log 2>&1  
# For 20220125-B_FKDL220009136-1a
nohup python ../SurVirus/surveyor.py --fq --wgs --threads 28 \
    ../WGS_2nd/20220125WGS/2.cleandata/20220125-B_FKDL220009136-1a/20220125-B_FKDL220009136-1a_1.clean.fq.gz,../WGS_2nd/20220125WGS/2.cleandata/20220125-B_FKDL220009136-1a/20220125-B_FKDL220009136-1a_2.clean.fq.gz \
    ../WGS_2nd/20220125WGS/2.cleandata/20220125-B_FKDL220009136-1a/output \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_reference/hg38.fa \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/HBV_reference/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_and_HBV_reference/human_HBV.fa \
    --dust ../sdust/sdust > ../WGS_2nd/20220125WGS/2.cleandata/20220125-B_FKDL220009136-1a/output/20220125-B_FKDL220009136-1a.log 2>&1  
# For 20220125-B_FKDL220009136-1a
nohup python ../SurVirus/surveyor.py --fq --wgs --threads 28 \
    ../WGS_2nd/20220209WGS/2.cleandata/20220209-A_FKDL220010683-1a/20220209-A_FKDL220010683-1a_1.clean.fq.gz,../WGS_2nd/20220209WGS/2.cleandata/20220209-A_FKDL220010683-1a/20220209-A_FKDL220010683-1a_2.clean.fq.gz \
    ../WGS_2nd/20220209WGS/2.cleandata/20220209-A_FKDL220010683-1a/output \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_reference/hg38.fa \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/HBV_reference/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_and_HBV_reference/human_HBV.fa \
    --dust ../sdust/sdust > ../WGS_2nd/20220209WGS/2.cleandata/20220209-A_FKDL220010683-1a/output/20220209-A_FKDL220010683-1a.log 2>&1  
# 20220209-B_FKDL220010684-1a
nohup python ../SurVirus/surveyor.py --fq --wgs --threads 28 \
    ../WGS_2nd/20220209WGS/2.cleandata/20220209-B_FKDL220010684-1a/20220209-B_FKDL220010684-1a_1.clean.fq.gz,../WGS_2nd/20220209WGS/2.cleandata/20220209-B_FKDL220010684-1a/20220209-B_FKDL220010684-1a_2.clean.fq.gz \
    ../WGS_2nd/20220209WGS/2.cleandata/20220209-B_FKDL220010684-1a/output \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_reference/hg38.fa \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/HBV_reference/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta \
    ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_and_HBV_reference/human_HBV.fa \
    --dust ../sdust/sdust > ../WGS_2nd/20220209WGS/2.cleandata/20220209-B_FKDL220010684-1a/output/20220209-B_FKDL220010684-1a.log 2>&1  
conda deactivate