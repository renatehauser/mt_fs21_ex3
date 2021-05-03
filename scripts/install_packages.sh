#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

tools=$base/tools
mkdir -p $tools

echo "Make sure this script is executed AFTER you have activated a virtualenv"

#pip3 install torch sacremoses

pip3 install -r $base/requirements.txt

# install Moses scripts for preprocessing

git clone https://github.com/bricksdont/moses-scripts $tools/moses-scripts

# install pytorch examples

git clone https://github.com/pytorch/examples $tools/pytorch-examples

# install pytorch examples with modified generate.py

git clone https://github.com/renatehauser/examples
