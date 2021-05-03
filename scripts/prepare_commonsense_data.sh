#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# filter out other languages than english

python3 $base/scripts/lang_filter.py $data/commonsense/raw/omcs_raw_mixed_200k.txt $data/commonsense/raw/omcs_commonsense_raw.txt

# keep first 15k lines of the file

head -15000 $data/commonsense/raw/omcs_commonsense_raw.txt > $data/commonsense/raw/omcs_commonsense_raw_15k.txt

# preprocess slightly

cat $data/commonsense/raw/omcs_commonsense_raw_15k.txt | python3 $base/scripts/preprocess_raw.py > $data/commonsense/raw/omcs_commonsense.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/commonsense/raw/omcs_commonsense.cleaned.txt | python3 $base/scripts/preprocess.py --vocab-size 6000 --tokenize --lang "en" > \
    $data/commonsense/raw/omcs_commonsense.preprocessed.txt

# split into train, valid and test

head -n 1000 $data/commonsense/raw/omcs_commonsense.preprocessed.txt > $data/commonsense/valid.txt
head -n 2000 $data/commonsense/raw/omcs_commonsense.preprocessed.txt | tail -n 1000 > $data/commonsense/test.txt
tail -n 13000 $data/commonsense/raw/omcs_commonsense.preprocessed.txt > $data/commonsense/train.txt
