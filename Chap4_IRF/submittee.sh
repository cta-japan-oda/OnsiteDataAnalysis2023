#!/bin/bash

###################
### PREPARATION ###
###################

### "you are here"
BASEDIR=`echo $(cd "$(dirname "$0")" && pwd)`
### print functions
function green () {
    printf "\e[32m%s\e[m \n" "$1"
}
function yellow () {
    printf "\e[33m%s\e[m \n" "$1"
}
function magenta () {
    printf "\e[35m%s\e[m \n" "$1"
}
function get_now() {
    TZ=Asia/Tokyo date '+%H:%M:%S %Y%b%d'
}
### start
start_time=`date +%s`
yellow "Starting the job at `get_now`"


##########################
### PYTHON ENVIRONMENT ###
##########################

### activate conda itself
# source /fefs/aswg/software/conda/etc/profile.d/conda.sh
source "/home/shotaro.abe/work/anaconda3/etc/profile.d/conda.sh"
### specify the environment
env_name=lstchain_v0.9.9
conda activate ${env_name}
green "[CONDA INFO]"
conda info
green "[ENVIRONMENT]"
conda list -n ${env_name}


##############
### INPUTs ###
##############

DL2GAMMA="/fefs/aswg/data/mc/DL2/AllSky/20230315_src_dec2276_tuned_nsb/TestingDataset\
/dec_2276/node_theta_10.0_az_102.199_/\
dl2_20230315_src_dec2276_tuned_nsb_node_theta_10.0_az_102.199__merged.h5"
TOOLCONFIG=${BASEDIR}/irf_tool_config_example.json
IRFOUTDIR=${BASEDIR}


##########################
### COMMAND DEFINITION ###
##########################

### you can find command examples:
### https://github.com/cta-observatory/cta-lstchain/blob/v0.9.13/lstchain/tools/lstchain_create_irf_files.py
### just to tesh the python script
COMMAND_TEST="
    lstchain_create_irf_files
    --help
"
### full command
COMMAND="
    lstchain_create_irf_files
    --input-gamma-dl2 ${DL2GAMMA}
    --output-irf-file "${IRFOUTDIR}/irf.fits.gz"
    --config ${TOOLCONFIG}
    --energy-dependent-gh
"


#################
### EXECUTION ###
#################

magenta "---- PYTHON COMMAND STARTING -----"
echo "${COMMAND_TEST}"
${COMMAND_TEST}
magenta "----- PYTHON COMMAND ENDED -----"

###############
### WRAP UP ###
###############

### deactivation
conda deactivate
### end time
yellow "Ending the job at `get_now`"
end_time=`date +%s`
run_time=$((end_time - start_time))
echo "running time:" $run_time "[sec]"

