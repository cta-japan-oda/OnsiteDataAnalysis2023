#!/bin/sh
#
# usage: lstchain_dl1_to_dl2 [-h] --input-file INPUT_FILE [--path-models PATH_MODELS] [--output-dir OUTPUT_DIR] [--config CONFIG_FILE]
#
#

##### Config #####

# Input DL1 file 
##  DL1 file processed by onsite analysis
DL1FILE=`ls /fefs/aswg/data/real/DL1/20*/v*/tailcut84/dl1_LST-1.Run09687.0000.h5`
##  DL1 file that you have created on your own
#DL1FILE=<PATH TO YOUR DL1FILE>

# Path to the trained Random Forest (RF)
##  RF model from AllSky MC
MODELDIR=/fefs/aswg/data/models/AllSky/20230127_v0.9.12_base_prod_az_tel/dec_2276/
##  RF model that you have created on your own
#MODELDIR=<PATH TO YOUR RF>

# Output directory
OUTPUTDIR=output

# Config file
CONFIG=dl1_to_dl2_standard_config.json

# Job system
FLAG_JOB=true  # true or false
JOBSCRIPT=jobscript_dl1_to_dl2.sh
JOBLOGDIR=log


##### Execution #####

if [ $FLAG_JOB == false ]; then

    lstchain_dl1_to_dl2 \
    -f ${DL1FILE} \
    -o ${OUTPUTDIR} \
    -p ${MODELDIR} \
    -c ${CONFIG}

elif [ $FLAG_JOB == true ]; then

    if [ ! -d ${JOBLOGDIR} ]; then
        mkdir -p ${JOBLOGDIR}
    fi

    sbatch ${JOBSCRIPT} \
    ${DL1FILE} \
    ${OUTPUTDIR} \
    ${MODELDIR} \
    ${CONFIG}

fi
