import re
from collections import Counter


def tokenizer_counter(string):
    string = string.lower()
    string = re.sub(r"[^a-z0-9\s]", " ", string)
    words = string.split()
    counts = Counter(words)
    return dict(sorted(counts.items()))