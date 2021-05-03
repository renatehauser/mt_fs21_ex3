# MT Exercise 3 - Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/renatehauser/mt_fs21_ex3
    cd mt_fs21_ex3

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Preprocess data:

    ./scripts/prepare_commonsense_data.sh

Train all the models in one run:

    ./scripts/train_all_models.sh
    
Or train only the best model:

    ./scripts/train_best_model.sh
    

The training process can be interrupted at any time, and the best checkpoint will always be saved.

# Generating Facts
This is only possible, if the data has been prepared and a model has been trained before.

Generate (sample) some text from a trained model with:

    ./scripts/generate_fact.sh

Generate some more samples when giving some words to start generation with an input:

    ./scripts/generate_fact_with_input.sh
    
    
Alternatively, you can also generate some facts directly from the commandline:

    python3 tools/examples/word-language-model/generate.py \
        --data data/commonsense \
        --words 50 \
        --checkpoint models/model_40perc.pt \
        --outf samples/sample_with_input \
        --input "write something"
      
Try this, if you want to see what happens, if an input word is not in the vocabulary:

    ./scripts/generate_fact_oovocab.sh
    
  
Have fun!        
    
    
