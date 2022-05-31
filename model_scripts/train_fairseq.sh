#!/bin/bash
MODEL_DATA=../data/model_data
BIN=$MODEL_DATA/binarized

MODEL_NAME = lstm

mkdir ./../logs/logs_$MODEL_NAME
mkdir -p ./../checkpoints/$MODEL_NAME

fairseq-train $BIN \
  --arch $MODEL_NAME --batch-size 256 \
  --optimizer nag --lr 0.15 \
  --save-dir ./../checkpoints/$MODEL_NAME \
  --clip-norm 0.1 --dropout 0.2 \
  --seed 0 \
  --tensorboard-logdir ./../logs/logs_$MODEL_NAME
