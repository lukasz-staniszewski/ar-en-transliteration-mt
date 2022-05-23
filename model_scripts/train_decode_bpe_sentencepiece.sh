#!/bin/bash

SRCS=(
    "ar"
)
TGT=en

ROOT=$(dirname "$0")
DATA=$ROOT/../data/processed
SCRIPTS=$ROOT/../tools/fairseq/scripts
SPM_TRAIN=$SCRIPTS/spm_train.py
SPM_ENCODE=$SCRIPTS/spm_encode.py
BPESIZE=10000

TRAIN_MINLEN=1  # remove sentences with <1 BPE token
TRAIN_MAXLEN=250  # remove sentences with >250 BPE tokens

mkdir $ROOT/../data/model_data
mkdir $ROOT/../data/model_data/sentencepieced
DATA_OUT=$ROOT/../data/model_data/sentencepieced

# learn BPE with sentencepiece
TRAIN_FILES=$(for SRC in "${SRCS[@]}"; do echo $DATA/train.${SRC}; echo $DATA/train.${TGT}; done | tr "\n" ",")
echo "learning joint BPE over ${TRAIN_FILES}..."
python "$SPM_TRAIN" \
    --input=$TRAIN_FILES \
    --model_prefix=$DATA_OUT/sentencepiece.bpe \
    --vocab_size=$BPESIZE \
    --character_coverage=1.0 \
    --model_type=bpe

# encode train/valid
echo "encoding train with learned BPE..."
for SRC in "${SRCS[@]}"; do
    python "$SPM_ENCODE" \
        --model "$DATA_OUT/sentencepiece.bpe.model" \
        --output_format=piece \
        --inputs $DATA/train.${SRC} $DATA/train.${TGT} \
        --outputs $DATA_OUT/train.bpe.${SRC} $DATA_OUT/train.bpe.${TGT} \
        --min-len $TRAIN_MINLEN --max-len $TRAIN_MAXLEN
done

echo "encoding valid with learned BPE..."
for SRC in "${SRCS[@]}"; do
    python "$SPM_ENCODE" \
        --model "$DATA_OUT/sentencepiece.bpe.model" \
        --output_format=piece \
        --inputs $DATA/val.${SRC} $DATA/val.${TGT} \
        --outputs $DATA_OUT/val.bpe.${SRC} $DATA_OUT/val.bpe.${TGT} 
done

echo "encoding test with learned BPE..."
for SRC in "${SRCS[@]}"; do
    python "$SPM_ENCODE" \
        --model "$DATA_OUT/sentencepiece.bpe.model" \
        --output_format=piece \
        --inputs $DATA/test.${SRC} $DATA/test.${TGT} \
        --outputs $DATA_OUT/test.bpe.${SRC} $DATA_OUT/test.bpe.${TGT} 
done
