# Make a git repository.
mkdir git
cd git
git init
# Clone the github repository of SurVirus software.
cd
git clone https://github.com/kensung-lab/SurVirus.git
cd SurVirus
./build_libs.sh
cmake -DCMAKE_BUILD_TYPE=Release . && make
cd
git clone https://github.com/lh3/sdust.git
cd sdust
make
# Index the human and HBV genome files (fa).
# BWA index contains 5 files, while samtools index contains 1 file (.fai).
cd /media/dell/cmy1/NIBS/Li_lab/data/WYM_project/git/
ln -s ~/Templates/reference_genome ../reference_genome
mkdir ../reference_genome/human_and_HBV_bwa_index_for_SurVirus
gunzip ../reference_genome/fasta_files/UCSC/hg38.fa.gz
cp ../reference_genome/fasta_files/UCSC/hg38.fa ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/hg38.fa
bwa index ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/hg38.fa
samtools faidx ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/hg38.fa
bwa index ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta
samtools faidx ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta
cat ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/hg38.fa ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta > ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_HBV.fa
bwa index ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_HBV.fa
samtools faidx ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_HBV.fa
mkdir ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_reference
mkdir ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/HBV_reference
mkdir ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_and_HBV_reference
mv ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/Hepatitis_B_virus_subtype_ayw_complete_genome* ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/HBV_reference
mv ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/hg38* ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_reference
mv ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_HBV* ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_and_HBV_reference
# Perform QC of fastq files.
mkdir ../2022_sequencing/QC
fastqc -t 14 -o ../2022_sequencing/QC ../2022_sequencing/20220112_A_AC12_050WT_dpi7_HBV_integration_sites/2.cleandata/20220112-A_FKDL220003915-1a/*.fq.gz
fastqc -t 14 -o ../2022_sequencing/QC ../2022_sequencing/20220119_B_AC12_dX_HBV_integration_sites/2.cleandata/20220119-B_FKDL220006093-1a/*.fq.gz
multiqc -o ../2022_sequencing/QC ../2022_sequencing/QC
# Since the SurVirus software utilize python2, we need to create a environment using conda.
conda create --name survirus python=2.7.18 NumPy PyFaidx PySam samtools=1.10 bwa=0.7.17
conda activate survirus  
# Use the SurVirus for alignment.
# The usage of command is 'python surveyor input_files /path/to/empty/workdir /path/to/host/reference /path/to/virus/reference /path/to/host+virus/reference' 
ln -s ~/SurVirus ../SurVirus 
ln -s ~/sdust ../sdust 
mkdir ../2022_sequencing/20220112_A_AC12_050WT_dpi7_HBV_integration_sites/output
mkdir ../2022_sequencing/20220119_B_AC12_dX_HBV_integration_sites/output
nohup python ../SurVirus/surveyor.py --fq --wgs --threads 28 ../2022_sequencing/20220112_A_AC12_050WT_dpi7_HBV_integration_sites/2.cleandata/20220112-A_FKDL220003915-1a/20220112-A_FKDL220003915-1a_1.clean.fq.gz,../2022_sequencing/20220112_A_AC12_050WT_dpi7_HBV_integration_sites/2.cleandata/20220112-A_FKDL220003915-1a/20220112-A_FKDL220003915-1a_2.clean.fq.gz ../2022_sequencing/20220112_A_AC12_050WT_dpi7_HBV_integration_sites/output ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_reference/hg38.fa ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/HBV_reference/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_and_HBV_reference/human_HBV.fa --dust ../sdust/sdust > ../2022_sequencing/20220112_A_AC12_050WT_dpi7_HBV_integration_sites/output/20220112_A_AC12_050WT_dpi7_HBV_integration_sites.log 2>&1  
nohup python ../SurVirus/surveyor.py --fq --wgs --threads 28 ../2022_sequencing/20220119_B_AC12_dX_HBV_integration_sites/2.cleandata/20220119-B_FKDL220006093-1a/20220119-B_FKDL220006093-1a_1.clean.fq.gz,../2022_sequencing/20220119_B_AC12_dX_HBV_integration_sites/2.cleandata/20220119-B_FKDL220006093-1a/20220119-B_FKDL220006093-1a_2.clean.fq.gz ../2022_sequencing/20220119_B_AC12_dX_HBV_integration_sites/output ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_reference/hg38.fa ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/HBV_reference/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/human_and_HBV_reference/human_HBV.fa --dust ../sdust/sdust > ../2022_sequencing/20220119_B_AC12_dX_HBV_integration_sites/output/20220119_B_AC12_dX_HBV_integration_sites.log 2>&1  
conda deactivate