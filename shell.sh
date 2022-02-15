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
# Index the human and HBV genome files (fa).
cd /media/dell/cmy1/NIBS/Li_lab/data/WYM_project/git/
ln -s ~/Templates/reference_genome ../reference_genome
ln -s ~/Templates/HBV_genome ../HBV_genome
mkdir ../reference_genome/human_and_HBV_bwa_index_for_SurVirus
gunzip ../reference_genome/fasta_files/UCSC/hg38.fa.gz
cp ../reference_genome/fasta_files/UCSC/hg38.fa ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/hg38.fa
bwa index ../reference_genome/human_and_HBV_bwa_index_for_SurVirus/hg38.fa
bwa index ../HBV_genome/human_and_HBV_bwa_index_for_SurVirus/Hepatitis_B_virus_subtype_ayw_complete_genome.fasta

