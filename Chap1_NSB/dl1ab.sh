#!/bin/sh
#
# usage: lstchain_dl1ab [-h] -f INPUT_FILE -o OUTPUT_FILE [-c CONFIG_FILE] [--no-image] [--no-pedestal-cleaning]
#
#

# Input DL1 file 
DL1FILE=`ls /fefs/aswg/data/real/DL1/20*/v*/tailcut84/dl1_LST-1.Run09686.0000.h5`

# Output file path
OUTPUTDIR=output
OUTPUTFILE=`basename ${DL1FILE}`

# Config file
CONFIG=standard_config.json


if [ ! -d ${OUTPUTDIR} ]; then
    mkdir -p ${OUTPUTDIR}
fi

lstchain_dl1ab \
-f ${DL1FILE} \
-o ${OUTPUTDIR}/${OUTPUTFILE} \
-c ${CONFIG}

#
#
#
#
#
#