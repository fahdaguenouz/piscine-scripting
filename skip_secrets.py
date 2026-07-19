import sys
import os

if len(sys.argv) != 2:
    sys.exit(1)

file_name = sys.argv[1]

if not os.path.isfile(file_name) or not os.access(file_name, os.R_OK):
    sys.exit(1)

with open(file_name, "r") as infile, open("out.txt", "w") as outfile:
    for line in infile:
        if "pineapple" not in line:
            outfile.write(line)