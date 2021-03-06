#!/usr/bin/env bash
source ./config.sh

set -e
set -x

pretrained_model=./out/models_pretrain/checkpoint9.pt

CUDA_VISIBLE_DEVICES=$device python train.py $DATA_BIN \
--save-dir $MODELS \
--seed 4321 \
--max-epoch 10 \
--batch-size 64 \
--max-tokens 3000 \
--train-subset train \
--valid-subset valid \
--arch transformer \
--lr-scheduler triangular --max-lr 0.004 --lr-period-updates 73328 \
--clip-norm 2 --lr 0.001 --lr-shrink 0.95 --shrink-min \
--dropout 0.2 --relu-dropout 0.2 --attention-dropout 0.2 --copy-attention-dropout 0.2 \
--encoder-embed-dim 512 --decoder-embed-dim 512 \
--max-target-positions 1024 --max-source-positions 1024 \
--encoder-ffn-embed-dim 4096 --decoder-ffn-embed-dim 4096 \
--encoder-attention-heads 8 --decoder-attention-heads 8 \
--copy-attention-heads 1 \
--share-all-embeddings \
--log-interval 1000 \
--positive-label-weight 1.2 \
--copy-attention --copy-attention-heads 1 


