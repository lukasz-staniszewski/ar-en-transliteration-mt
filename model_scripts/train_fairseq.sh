#!/bin/bash
MODEL_DATA=../data/model_data
BIN=$MODEL_DATA/binarized
mkdir -p checkpoints/lstm
mkdir -p checkpoints/transformer_tiny

fairseq-train $BIN \
  --arch lstm --batch-size 256 \
  --optimizer nag --lr 0.15 \
  --save-dir checkpoints/lstm \
  --clip-norm 0.1 --dropout 0.2 \
  --user-dir tb_lstm \
  --seed 0 \
  --tensorboard-logdir tb_lstm 

# fairseq-train $BIN \
  # --arch transformer_tiny --batch-size 256 \
  # --optimizer nag --lr 0.15 \
  # --save-dir checkpoints/transformer_tiny \
  # --clip-norm 0.1 --dropout 0.2 \
  # --user-dir tb \
  # --seed 0 \
  # --tensorboard-logdir tb

