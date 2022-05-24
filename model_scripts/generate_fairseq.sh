# !/bin/bash

fairseq-generate ../data/model_data/binarized \
    --source-lang ar \
    --target-lang en \
    --results-path ./outs \
    --path ./checkpoints/lstm/checkpoint_best.pt \
    --batch-size 128 \
    --beam 5 \
    --tensorboard-logdir ./../logs/tensorboard \
    --remove-bpe=sentencepiece
    # --scoring sacrebleu
    # --scoring chrf