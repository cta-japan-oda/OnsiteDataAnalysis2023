#!/bin/bash

#################
### ARGUMENTs ###
#################

BASEDIR=`echo $(cd "$(dirname "$0")" && pwd)`
DL2DATA="/fefs/aswg/data/real/DL2/20201120/v0.7.1/tailcut84/dl2_LST-1.Run02967.h5"
IRFFILE="/fefs/aswg/data/mc/IRF/AllSky/20230315_src_dec2276_tuned_nsb/TestingDataset/dec_2276/node_theta_14.984_az_355.158_/irf_20230315_src_dec2276_tuned_nsb_node_theta_14.984_az_355.158_.fits.gz"
TOOLCONFIG=${BASEDIR}/../Chap4_IRF/irf_tool_config_example.json
OUTDIR=${BASEDIR}/
SOURCENAME="Crab Nebula"


##############################
### SCRIPT to be SUBMITTED ###
##############################

SCRIPTSUB="./submittee.sh"
SCRIPTTEMP="./sub_temp.sh"


########################
### JOBLOG DIRECTORY ###
########################

BASEDIR=`echo $(cd "$(dirname "$0")" && pwd)`
DATE=`date +%Y%b%d`
JOBLOGDIR="${BASEDIR}/joblog/${DATE}"
mkdir -p ${JOBLOGDIR}


########################
### TEMPORARY SCRIPT ###
########################

### make a temporary file with arguments replaced
sed -e "s:joblogdir:${JOBLOGDIR}:g" \
    -e "s:arg_infile_dl2_data:${DL2DATA}:g" \
    -e "s:arg_infile_irf:${IRFFILE}:g" \
    -e "s:arg_infile_dl3_tool_config:${TOOLCONFIG}:g" \
    -e "s:arg_outdir_dl3:${OUTDIR}:g" \
    -e "s:arg_str_source_name:${SOURCENAME}:g" \
    ${SCRIPTSUB} > ${SCRIPTTEMP}


#################
### EXECUTION ###
#################

### dislay ###
cat $SCRIPTTEMP

### COMMAND LINE ###
# exec 1>>$JOBLOGDIR/stdout.log
# exec 2>>$JOBLOGDIR/stderr.log
# sh $SCRIPTTEMP

### BATCH JOB ###
# sbatch $SCRIPTTEMP


###############
### WRAP UP ###
###############

### remove the temporary job script
rm $SCRIPTTEMP

