<h1 align="center">Impact of transliteration on Arabic to English Machine Translation</h1>
<h3 align="center"><a href="https://github.com/bartooo">Bartosz Cywiński</a> & <a href="https://github.com/lukasz-staniszewski">Łukasz Staniszewski</a> (Warsaw Univerity of Technology)</h3>
<div align="center">
<img src="https://user-images.githubusercontent.com/59453698/170889411-d9a154eb-8716-4027-b842-b5fa4c2b1cb9.png" alt="banner">
</div>

## Task
Task was to investigate impact of transliteration on Machine Translation from Arabic to English. Full documentation written in Polish is <a href="https://github.com/lukasz-staniszewski/ar-en-transliteration-mt/blob/main/doc/doc.pdf">here</a>. 

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