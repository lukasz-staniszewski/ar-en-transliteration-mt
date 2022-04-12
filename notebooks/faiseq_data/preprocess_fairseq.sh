#!/bin/bash

TEXT=sentencepieced

mkdir binarized

fairseq-preprocess --source-lang ar --target-lang en \
    --trainpref $TEXT/train.bpe \
    --validpref $TEXT/valid.bpe \
    --testpref $TEXT/test.bpe \
    --destdir binarized \
    --workers 10