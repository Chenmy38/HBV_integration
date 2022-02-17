# Download data from SRA.
# Data come from doi: 10.1093/nar/gkaa1237
fasterq-dump ERR162269 --outdir ../practice_data --progress --temp ../practice_data --threads 28  --details --verbose > ../practice_data/ERR162269.log 2>&1