#!/bin/bash

mkdir -p checkpoints/lstm

fairseq-train binarized \
  --arch lstm \
  --encoder-dropout 0.2 --decoder-dropout 0.2 \
  --optimizer adam --lr 0.005 --lr-shrink 0.5 \
  --save-dir checkpoints/lstm