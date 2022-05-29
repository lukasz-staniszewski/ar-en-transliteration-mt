#!/bin/bash
MODEL_DATA=../data/model_data
BIN=$MODEL_DATA/binarized

mkdir -p ./../checkpoints/lstm
mkdir -p ./../checkpoints/transformer_tiny
mkdir ./../logs/logs_$MODEL_NAME

MODEL_NAME = lstm
# MODEL_NAME = transformer_tiny

fairseq-train $BIN \
  --arch $MODEL_NAME --batch-size 256 \
  --optimizer nag --lr 0.15 \
  --save-dir ./../checkpoints/$MODEL_NAME \
  --clip-norm 0.1 --dropout 0.2 \
  --seed 0 \
  --tensorboard-logdir ./../logs/logs_$MODEL_NAME
