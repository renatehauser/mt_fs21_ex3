#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
samples=$base/samples

mkdir -p $samples

num_threads=4
device=""

(cd $tools/examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/commonsense \
        --words 15 \
        --checkpoint $models/model_40perc.pt \
        --outf $samples/input_fact1.txt \
        --input "I think that"
)

(cd $tools/examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/commonsense \
        --words 25 \
        --checkpoint $models/model_40perc.pt \
        --outf $samples/input_fact2.txt \
        --input "fact is :"
)

(cd $tools/examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/commonsense \
        --words 50 \
        --checkpoint $models/model_40perc.pt \
        --outf $samples/input_fact3.txt \
        --input "that"
)

(cd $tools/examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/commonsense \
        --words 100 \
        --checkpoint $models/model_40perc.pt \
        --outf $samples/input_fact4.txt \
        --input "funny is"
)

(cd $tools/examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/commonsense \
        --words 200 \
        --checkpoint $models/model_40perc.pt \
        --outf $samples/input_fact5.txt \
        --input "baking a cake"
)

(cd $tools/examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/commonsense \
        --words 30 \
        --checkpoint $models/model_40perc.pt \
        --outf $samples/input_fact6.txt \
        --input "computers are for"
)