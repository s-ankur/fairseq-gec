#!/usr/bin/env bash

set -e
set -x

source ./config.sh


rm -rf data_align

for trainpref in 'data/train_merge' 'data/valid' 'data/test';
do
mkdir data_align

python scripts/build_sym_alignment.py --fast_align_dir ./software/fast_align/build/ \
--mosesdecoder_dir ./software/mosesdecoder --source_file $trainpref.src \
--target_file $trainpref.tgt --output_dir data_align 

cp data_align/align.forward $trainpref.forward
cp data_align/align.backward $trainpref.backward

rm -rf data_align
done
