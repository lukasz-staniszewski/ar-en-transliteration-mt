#!/bin/bash

src=ar
tgt=en
lang=ar-en

mkdir splitted

for l in $src $tgt; do
    awk '{if (NR%28 == 0)  print $0; }' $lang.$l > splitted/test.$l
    awk '{if (NR%28 != 0)  print $0; }' $lang.$l > splitted/train-valid.$l
done