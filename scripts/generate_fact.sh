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

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/commonsense \
        --words 15 \
        --checkpoint $models/model_40perc.pt \
        --outf $samples/free_fact1.txt \
        --seed 100
)

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/commonsense \
        --words 30 \
        --checkpoint $models/model_40perc.pt \
        --outf $samples/free_fact2.txt \
        --seed 200
)


(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/commonsense \
        --words 50 \
        --checkpoint $models/model_40perc.pt \
        --outf $samples/free_fact3.txt \
        --seed 300
)

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/commonsense \
        --words 100 \
        --checkpoint $models/model_40perc.pt \
        --outf $samples/free_fact4.txt \
        --seed 400
)
