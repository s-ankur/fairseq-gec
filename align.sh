#!/usr/bin/env bash


set -e
set -x

source ./config.sh

rm -rf data_align
mkdir data_align


trainpref='data/train_merge'
#trainpref='data/valid'

python scripts/build_sym_alignment.py --fast_align_dir ./software/fast_align/build/ \
--mosesdecoder_dir ./software/mosesdecoder --source_file $trainpref.src \
--target_file $trainpref.tgt --output_dir data_align 

cp data_align/align.forward $trainpref.forward
cp data_align/align.backward $trainpref.backward

rm -rf data_align
