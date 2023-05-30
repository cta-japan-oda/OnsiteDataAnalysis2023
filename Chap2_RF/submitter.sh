#!/bin/bash

#################
### ARGUMENTs ###
#################

BASEDIR=`echo $(cd "$(dirname "$0")" && pwd)`
DL1BASEDIR="/fefs/aswg/data/mc/DL1/AllSky/20230315_src_dec2276_tuned_nsb/TrainingDataset/dec_2276"
DL1GAMMA="${DL1BASEDIR}/GammaDiffuse/node_corsika_theta_16.087_az_108.090_/dl1_simtel_corsika_theta_16.087_az_108.090_run1.h5"
DL1PROTON="${DL1BASEDIR}/Protons/node_theta_16.087_az_108.090_/dl1_simtel_corsika_theta_16.087_az_108.090_run1.h5"
CONFIG=${BASEDIR}/lstchain_config_example.json
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
    -e "s:arg_infile_dl1_gamma:${DL1GAMMA}:g" \
    -e "s:arg_infile_dl1_proton:${DL1PROTON}:g" \
    -e "s:arg_infile_lstchain_config:${CONFIG}:g" \
    -e "s:arg_outdir_random_forests:${OUTDIR}:g" \
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

