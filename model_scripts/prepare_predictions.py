import re
import pandas as pd

GENERATIONS_FILE_PATH = "./outs/generate-test.txt"
# NEW_PREDICTIONS_FILE_PATH = "./outs/predictions_transformer.txt"
NEW_PREDICTIONS_FILE_PATH = "./outs/predictions_lstm.txt"

def main():
  ind = 0
  ids = []
  texts = []
  pattern = r"([STHDP])-([0-9]*)\t-[0-9\.]*\t(.*)$"
  with open(GENERATIONS_FILE_PATH, "r",encoding="utf-8") as file:
      while True:
          ind += 1
          x = file.readline()
          if not x:
              break
          finds = re.findall(pattern,x)
          if len(finds) == 0:
              continue
          letter, id, text = finds[0]
          if letter=='H':
              ids.append(int(id))
              texts.append(text)
  df= pd.DataFrame({"ind": ids, "text": texts})
  df.sort_values("ind",ascending=True,inplace=True)
  df['text'].to_csv(NEW_PREDICTIONS_FILE_PATH,header=None,index=None)

if __name__ == "__main__":
  main()
