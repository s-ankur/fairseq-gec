#!/usr/bin/env bash
source ./config.sh

set -e
set -x
epoch="_last"
ema='ema'


python ./gec_scripts/revert_split.py out/result_hiwiki/output$ema$epoch.txt.split out/data_hiwiki/test.idx > out/result_hiwiki/output$ema$epoch.txt


python2 ./software/m2scorer/scripts/m2scorer.py -v out/result_hiwiki/output$ema$epoch.txt ./data/hiwiki.m2 > out/result_hiwiki/m2score$ema$exp_$epoch.log
tail -n 1 out/result_hiwiki/m2score$ema$exp_$epoch.log

python gec_scripts/show_m2.py out/result_hiwiki/m2score$ema$exp_$epoch.log
