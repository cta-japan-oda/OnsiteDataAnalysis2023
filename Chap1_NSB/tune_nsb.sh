#!/bin/sh

# 
MCFILE=/fefs/aswg/data/mc/DL0/LSTProd2/TrainingDataset/Protons/dec_2276/sim_telarray/node_theta_44.927_az_85.716_/output_v1.4/simtel_corsika_theta_44.927_az_85.716_run1.simtel.gz

DL1DATA=`ls /fefs/aswg/data/real/DL1/20*/v*/tailcut84/dl1_LST-1.Run09686.0000.h5`

CONFIG=/fefs/aswg/workspace/seiya.nozaki/data/GRB221009A/20221105_nsb_tune/DL1_MC/lstchain_standard_config.json



lstchain_tune_nsb \
--input-mc ${MCFILE} \
--input-data ${DL1DATA} \
--config ${CONFIG}
