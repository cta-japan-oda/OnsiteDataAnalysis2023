#!/bin/sh
#SBATCH -A aswg
#SBATCH -p short
#SBATCH -t 2:00:00
#SBATCH -J dl1_to_dl2
#SBATCH -N 1
#SBATCH -o log/out_%j.log
#SBATCH --mem=100G

ulimit -l unlimited
ulimit -s unlimited
ulimit -all

echo
source /home/kenta.terauchi/Work/anaconda3/etc/profile.d/conda.sh
conda activate lst-v0.9.10
#conda info
LSTCHAIN_VER=`conda list | grep lstchain | awk '{print $2}'`
echo "lstchain version = ${LSTCHAIN_VER}"

CMD=lstchain_dl1_to_dl2
DL1FILE=$1
OUTPUTDIR=$2
MODELDIR=$3
CONFIG=$4


echo 
echo "---- start ----"
date
echo

echo "command      = ${CMD}"
echo "dl1file      = ${DL1FILE}"
echo "output path  = ${OUTPUTDIR}"
echo "model path   = ${MODELDIR}"
echo "config       = ${CONFIG} "
echo 

${CMD} \
-f ${DL1FILE} \
-o ${OUTPUTDIR} \
-p ${MODELDIR} \
-c ${CONFIG}

echo
date
echo "---- finish ----"