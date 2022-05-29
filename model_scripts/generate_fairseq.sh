# !/bin/bash

MODEL_NAME = lstm
# MODEL_NAME = transformer_tiny

mkdir ./../predictions/outs_$MODEL_NAME
mkdir ./../logs/logs_$MODEL_NAME


fairseq-generate ../data/model_data/binarized \
    --source-lang ar \
    --target-lang en \
    --results-path ./../predictions/outs_$MODEL_NAME \
    --path ./checkpoints/$MODEL_NAME/checkpoint_best.pt \
    --batch-size 128 \
    --beam 5 \
    --tensorboard-logdir ./../logs/logs_$MODEL_NAME \
    --remove-bpe=sentencepiece