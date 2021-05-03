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

echo "Start of training with dropout of 0.8"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python3 main.py --data $data/commonsense \
        --epochs 30 \
        --emsize 200 --nhid 200 --dropout 0.8 --tied \
        --save $models/model_80perc.pt \
        --log-interval 140
)

echo "time taken:"
echo "$SECONDS seconds"

SECONDS=0

echo "Start of training with dropout of 0.6"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python3 main.py --data $data/commonsense \
        --epochs 30 \
        --emsize 200 --nhid 200 --dropout 0.6 --tied \
        --save $models/model_60perc.pt \
        --log-interval 140
)

echo "time taken:"
echo "$SECONDS seconds"


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

SECONDS=0

echo "Start of training with dropout of 0.2"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python3 main.py --data $data/commonsense \
        --epochs 30 \
        --emsize 200 --nhid 200 --dropout 0.2 --tied \
        --save $models/model_20perc.pt \
        --log-interval 140
)

echo "time taken:"
echo "$SECONDS seconds"

SECONDS=0

echo "Start of training with dropout of 0"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python3 main.py --data $data/commonsense \
        --epochs 30 \
        --emsize 200 --nhid 200 --dropout 0 --tied \
        --save $models/model_0.pt \
        --log-interval 140
)

echo "time taken:"
echo "$SECONDS seconds"
