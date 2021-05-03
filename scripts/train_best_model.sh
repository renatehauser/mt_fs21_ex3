#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=4
device=""

SECONDS=0


echo "Start of training with dropout of 0.4"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python3 main.py --data $data/commonsense \
        --epochs 30 \
        --emsize 200 --nhid 200 --dropout 0.4 --tied \
        --save $models/model_40perc.pt \
        --log-interval 140
)

echo "time taken:"
echo "$SECONDS seconds"

