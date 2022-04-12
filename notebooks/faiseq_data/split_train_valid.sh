#!/bin/bash

src=ar
tgt=en
lang=splitted/train-valid

for l in $src $tgt; do
    awk '{if (NR%23 == 0)  print $0; }' $lang.$l > splitted/valid.$l
    awk '{if (NR%23 != 0)  print $0; }' $lang.$l > splitted/train.$l
done