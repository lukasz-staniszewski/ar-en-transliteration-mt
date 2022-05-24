# ar-en-transliteration-mt
Arabic to english machine translation models using classic and transliterated approach.



## Instalation:
1. To download all data and preprocess it go to notebooks/data_preprocessing.ipynb and use it to get all processed data in data/processed/

2. To get your processed data sentencepieced, go to model_scripts, and, using python environment with fairseq installed, run bash script:
```
$ bash train_decode_bpe_sentencepiece.sh
```

3. Now you need to binarize all data to have it work with fairseq - run bash script:
```
$ bash preprocess_fairseq.sh
```

4. Now start learning of model:
```
$ bash train_fairseq.sh
```

5. Generate model predictions:
```
$ bash generate_fairseq.sh
```

6. To evaluate metrics go to notebooks/ and run metrics.ipynb