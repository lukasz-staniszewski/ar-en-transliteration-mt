import re
import pandas as pd

MODEL_NAME = "lstm"
# MODEL_NAME = "transformer_tiny"
MODEL_NAME = "lstm_share_emb"

GENERATIONS_FILE_PATH = (
    "./../predictions/outs_" + MODEL_NAME + "/generate-test.txt"
)
NEW_PREDICTIONS_FILE_PATH = (
    "./../predictions/outs_" + MODEL_NAME + "/predictions.txt"
)


def main():
    ind = 0
    ids = []
    texts = []
    pattern = r"([STHDP])-([0-9]*)\t-[0-9\.]*\t(.*)$"
    with open(GENERATIONS_FILE_PATH, "r", encoding="utf-8") as file:
        while True:
            ind += 1
            x = file.readline()
            if not x:
                break
            finds = re.findall(pattern, x)
            if len(finds) == 0:
                continue
            letter, id, text = finds[0]
            if letter == "H":
                ids.append(int(id))
                texts.append(text)
    df = pd.DataFrame({"ind": ids, "text": texts})
    df.sort_values("ind", ascending=True, inplace=True)
    df["text"].to_csv(
        NEW_PREDICTIONS_FILE_PATH, header=None, index=None
    )


if __name__ == "__main__":
    main()
