#!/bin/sh
#
# usage: lstchain_tune_nsb [-h] --config CONFIG --input-mc INPUT_MC --input-data INPUT_DATA [--output-file OUTPUT_FILE] [--overwrite]
#
#

##### Config #####

# Input MC file. Must be a simtel file! 
MCFILE=/fefs/aswg/data/mc/DL0/LSTProd2/TrainingDataset/Protons/dec_2276/sim_telarray/node_theta_44.927_az_85.716_/output_v1.4/simtel_corsika_theta_44.927_az_85.716_run1.simtel.gz

# Input real DL1 file. 
DL1DATA=`ls /fefs/aswg/data/real/DL1/20*/v*/tailcut84/dl1_LST-1.Run09686.0000.h5`

# Config file. Must include "image_modifier" section in this config file! (It works without "image_modifier" section, but the output config file will not be written)
CONFIG=dl1ab_standard_config.json

# Outout config file with appropriate "image_modifier" parameters.
OUTPUTPATH=output_dl1ab_standard_config.json


##### Execution #####

lstchain_tune_nsb \
--input-mc ${MCFILE} \
--input-data ${DL1DATA} \
--config ${CONFIG} \
--output-file ${OUTPUTPATH} \
--overwrite
