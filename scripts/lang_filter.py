# Small Python script for filtering out segments that are not in english from a dataset
# author: Renate Hauser

import pycld2 as cld2
import sys

def main():

    infilename = sys.argv[1]
    outfilename = sys.argv[2]

    with open(infilename, 'r', encoding='utf-8') as infile, open(outfilename, 'w', encoding='utf-8') as outfile:
        for line in infile:
            _, _, _, detected_language = cld2.detect(line, returnVectors=True)
            if detected_language:
                lang = detected_language[0][3]
                if lang == 'en':
                    outfile.write(line)
                else:
                    continue
            else:
                continue


if __name__ == '__main__':
    main()