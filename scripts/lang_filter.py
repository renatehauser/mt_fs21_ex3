#from textblob import TextBlob
#from spacy_langdetect import LanguageDetector
#import spacy
#from googletrans import Translator
import pycld2 as cld2
import sys

def main():

    infilename = sys.argv[1]
    outfilename = sys.argv[2]

    #nlp = spacy.load('en')
    #nlp.add_pipe(LanguageDetector(), name='language_detector', last=True)

    #translator = Translator()


    with open(infilename, 'r', encoding='utf-8') as infile, open(outfilename, 'w', encoding='utf-8') as outfile:
        for line in infile:
            #blob = TextBlob(line)
            #lang = blob.detect_language()
            #doc = nlp(line)
            #lang = doc._.language['language']
            #print(type(line))
            #detection = translator.detect(line)
            #lang = detection.lang
            _, _, _, detected_language = cld2.detect(line, returnVectors=True)
            lang = detected_language[0][3]
            if lang == 'en':
                outfile.write(line)
                #outfile.write('\n')
            else:
                continue


if __name__ == '__main__':
    main()