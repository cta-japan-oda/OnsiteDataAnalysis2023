#!/bin/bash

#################
### ARGUMENTs ###
#################

BASEDIR=`echo $(cd "$(dirname "$0")" && pwd)`
DL2GAMMA="/fefs/aswg/data/mc/DL2/AllSky/20230315_src_dec2276_tuned_nsb/TestingDataset\
/dec_2276/node_theta_10.0_az_102.199_/\
dl2_20230315_src_dec2276_tuned_nsb_node_theta_10.0_az_102.199__merged.h5"
TOOLCONFIG=${BASEDIR}/irf_tool_config_example.json
OUTDIR=${BASEDIR}/


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
    -e "s:arg_infile_dl2_gamma:${DL2GAMMA}:g" \
    -e "s:arg_infile_dl3_tool_config:${TOOLCONFIG}:g" \
    -e "s:arg_outdir_irf:${OUTDIR}:g" \
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

