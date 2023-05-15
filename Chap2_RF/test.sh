#!/bin/bash
#SBATCH -p xxl
#SBATCH -J trainRF
#SBATCH -N 4
#SBATCH -n 1
#SBATCH --mem=10G
#SBATCH -o %j.out
#--exclusive


###################
### PREPARATION ###
###################

### memory usage
# ulimit -l unlimited
# ulimit -s unlimited
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

MC_GAMMA="arg_path_training_gamma"
MC_PROTON="arg_path_training_proton"
CONFIG="arg_path_lstchain_config"
MODEL_OUTPUT_DIR="arg_path_model_outdir"


##########################
### COMMAND DEFINITION ###
##########################

COMMAND_TEST="
    lstchain_mc_trainpipe
    --help
"
COMMAND="
    lstchain_mc_trainpipe
    --input-file-gamma=${MC_GAMMA}
    --input-file-proton=${MC_PROTON}
    --output-dir=${MODEL_OUTPUT_DIR}
    --config=${CONFIG}
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

