#!/bin/sh
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
CONDADIR=$(dirname `which conda`)
source ${CONDADIR}/../etc/profile.d/conda.sh
conda activate $1
#conda info
LSTCHAIN_VER=`conda list | grep lstchain | awk '{print $2}'`
echo "lstchain version = ${LSTCHAIN_VER}"

CMD=lstchain_dl1_to_dl2
DL1FILE=$2
OUTPUTDIR=$3
MODELDIR=$4
CONFIG=$5


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
