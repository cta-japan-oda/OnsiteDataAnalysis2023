#!/bin/sh
#
# usage: lstchain_dl1ab [-h] -f INPUT_FILE -o OUTPUT_FILE [-c CONFIG_FILE] [--no-image] [--no-pedestal-cleaning]
#
#

##### Config #####

# Input DL1 file 
DL1FILE=`ls /fefs/aswg/data/real/DL1/20*/v*/tailcut84/dl1_LST-1.Run09686.0000.h5`

# Output directory
OUTPUTDIR=output

# Output filename (It is same as the input file in this example)
OUTPUTFILE=`basename ${DL1FILE}`

# Config file
CONFIG=dl1ab_standard_config.json

# Job system
FLAG_JOB=false  # true or false
JOBSCRIPT=jobscript_dl1ab.sh
JOBLOGDIR=log


###### Execution #####

if [ ! -d ${OUTPUTDIR} ]; then
    mkdir -p ${OUTPUTDIR}
fi

if [ $FLAG_JOB == false ]; then

    lstchain_dl1ab \
    -f ${DL1FILE} \
    -o ${OUTPUTDIR}/${OUTPUTFILE} \
    -c ${CONFIG}

elif [ $FLAG_JOB == true ]; then

    if [ ! -d ${JOBLOGDIR} ]; then
        mkdir -p ${JOBLOGDIR}
    fi

    sbatch ${JOBSCRIPT} \
    ${DL1FILE} \
    ${OUTPUTDIR}/${OUTPUTFILE} \
    ${CONFIG}

fi

#
#
#
#
#