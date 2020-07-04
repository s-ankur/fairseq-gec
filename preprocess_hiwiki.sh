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
rm -rf out/data_hiwiki

# preprocess test
python preprocess.py \
$common_params \
$copy_params \
--srcdict out/data_bin/dict.src.txt \
--testpref data/hiwiki \
--destdir out/data_hiwiki \
--output-format raw \
--thresholdsrc 25 \
--thresholdtgt 25 

mv out/data_hiwiki/test.src-tgt.src out/data_hiwiki/test.src-tgt.src.old