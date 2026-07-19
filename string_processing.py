import re

def tokenize(sentence):
    sentence = sentence.lower()
    sentence = re.sub(r'[^a-z0-9]', ' ', sentence)
    return sentence.split()