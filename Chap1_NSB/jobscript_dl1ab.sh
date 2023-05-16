#!/bin/sh
#SBATCH -A aswg
#SBATCH -p short
#SBATCH -t 2:00:00
#SBATCH -J dl1ab
#SBATCH -N 1
#SBATCH -o log/out_%j.log
#SBATCH --mem=50G

ulimit -l unlimited
ulimit -s unlimited
ulimit -all

echo
source /home/${USER}/Work/anaconda3/etc/profile.d/conda.sh
conda activate lst-v0.9.10
#conda info
LSTCHAIN_VER=`conda list | grep lstchain | awk '{print $2}'`
echo "lstchain version = ${LSTCHAIN_VER}"

CMD=lstchain_dl1ab
DL1FILE=$1
OUTPUTPATH=$2
CONFIG=$3

echo 
echo "---- start ----"
date
echo

echo "command     = ${CMD}"
echo "dl1file     = ${DL1FILE}"
echo "output file = ${OUTPUTPATH}"
echo "config      = ${CONFIG} "
echo 

${CMD} \
-f ${DL1FILE} \
-o ${OUTPUTPATH} \
-c ${CONFIG}

echo
date
echo "---- finish ----"