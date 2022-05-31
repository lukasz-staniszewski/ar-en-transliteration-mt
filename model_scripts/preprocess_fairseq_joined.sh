# !/bin/bash

MODEL_DATA=../data/model_data
SRC=$MODEL_DATA/sentencepieced
BIN=$MODEL_DATA/binarized-joined

mkdir $BIN

fairseq-preprocess --source-lang ar --target-lang en \
    --trainpref $SRC/train.bpe \
    --validpref $SRC/val.bpe \
    --testpref $SRC/test.bpe \
    --destdir $BIN \
    --workers 10 \
    --joined-dictionary