#!/bin/bash
#SBATCH -p short,long,xxl
#SBATCH -J DL2->DL3
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

DL2DATA=arg_infile_dl2_data
OUTDIR=arg_outdir_dl3
IRFFILE=arg_infile_irf
TOOLCONFIG=arg_infile_dl3_tool_config 
SOURCENAME="arg_str_source_name"


##########################
### COMMAND DEFINITION ###
##########################

### Case.1) just to tesh the python script
COMMAND_TEST="
    lstchain_create_dl3_file
    --help
"

### Case.2) full command
COMMAND="
    lstchain_create_dl3_file
    -d ${DL2DATA}
    -o ${OUTDIR}
    --input-irf ${IRFFILE}
    --config ${TOOLCONFIG}
    --source-name '${SOURCENAME}'
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

