#!/bin/bash
#SBATCH -p short,long,xxl
#SBATCH -J IRF
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=10G
#SBATCH -o joblogdir/%j.out


###################
### PREPARATION ###
###################

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
source "/fefs/aswg/workspace/shotaro.abe/anaconda3/etc/profile.d/conda.sh"
### specify the environment
ENVNAME=lstchain_v0.9.9
conda activate ${ENVNAME}
green "[CONDA INFO]"
conda info
green "[ENVIRONMENT]"
conda list -n ${ENVNAME}


##############
### INPUTs ###
##############

DL2GAMMA="arg_infile_dl2_gamma"
TOOLCONFIG="arg_infile_dl3_tool_config"
IRFOUTDIR="arg_outdir_irf"


##########################
### COMMAND DEFINITION ###
##########################

### you can find command examples here:
### https://github.com/cta-observatory/cta-lstchain/blob/v0.9.13/lstchain/tools/lstchain_create_irf_files.py

### Case.1) just to tesh the python script
COMMAND_TEST="
    lstchain_create_irf_files
    --help
"

### Case.2) full command
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
eval ${COMMAND_TEST}
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

