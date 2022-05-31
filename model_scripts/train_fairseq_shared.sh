#!/bin/bash
MODEL_DATA=../data/model_data
BIN=$MODEL_DATA/binarized-joined


MODEL_NAME=lstm_share_emb

mkdir -p ./../checkpoints/$MODEL_NAME
mkdir ./../logs/logs_$MODEL_NAME

fairseq-train $BIN \
  --arch lstm --batch-size 256 \
  --optimizer nag --lr 0.15 \
  --save-dir ./../checkpoints/$MODEL_NAME \
  --clip-norm 0.1 --dropout 0.2 \
  --seed 0 \
  --tensorboard-logdir ./../logs/logs_$MODEL_NAME \
  --share-all-embeddings
