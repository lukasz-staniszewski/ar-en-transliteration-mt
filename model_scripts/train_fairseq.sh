#!/bin/bash
MODEL_DATA=../data/model_data
BIN=$MODEL_DATA/binarized
mkdir -p checkpoints/lstm
mkdir -p checkpoints/transformer_tiny

fairseq-train $BIN \
  --arch lstm --batch-size 128 \
  --optimizer nag --lr 0.15 \
  --save-dir checkpoints/lstm \
  --clip-norm 0.1 --dropout 0.2 