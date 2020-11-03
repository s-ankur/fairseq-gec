#!/usr/bin/env bash
source ./config.sh

set -e
set -x

# set copy params
copy_params='--copy-ext-dict'

# set common params between train/test
common_params='--source-lang src --target-lang tgt  
--padding-factor 1 
--joined-dictionary 
'

for epoch in {1..9}; do
    echo $epoch

    trainpref=$DATA/train_himono_$epoch
    validpref=$DATA/valid

    # preprocess train/valid
    python preprocess.py \
    $common_params \
    $copy_params \
    --trainpref $trainpref \
    --validpref $validpref \
    --destdir ${DATA_BIN}_art_$epoch \
    --output-format binary \
    --alignfile $trainpref.forward 

done
